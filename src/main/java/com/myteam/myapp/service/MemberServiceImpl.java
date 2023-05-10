package com.myteam.myapp.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.MemberVo;
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

}
