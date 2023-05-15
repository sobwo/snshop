package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.OrderVo;

public interface OrderService_Mapper {
	//정보 입력
	public int addressInsert(AddressVo av); 
	public ArrayList<AddressVo> addressSelect(int memberNo);
	
	//회원별 주소
	public AddressVo addressSelectOne(int addressNo);
	public int addressDelete(int addressNo);
	public int addressModify(AddressVo av);
	
	//날짜별 주문조회
	public ArrayList<OrderVo> selectOrderAll(int memberNo);
	public ArrayList<OrderVo> selectOrderIng(int memberNo);
}
