package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.domain.OrderVo;
import com.myteam.myapp.domain.PointVo;
import com.myteam.myapp.persistance.OrderService_Mapper;

@Service("orderServiceImpl")
public class OrderServiceImpl implements OrderService {

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

		int value = osm.addressCheckReset(memberNo);
		int value2 = osm.addressInsert(av);

		return value + value2;

		/*
		 * int value = osm.addressInsert(av);
		 * 
		 * return value;
		 */
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
	public AddressVo addressOrderPage(int memberNo) {
		AddressVo av = osm.addressOrderPage(memberNo);
		return av;
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
	public OrderDto purchaseInfo(int memberNo) {
		OrderDto od = osm.purchaseInfo(memberNo);
		return od;
	}

	@Override
	public OrderDto saleInfo(int memberNo) {
		OrderDto od = osm.saleInfo(memberNo);
		return od;
	}

	@Override
	public ArrayList<OrderDto> selectHistoryAll(String index, int memberNo, int value, String startDate, String endDate,
			String filter, String price) {
		ArrayList<OrderDto> alist = osm.selectHistoryAll(index, memberNo, value, startDate, endDate, filter, price);

		return alist;
	}

	@Override
	public int cntHistoryAll(String index, int memberNo, int value, String startDate, String endDate) {
		int cnt = osm.cntHistoryAll(index, memberNo, value, startDate, endDate);

		return cnt;
	}
	
	@Transactional
	@Override
	public int orderInsert(int goodsNo, int memberNo, String orderNum, int addressNo, int totalPrice, String payInfo,
			String size, String statusDetail, String memberPhone) {
		OrderVo ov = new OrderVo();
		ov.setGoodsNo(goodsNo);
		ov.setMemberNo(memberNo);
		ov.setTotalPrice(totalPrice);
		ov.setPayInfo(payInfo);
		ov.setSize(size);
		ov.setOrderNum(orderNum);
		ov.setMemberPhone(memberPhone);
		ov.setStatusDetail(statusDetail);

		AddressVo av = osm.addressSelectOne(addressNo);
		String address = av.getZipCode()+" "+av.getAddress()+" "+av.getDetailAddress();
		
		ov.setAddress(address);
		
		int value = osm.orderInsert(ov);

		return value;
	}

	@Override
	public OrderDto orderSelectNew(String orderNum) {
		System.out.println("orderNum" + orderNum);

		OrderDto od = osm.orderSelectNew(orderNum);
		System.out.println("od" + od);
		return od;
	}

	@Override
	public OrderDto orderHistoryShow(int orderNo) {
		OrderDto value = osm.orderHistoryShow(orderNo);
		return value;
	}

	@Override
	public int orderCancel(OrderVo ov) {
		int value = osm.orderCancel(ov);
		return value;
	}




	@Override
	public int insertPPoint(int finishPoint, int memberNo, String orderNum) {
		PointVo pv = new PointVo();
		pv.setMemberNo(memberNo);
		pv.setPoint(finishPoint);
		pv.setUseDetail(orderNum);
		int value = osm.insertPPoint(pv);
		
		
		
		return value;
	}



	


}
