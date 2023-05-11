package com.myteam.myapp.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.AddressVo;
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

}
