package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.OrderVo;
import com.myteam.myapp.domain.SizeVo;

public interface OrderService {
	//二쇱냼
	public int addressInsert(String basicName, String basicPhone, String basicAddrNum, 
			String basicAddr, String basicAddrDetail, String basic_check,int memberNo);
	public ArrayList<AddressVo> addressSelect(int memberNo); 
	public AddressVo addressSelectOne(int addressNo);
	public int addressDelete(int addressNo);
	public int addressModify(int addressNo, String basicName, String basicPhone, String basicAddrNum, 
			String basicAddr, String basicAddrDetail, String basic_check);
	
	//�쟾泥� 二쇰Ц 寃��깋
	public OrderVo purchaseInfo(int memberNo);
	public OrderVo saleInfo(int memberNo);
	
	public AddressVo addressOrderPage(int memberNo);
	
	
	//�궇吏쒕퀎 二쇰Ц 寃��깋
	public int cntHistoryAll(String index, int memberNo,int value,String startDate, String EndDate);
	public ArrayList<OrderVo> selectHistoryAll(String index, int memberNo, int value,String startDate, String EndDate, String filter,String price);

	
	
	public int orderInsert(int goodsNo, int memberNo, int addressNo, int totalPrice, String payInfo);
	/* public SizeVo sizeSelectOne(int sizeVo); */
}

