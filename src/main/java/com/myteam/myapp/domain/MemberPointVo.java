package com.myteam.myapp.domain;

/*
 * public class MemberPointVo{ private int pointNo, memberNo;
 * 
 * private int avaPoint,expPoint; public int getPointNo() { return pointNo; }
 * public void setPointNo(int pointNo) { this.pointNo = pointNo; } public int
 * getMemberNo() { return memberNo; } public void setMemberNo(int memberNo) {
 * this.memberNo = memberNo; } public int getAvaPoint() { return avaPoint; }
 * public void setAvaPoint(int avaPoint) { this.avaPoint = avaPoint; } public
 * int getExpPoint() { return expPoint; } public void setExpPoint(int expPoint)
 * { this.expPoint = expPoint; }
 * 
 * 
 * }
 */

public class MemberPointVo{
	
	private int memberPointNo;
	private int avaPoint;
	private int exaPoint;
	
	private int memberNo;

	public int getMemberPointNo() {
		return memberPointNo;
	}

	public void setMemberPointNo(int memberPointNo) {
		this.memberPointNo = memberPointNo;
	}

	public int getAvaPoint() {
		return avaPoint;
	}

	public void setAvaPoint(int avaPoint) {
		this.avaPoint = avaPoint;
	}

	public int getExaPoint() {
		return exaPoint;
	}

	public void setExaPoint(int exaPoint) {
		this.exaPoint = exaPoint;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	
}