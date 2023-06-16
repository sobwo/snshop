package com.myteam.myapp.domain;

public class CommentDto extends MemberVo{
	private int commentNo; 
	private String ccontents; 
	private String cwriteday;
	private int boardNo; 
	private int memberNo;
	private int rc_level;
	private int recommentNo;
	
	public int getRc_level() {
		return rc_level;
	}
	public void setRc_level(int rc_level) {
		this.rc_level = rc_level;
	}
	public int getRecommentNo() {
		return recommentNo;
	}
	public void setRecommentNo(int recommentNo) {
		this.recommentNo = recommentNo;
	}
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
