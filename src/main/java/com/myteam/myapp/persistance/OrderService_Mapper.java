package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.AddressVo;

public interface OrderService_Mapper {
	//정보 입력
	public int addressInsert(AddressVo av); 
	public ArrayList<AddressVo> addressSelect(int memberNo);
	public AddressVo addressSelectOne(int addressNo);
	public int addressDelete(int addressNo);
}
