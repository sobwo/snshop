package com.myteam.myapp.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.RefundVo;
import com.myteam.myapp.persistance.MemberService_Mapper;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{
	private MemberService_Mapper msm;

	@Autowired
	public MemberServiceImpl(SqlSession sqlSession) {
		this.msm = sqlSession.getMapper(MemberService_Mapper.class);
	}

	@Override
	public int memberInsert(String memberId, String memberPw, String memberName, String memberEmail, String memberPhone,
			String memberGender) {
		MemberVo mv = new MemberVo();
		
		mv.setMemberId(memberId);
		mv.setMemberPw(memberPw);
		mv.setMemberName(memberName);
		mv.setMemberEmail(memberEmail);
		mv.setMemberPhone(memberPhone);
		mv.setMemberGender(memberGender);
		
		int value = msm.memberInsert(mv);
		
		return value;
	}
	
	@Override
	public int memberInsertSocial(String memberId, String memberName, String memberEmail, String memberPhone, String memberGender) {
		int cnt = msm.memberSelectSocialCnt(memberId,"social");
		int value = 0;
		MemberVo mv = new MemberVo();
		mv.setMemberId(memberId);
		mv.setMemberName(memberName);
		mv.setMemberEmail(memberEmail);
		mv.setMemberPhone(memberPhone);
		mv.setMemberGender(memberGender);
		
		if(cnt==0)
			value = msm.memberInsertSocial(mv);
		
		return value;
	}

	@Override
	public int memberIdCheck(String memberId) {
		int value = msm.memberIdCheck(memberId);
		return value;
	}

	@Override
	public MemberVo memberLogin(String memberId) {
		MemberVo mv = msm.memberLogin(memberId);
		return mv;
	}

	@Override
	public String searchEmailCheck(String memberName) {
		String memberEmail = msm.searchEmailCheck(memberName);
		
		return memberEmail;
	}
	
	@Override
	public String searchPhoneCheck(String memberName) {
		String memberPhone = msm.searchPhoneCheck(memberName);
		
		return memberPhone;
	}
	
	@Override
	public String searchId(String searchMeasure,String memberName_phone, String memberName_email, String memberPhone, String memberEmail) {
		String memberId = null;
		if(searchMeasure.equals("phone")) {
			memberId = msm.searchIdPhone(memberName_phone, memberPhone);
		}
		else if(searchMeasure.equals("email")) {
			memberId = msm.searchIdEmail(memberName_email, memberEmail);
		}
		
		return memberId;
	}

	@Override
	public int searchPw(String searchMeasure, String memberId_phone, String memberId_email, String memberName_phone, String memberName_email, String memberPhone,
			String memberEmail) {
		
		int value=0;
		
		if(searchMeasure.equals("phone")) {
			value = msm.searchPwPhone(memberId_phone, memberName_phone, memberPhone);
		}
		else if(searchMeasure.equals("email")) {
			value = msm.searchPwEmail(memberId_email, memberName_email, memberEmail);
		}
		
		return value;
	}

	@Override
	public int memberPwChange(String memberId, String memberPw) {
		int value = msm.memberPwChange(memberId, memberPw);
		
		return value;
	}

	@Override
	public MemberVo memberInfo(int memberNo) {
		MemberVo mv = msm.memberInfo(memberNo);
		
		return mv;
	}

	@Override
	public int updateProfileImg(MemberVo mv){
		int value = msm.updateProfileImg(mv);
		
		return value;
	}

	@Override
	public String profileImgShow(int memberNo) {
		String str = msm.profileImgShow(memberNo);
		
		return str;
	}

	@Override
	public int profileImgDelete(int memberNo) {
		int value = msm.profileImgDelete(memberNo);
		
		return value;
	}

	@Override
	public int modifyProfile(String index, String value, int memberNo) {
		HashMap<String, Object> map = new HashMap<>();
		int result=0;
		map.put("memberNo", memberNo);
		map.put("modifyValue", value);
		
		if(index.equals("pw")) {
			result=msm.modifyPw(map);
		}
		else if(index.equals("name")) {
			result=msm.modifyName(map);
		}
		else if(index.equals("email")) {
			result=msm.modifyEmail(map);
		}
		else if(index.equals("phone")) {
			result=msm.modifyPhone(map);
		}
		else if(index.equals("gender")) {
			result=msm.modifyGender(map);
		}
		
		return result;
	}

	@Override
	public int insertAccount(String ar_bankName, String ar_accountNum, String ar_name, int memberNo) {
		RefundVo rv = new RefundVo();
		
		rv.setAccountName(ar_bankName);
		rv.setAccountNum(ar_accountNum);
		rv.setAccountUserName(ar_name);
		rv.setMemberNo(memberNo);
		
		int value = msm.insertAccount(rv);
		
		return value;
	}

	@Override
	public RefundVo selectAccount(int memberNo) {
		RefundVo rv = msm.selectAccount(memberNo);
		
		return rv;
	}

	@Override
	public int modifyAccount(String ar_bankName, String ar_accountNum, String ar_name, int memberNo) {
		
		RefundVo rv = new RefundVo();
		
		rv.setAccountName(ar_bankName);
		rv.setAccountNum(ar_accountNum);
		rv.setAccountUserName(ar_name);
		rv.setMemberNo(memberNo);
		
		int value = msm.modifyAccount(rv);
		
		return value;
	}

}
