package com.myteam.myapp.domain;

public class FollowingVo {
	private int memberNo,followingMemberNo;
	
	private int followingCheck;
	

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getFollowingMemberNo() {
		return followingMemberNo;
	}

	public void setFollowingMemberNo(int followingMemberNo) {
		this.followingMemberNo = followingMemberNo;
	}

	public int getFollowingCheck() {
		return followingCheck;
	}

	public void setFollowingCheck(int followingCheck) {
		this.followingCheck = followingCheck;
	}
	
	
}
