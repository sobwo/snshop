package com.myteam.myapp.domain;

public class CommentDto extends MemberVo{
	private int commentNo; 
	private String ccontents; 
	private String cwriteday;
	private int boardNo; 
	private int memberNo;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getCcontents() {
		return ccontents;
	}
	public void setCcontents(String ccontents) {
		this.ccontents = ccontents;
	}
	public String getCwriteday() {
		return cwriteday;
	}
	public void setCwriteday(String cwriteday) {
		this.cwriteday = cwriteday;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
}
