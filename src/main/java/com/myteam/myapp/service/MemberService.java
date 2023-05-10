package com.myteam.myapp.service;

public interface MemberService {
	public int memberInsert(String memberId, String memberPw, String memberName, String memberEmail, String memberPhone, String memberGender);
	public int memberIdCheck(String memberId);
}
