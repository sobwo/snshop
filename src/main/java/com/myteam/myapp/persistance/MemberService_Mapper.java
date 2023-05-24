package com.myteam.myapp.persistance;

import java.util.HashMap;

import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.RefundVo;

public interface MemberService_Mapper {
	//濡쒓렇�씤,�쉶�썝媛��엯
	public int memberInsert(MemberVo mv);
	public int memberSelectSocialCnt(String memberId, String social);
	public int memberInsertSocial(MemberVo mv);
	public int memberIdCheck(String memberId);
	public MemberVo memberLogin(String memberId);
	
	//찾기
	public String searchPhoneCheck(String memberName);
	public String searchEmailCheck(String memberName);
	public String searchIdPhone(String memberName, String memberPhone);
	public String searchIdEmail(String memberName, String memberEmail);
	public int searchPwPhone(String memberId, String memberName, String memberPhone);
	public int searchPwEmail(String memberId, String memberName, String memberEmail);
	public int memberPwChange(String memberId, String memberPw);
	public MemberVo memberInfo(int memberNo);
	
	public int updateProfileImg(MemberVo mv);
	public String profileImgShow(int memberNo);
	public int profileImgDelete(int memberNo);
	
	//�쉶�썝�젙蹂대�寃�
	public int modifyPw(HashMap<String, Object> map);
	public int modifyName(HashMap<String, Object> map);
	public int modifyEmail(HashMap<String, Object> map);
	public int modifyPhone(HashMap<String, Object> map);
	public int modifyGender(HashMap<String, Object> map);
	
	//�쉶�썝蹂� �뙋留ㅺ퀎醫�
	public int insertAccount(RefundVo rv);
	public RefundVo selectAccount(int memberNo);
	public int modifyAccount(RefundVo rv);
	
	/* public ArrayList<> */
}
