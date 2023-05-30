package com.myteam.myapp.persistance;

import com.myteam.myapp.domain.PayVo;

public interface PayService_Mapper {
	public int payInsert(PayVo vv);
	
	public PayVo paySelectNew(int orderNo);
}
