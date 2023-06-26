package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.AdminGoodsDto;
import com.myteam.myapp.domain.AdminSizeDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.persistance.AdminService_Mapper;

@Service("AdminServiceImpl")
public class AdminServiceImpl implements AdminService {
	
	private AdminService_Mapper asm;
	@Autowired
	public AdminServiceImpl(SqlSession sqlSession) {
		this.asm =sqlSession.getMapper(AdminService_Mapper.class);
	}
	
	@Override
	public int totalMemberNum() {
		
		int total = asm.totalMemberNum();
		
		return total;
	}
	
	@Override
	public int totalGoodsNum() {
		int total = asm.totalGoodsNum();
		
		return total;		
	}

	@Override
	public int totalRefund() {
		int total = asm.totalRefund();
		
		return total;
	}

	@Override
	public ArrayList<MemberVo> memberList() {
		
		ArrayList<MemberVo> mvList = asm.memberList();
		
		return mvList;
	}
	
	@Override
	public ArrayList<AdminGoodsDto> goodsList() {
		
		ArrayList<AdminGoodsDto> gvList = asm.goodsList();
		
		return gvList;
	}

	@Override
	public ArrayList<AdminSizeDto> sizeList(int goodsNo) {
		
		ArrayList<AdminSizeDto> svList = asm.sizeList(goodsNo);
		
		return svList;
	}
	
	@Override
	public ArrayList<OrderDto> orderList() {

		ArrayList<OrderDto>odList = asm.orderList();
		
		return odList;
	}

	@Override
	public ArrayList<OrderDto> refundList() {
		
		ArrayList<OrderDto> rfList = asm.refundList();
		
		return rfList;
	}


	
}
