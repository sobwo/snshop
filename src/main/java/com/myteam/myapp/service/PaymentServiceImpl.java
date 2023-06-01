package com.myteam.myapp.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.domain.PayVo;
import com.myteam.myapp.persistance.PayService_Mapper;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Service("PaymentServiceImpl")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	OrderService os;
	@Autowired
	PointService ps;
	@Autowired
	PaymentService pms;
	
	private PayService_Mapper psm;
	
	@Autowired
	public PaymentServiceImpl(SqlSession sqlSession) {
		
		this.psm = sqlSession.getMapper(PayService_Mapper.class);
	}
	
	@Override
	public int payInsert(String bankName,String bankNum, int totalPrice, String date, String holder, int orderNo,String payMethod) {
		PayVo vv = new PayVo();
		vv.setBankName(bankName);
		vv.setBankNum(bankNum);
		vv.setPrice(totalPrice);
		vv.setDate(date);
		vv.setHolder(holder);
		vv.setOrderNo(orderNo);
		vv.setPayMethod(payMethod);
		
		int value = psm.payInsert(vv);
		
		return value;
	}

	@Override
	public PayVo paySelectNew(int orderNo) {
		PayVo vv = psm.paySelectNew(orderNo);
		
		return vv;
	}

	
	@Override
	@Transactional
	public HashMap<String,Object> verifyPayment(IamportResponse<Payment> irsp, Map<String, String> map, int memberNo) {
		int value = 0;
    	int value2 = 0;
    	int value3 = 0;
		
		String orderNum = irsp.getResponse().getMerchantUid();
    	int totalPrice = Integer.parseInt(irsp.getResponse().getAmount().toString());
    	String status = irsp.getResponse().getStatus().toString();
    	String memberPhone = irsp.getResponse().getBuyerTel();
    	
    	String payMethod = irsp.getResponse().getPayMethod().toString();
    	String bankName = null;
    	String bankNum = null;
    	Date date_init = null;
    	
    	int goodsNo = Integer.parseInt(map.get("goodsNo"));
    	int price = Integer.parseInt(map.get("price"));
    	int addressNo = Integer.parseInt(map.get("addressNo"));
    	String payInfo = map.get("pay_info");
    	String size = map.get("size");
    	int point = Integer.parseInt(map.get("point"));
    	
    	String holder = null;
    	if(payMethod.equals("vbank")) {
    		bankName = irsp.getResponse().getVbankName();
	    	bankNum = irsp.getResponse().getVbankNum();
	    	date_init = irsp.getResponse().getVbankDate();
	    	holder = irsp.getResponse().getVbankHolder();
    	}
    	else {
    		bankName = irsp.getResponse().getBankName();
    		bankNum = irsp.getResponse().getCardNumber(); 
    	}
    	
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String date = format.format(date_init);

    	String statusDetail = null;
    	if(status.equals("ready")) statusDetail = "입금대기";
    	else statusDetail = "입금완료";
    	
    	int result = 0;
    	
    	if(irsp.getResponse().getAmount().toString().equals(price)) {
    		value = os.orderInsert(goodsNo, memberNo, orderNum, addressNo, totalPrice, payInfo, size, statusDetail, memberPhone);
    		value2 = ps.usePoint(memberNo, point, orderNum);
    		
    		if(value == 1) {
    			OrderDto od = os.orderSelectNew(orderNum);
    			value3 = pms.payInsert(bankName, bankNum, totalPrice, date, holder, od.getOrderNo(), payMethod);
    		}
    	}
    	
    	result = value2 + value3;
    	
    	HashMap<String,Object> hm = new HashMap<>();
    	hm.put("result", result);
    	hm.put("orderNum", orderNum);
    	
		return hm;
	}

	@Override
	public HashMap<String, Object> cancelPayment(IamportResponse<Payment> irsp, Map<String, String> map) {
		CancelData data = cancelData(irsp,map);
//		IamportResponse<Payment> cancel = irsp.cancelPaymentByImpUid(data);
		HashMap<String, Object> hm = new HashMap<String, Object>();
		return hm;
	}
	
	public CancelData cancelData(IamportResponse<Payment> irsp, Map<String, String> map) {
		
		CancelData data = new CancelData(irsp.getResponse().getImpUid(),true);
		data.setReason(map.get("reason"));
		data.setChecksum(new BigDecimal(map.get("checksum")));
		data.setRefund_holder(map.get("refundHolder"));
		data.setRefund_bank(code(map.get("bank_name")));
		
		return data;
	}
	
	public String code(String bankName) {
		String code="";
		if(bankName.equals("우리은행")||bankName.equals("우리")) code="20";
		else if(bankName.equals("국민은행")||bankName.equals("국민")) code="04";
		return code;
	}
	
}
