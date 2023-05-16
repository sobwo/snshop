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
	
	public int cntHistoryAll(String index, int memberNo,int value,String startDate, String EndDate);
	public ArrayList<OrderVo> selectHistoryAll(String index, int memberNo, int value,String startDate, String EndDate, String filter,String price);
}
