package com.myteam.myapp.persistance;

import java.util.HashMap;

import com.myteam.myapp.domain.MemberVo;

public interface MemberService_Mapper {
	public int memberInsert(MemberVo mv);
	public int memberIdCheck(String memberId);
	public MemberVo memberLogin(String memberId);
	public String searchIdPhone(String memberName, String memberPhone);
	public String searchIdEmail(String memberName, String memberEmail);
	public int searchPwPhone(String memberId, String memberName, String memberPhone);
	public int searchPwEmail(String memberId, String memberName, String memberEmail);
	public int memberPwChange(String memberId, String memberPw);
	public MemberVo memberInfo(int memberNo);
	public int updateProfileImg(MemberVo mv);
	public String profileImgShow(int memberNo);
	public int profileImgDelete(int memberNo);
	public int modifyPw(HashMap<String, Object> map);
	public int modifyName(HashMap<String, Object> map);
	public int modifyEmail(HashMap<String, Object> map);
	public int modifyPhone(HashMap<String, Object> map);
	public int modifyGender(HashMap<String, Object> map);
}
