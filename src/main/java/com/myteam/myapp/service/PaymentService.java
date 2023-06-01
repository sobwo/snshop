package com.myteam.myapp.service;

import java.util.HashMap;
import java.util.Map;

import com.myteam.myapp.domain.PayVo;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

public interface PaymentService {
	
	public int payInsert(String bankName,String bankNum, int totalPrice, String date, String holder, int orderNo, String payMethod);
	public PayVo paySelectNew(int orderNo);
	public HashMap<String, Object> verifyPayment(IamportResponse<Payment> irsp, Map<String,String> map, int memberNo);
	public HashMap<String, Object> cancelPayment(IamportResponse<Payment> irsp, Map<String,String> map);
}
