package com.myteam.myapp.persistance;

import com.myteam.myapp.domain.AddressVo;

public interface OrderService_Mapper {
	//정보 입력
	public int addressInsert(AddressVo av); 
	public AddressVo addressSelect(int memberNo); 
}
