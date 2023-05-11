package com.myteam.myapp.service;

import com.myteam.myapp.domain.AddressVo;

public interface OrderService {
	public int addressInsert(String basicName, String basicPhone, String basicAddrNum, 
			String basicAddr, String basicAddrDetail, String basic_check,int memberNo);
	public AddressVo addressSelect(int memberNo); 
}
