package com.myteam.myapp.domain;

public class BoardVo extends MemberVo{
	private int boardNo;
	private String contents; 
	private String contentsImg; 
	private String delYn; 
	private String writeday; 
	private String likeCnt;
	private String viewCnt;
	private int memberNo;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getContentsImg() {
		return contentsImg;
	}
	public void setContentsImg(String contentsImg) {
		this.contentsImg = contentsImg;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(String likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(String viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
}
