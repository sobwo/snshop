package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.AddressVo;

public interface OrderService {
	public int addressInsert(String basicName, String basicPhone, String basicAddrNum, 
			String basicAddr, String basicAddrDetail, String basic_check,int memberNo);
	public ArrayList<AddressVo> addressSelect(int memberNo); 
	public AddressVo addressSelectOne(int addressNo);
	public int addressDelete(int addressNo);
}
