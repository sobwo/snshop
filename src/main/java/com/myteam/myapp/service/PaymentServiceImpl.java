package com.myteam.myapp.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.PayVo;
import com.myteam.myapp.persistance.OrderService_Mapper;
import com.myteam.myapp.persistance.PayService_Mapper;

@Service("PaymentServiceImpl")
public class PaymentServiceImpl implements PaymentService{
	
	private PayService_Mapper psm;
	
	@Autowired
	public PaymentServiceImpl(SqlSession sqlSession) {
		
		this.psm = sqlSession.getMapper(PayService_Mapper.class);
	}
	
	@Override
	public int payInsert(String bankName,String bankNum, int totalPrice, String date, String holder, int orderNo) {
		PayVo vv = new PayVo();
		vv.setBankName(bankName);
		vv.setBankNum(bankNum);
		vv.setPrice(totalPrice);
		vv.setDate(date);
		vv.setHolder(holder);
		vv.setOrderNo(orderNo);
		
		int value = psm.payInsert(vv);
		
		return value;
	}

	@Override
	public PayVo paySelectNew(int orderNo) {
		PayVo vv = psm.paySelectNew(orderNo);
		
		return vv;
	}
}
