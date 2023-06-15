package com.myteam.myapp.domain;

public class ProductDto extends GoodsVo{
	private int imgNo, goodsNo,memberNo, interestMemberNo;
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
	public int getInterestMemberNo() {
		return interestMemberNo;
	}
	public void setInterestMemberNo(int interestMemberNo) {
		this.interestMemberNo = interestMemberNo;
	}
	
	
}
