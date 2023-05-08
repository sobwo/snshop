package com.myteam.myapp.domain;

public class InventoryVo {
	
	private int inventoryNo;
	private String quantity;
	private int sizeNo;
	private int goodsNo;
	
	public int getInventoryNo() {
		return inventoryNo;
	}
	public void setInventoryNo(int inventoryNo) {
		this.inventoryNo = inventoryNo;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public int getSizeNo() {
		return sizeNo;
	}
	public void setSizeNo(int sizeNo) {
		this.sizeNo = sizeNo;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

}
