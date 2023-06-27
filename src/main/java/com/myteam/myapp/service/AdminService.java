package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.AdminGoodsDto;
import com.myteam.myapp.domain.AdminSizeDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.OrderDto;

public interface AdminService {
	
	public int totalMemberNum();
	
	public int totalGoodsNum();
	
	public int totalRefund();
	
	public ArrayList<MemberVo> memberList();
	
	public ArrayList<OrderDto> orderList();
	
	public ArrayList<OrderDto> refundList();
	
	public ArrayList<AdminGoodsDto> goodsList();
	
	public ArrayList<AdminSizeDto> sizeList(int goodsNo);

}
