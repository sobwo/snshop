package com.myteam.myapp.persistance;

import java.util.HashMap;

import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.RefundVo;

public interface MemberService_Mapper {
	//로그인,회원가입
	public int memberInsert(MemberVo mv);
	public int memberSelectSocialCnt(String memberId, String social);
	public int memberInsertSocial(MemberVo mv);
	public int memberIdCheck(String memberId);
	public MemberVo memberLogin(String memberId);
	
	//찾기
	public String searchIdPhone(String memberName, String memberPhone);
	public String searchIdEmail(String memberName, String memberEmail);
	public int searchPwPhone(String memberId, String memberName, String memberPhone);
	public int searchPwEmail(String memberId, String memberName, String memberEmail);
	public int memberPwChange(String memberId, String memberPw);
	public MemberVo memberInfo(int memberNo);
	
	//프로필사진
	public int updateProfileImg(MemberVo mv);
	public String profileImgShow(int memberNo);
	public int profileImgDelete(int memberNo);
	
	//회원정보변경
	public int modifyPw(HashMap<String, Object> map);
	public int modifyName(HashMap<String, Object> map);
	public int modifyEmail(HashMap<String, Object> map);
	public int modifyPhone(HashMap<String, Object> map);
	public int modifyGender(HashMap<String, Object> map);
	
	//회원별 판매계좌
	public int insertAccount(RefundVo rv);
	public RefundVo selectAccount(int memberNo);
	public int modifyAccount(RefundVo rv);
}
