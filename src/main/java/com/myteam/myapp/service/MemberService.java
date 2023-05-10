package com.myteam.myapp.service;

import com.myteam.myapp.domain.MemberVo;

public interface MemberService {
	public int memberInsert(String memberId, String memberPw, String memberName, String memberEmail, String memberPhone, String memberGender);
	public int memberIdCheck(String memberId);
	public MemberVo memberLogin(String memberId);
	public String searchId(String searchMeasure,String memberName_phone, String memberName_email, String memberPhone, String memberEmail);
	public int searchPw(String searchMeasure, String memberId_phone, String memberId_email, String memberName_phone, String memberName_email, String memberPhone,String memberEmail);
	public int memberPwChange(String memberId, String memberPw);
	public MemberVo memberInfo(int memberNo);
	public int updateProfileImg(MemberVo mv);
}
