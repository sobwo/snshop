package com.myteam.myapp.domain;

public class SizeDto extends InterestVo{
	private int sizeNo;
	private String sizeName; 
	private	int goodsNo;
	
	public int getSizeNo() {
		return sizeNo;
	}
	public void setSizeNo(int sizeNo) {
		this.sizeNo = sizeNo;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	
}
