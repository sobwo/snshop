package com.myteam.myapp.persistance;

import com.myteam.myapp.domain.PayVo;
import com.myteam.myapp.domain.RefundVo;

public interface PayService_Mapper {
	public int payInsert(PayVo vv);
	
	public PayVo paySelectNew(int orderNo);
	
	public RefundVo refundSelect(int memberNo);
}
