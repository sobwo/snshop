package com.myteam.myapp.domain;

public class GoodsVo {
	
	private int goodsNo, price, interestNum, memberNo;

	private String goodsName, modelNum, releaseDate, color, category, categoryName, goodsBrandName, goodsEng, productImg,goodsGender;

	
	
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getGoodsBrandName() {
		return goodsBrandName;
	}
	public void setGoodsBrandName(String goodsBrandName) {
		this.goodsBrandName = goodsBrandName;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public String getGoodsEng() {
		return goodsEng;
	}
	public void setGoodsEng(String goodsEng) {
		this.goodsEng = goodsEng;
	}
	public String getModelNum() {
		return modelNum;
	}
	public void setModelNum(String modelNum) {
		this.modelNum = modelNum;
	}
	public int getInterestNum() {
		return interestNum;
	}
	public void setInterestNum(int interestNum) {
		this.interestNum = interestNum;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getGoodsGender() {
		return goodsGender;
	}
	public void setGoodsGender(String goodsGender) {
		this.goodsGender = goodsGender;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}	
}
