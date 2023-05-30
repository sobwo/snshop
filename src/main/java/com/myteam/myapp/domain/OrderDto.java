package com.myteam.myapp.domain;

public class OrderDto extends GoodsVo{	
	private int orderNo;
	private String payInfo ;
	private int totalPrice; 
	private String orderNum; 
	private int addressNo ;
	private int goodsNo; 
	private int memberNo;

	private String orderDays;
	private String size;
	private String pors;
	private String orderStatus;
	private String statusDetail;
	private String orderstatus;
	private String memberPhone;
	
	public String getOrderDays() {
		return orderDays;
	}
	public void setOrderDays(String orderDays) {
		this.orderDays = orderDays;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getPors() {
		return pors;
	}
	public void setPors(String pors) {
		this.pors = pors;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getStatusDetail() {
		return statusDetail;
	}
	public void setStatusDetail(String statusDetail) {
		this.statusDetail = statusDetail;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getPayInfo() {
		return payInfo;
	}
	public void setPayInfo(String payInfo) {
		this.payInfo = payInfo;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
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
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
}
