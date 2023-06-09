package com.myteam.myapp.domain;

public class ProductDto extends GoodsVo{
	private int imgNo, goodsNo,memberNo;
	private String imgFileName;
	private int interestCheck, checkM;
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public int getInterestCheck() {
		return interestCheck;
	}
	public void setInterestCheck(int interestCheck) {
		this.interestCheck = interestCheck;
	}
	public int getCheckM() {
		return checkM;
	}
	public void setCheckM(int checkM) {
		this.checkM = checkM;
	}
	
}
