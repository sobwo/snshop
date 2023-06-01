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
import com.myteam.myapp.domain.RefundVo;
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
		if(bankName.contains("국민")) code="004";
		else if(bankName.contains("SC")|| bankName.contains("SC제일")) code="023";
		else if(bankName.contains("경남")) code="039";
		else if(bankName.contains("광주")) code="034";
		else if(bankName.contains("기업")) code="003";
		else if(bankName.contains("농협")) code="011";
		else if(bankName.contains("대구")) code="031";
		else if(bankName.contains("부산")) code="032";
		else if(bankName.contains("산업")) code="002";
		else if(bankName.contains("새마을금고")) code="045";
		else if(bankName.contains("수협")) code="007";
		else if(bankName.contains("신한")) code="088";
		else if(bankName.contains("신협")) code="048";
		else if(bankName.contains("외환")) code="081";
		else if(bankName.contains("우리")) code="020";
		else if(bankName.contains("우체국")) code="071";
		else if(bankName.contains("전북")) code="037";
		else if(bankName.contains("축협")) code="012";
		else if(bankName.contains("카카오")) code="090";
		else if(bankName.contains("케이")) code="089";
		else if(bankName.contains("하나")) code="081";
		else if(bankName.contains("한국씨티")) code="027";
		else if(bankName.contains("토스")) code="092";

		return code;
	}

	@Override
	public RefundVo refundSelect(int memberNo) {
		RefundVo rv = psm.refundSelect(memberNo);
		return rv;
	}
	
}
