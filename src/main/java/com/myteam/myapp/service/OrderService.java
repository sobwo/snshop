package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.domain.PointVo;

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
	public OrderDto purchaseInfo(int memberNo);
	public OrderDto saleInfo(int memberNo);
	
	public AddressVo addressOrderPage(int memberNo);
	
	
	//�궇吏쒕퀎 二쇰Ц 寃��깋
	public int cntHistoryAll(String index, int memberNo,int value,String startDate, String EndDate);
	public ArrayList<OrderDto> selectHistoryAll(String index, int memberNo, int value,String startDate, String EndDate, String filter,String price);

	public int orderInsert(int goodsNo, int memberNo, String orderNum, int addressNo, int totalPrice, String payInfo, String size, String statusDetail, String memberPhone);
	
	public OrderDto orderSelectNew(String orderNum);

	public int accumulatefinishPoint(int finishPoint, int memberNo); 
	
	public OrderDto orderHistoryShow(int orderNo);
	
	public int orderCancel(String orderNum);

}

