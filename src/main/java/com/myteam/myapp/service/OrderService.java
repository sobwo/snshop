package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.OrderVo;

public interface OrderService {
	public int addressInsert(String basicName, String basicPhone, String basicAddrNum, 
			String basicAddr, String basicAddrDetail, String basic_check,int memberNo);
	public ArrayList<AddressVo> addressSelect(int memberNo); 
	public AddressVo addressSelectOne(int addressNo);
	public int addressDelete(int addressNo);
	public int addressModify(int addressNo, String basicName, String basicPhone, String basicAddrNum, 
			String basicAddr, String basicAddrDetail, String basic_check);
	
	public ArrayList<OrderVo> selectOrderAll(int memberNo);
	public ArrayList<OrderVo> selectOrderIng(int memberNo); 
}
