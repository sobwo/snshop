package com.myteam.myapp.service;

import com.myteam.myapp.domain.PayVo;

public interface PaymentService {
	
	public int payInsert(String bankName,String bankNum, int totalPrice, String date, String holder, int orderNo);
	public PayVo paySelectNew(int orderNo);
}
