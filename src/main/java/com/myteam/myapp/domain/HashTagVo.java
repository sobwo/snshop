package com.myteam.myapp.domain;

public class HashTagVo extends Board_hashtagVo {
	private int hashTagNo;
	private String hashTagName;
	private String tagCnt;
	private String hwrtieday;
	private String contentsImg;
	
	public String getContentsImg() {
		return contentsImg;
	}
	public void setContentsImg(String contentsImg) {
		this.contentsImg = contentsImg;
	}
	public int getHashTagNo() {
		return hashTagNo;
	}
	public void setHashTagNo(int hashTagNo) {
		this.hashTagNo = hashTagNo;
	}
	public String getHashTagName() {
		return hashTagName;
	}
	public void setHashTagName(String hashTagName) {
		this.hashTagName = hashTagName;
	}
	public String getTagCnt() {
		return tagCnt;
	}
	public void setTagCnt(String tagCnt) {
		this.tagCnt = tagCnt;
	}
	public String getHwrtieday() {
		return hwrtieday;
	}
	public void setHwrtieday(String hwrtieday) {
		this.hwrtieday = hwrtieday;
	}
	
}
