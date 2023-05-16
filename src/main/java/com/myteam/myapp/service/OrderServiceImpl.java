package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.OrderVo;
import com.myteam.myapp.persistance.OrderService_Mapper;

@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService{
	
	private OrderService_Mapper osm;
	
	@Autowired
	public OrderServiceImpl(SqlSession sqlSession) {
		this.osm = sqlSession.getMapper(OrderService_Mapper.class);
	}

	@Override
	public int addressInsert(String basicName, String basicPhone, String basicAddrNum, String basicAddr,
			String basicAddrDetail, String basic_check, int memberNo) {
		AddressVo av = new AddressVo();
		
		av.setUserName(basicName);
		av.setAddressPhone(basicPhone);
		av.setZipCode(basicAddrNum);
		av.setAddress(basicAddr);
		av.setDetailAddress(basicAddrDetail);
		av.setMainAddress(basic_check);
		av.setMemberNo(memberNo);
		
		int value = osm.addressInsert(av);
		
		return value;
	}

	@Override
	public ArrayList<AddressVo> addressSelect(int memberNo) {
		ArrayList<AddressVo> alist = osm.addressSelect(memberNo);
		
		return alist;
	}

	@Override
	public AddressVo addressSelectOne(int addressNo) {

		AddressVo av = osm.addressSelectOne(addressNo);
		
		return av;
	}

	@Override
	public int addressDelete(int addressNo) {
		int value = osm.addressDelete(addressNo);
		
		return value;
	}

	@Override
	public int addressModify(int addressNo, String basicName, String basicPhone, String basicAddrNum, String basicAddr,
			String basicAddrDetail, String basic_check) {
		
		AddressVo av = new AddressVo();
		
		av.setAddressNo(addressNo);
		av.setUserName(basicName);
		av.setAddressPhone(basicPhone);
		av.setZipCode(basicAddrNum);
		av.setAddress(basicAddr);
		av.setDetailAddress(basicAddrDetail);
		av.setMainAddress(basic_check);
		
		int value = osm.addressModify(av);
		
		return value;
	}

	@Override
	public ArrayList<OrderVo> selectOrderAll(int memberNo) {
		ArrayList<OrderVo> alist = osm.selectOrderAll(memberNo);
		
		return alist;
	}

	@Override
	public ArrayList<OrderVo> selectOrderIng(int memberNo) {
		ArrayList<OrderVo> alist = osm.selectOrderIng(memberNo);
		
		return alist;
	}

}
