package com.myteam.myapp.persistance;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.OrderVo;
import com.myteam.myapp.domain.SizeVo;

public interface OrderService_Mapper {
	// 정보 입력
	public int addressInsert(AddressVo av);

	public ArrayList<AddressVo> addressSelect(int memberNo);

	public int addressCheckReset(int memberNo);

	public AddressVo addressOrderPage(int memberNo);

	// 회원별 주소
	public AddressVo addressSelectOne(int addressNo);

	public int addressDelete(int addressNo);

	public int addressModify(AddressVo av);

	// 전체 주문 검색
	public OrderVo purchaseInfo(int memberNo);

	public OrderVo saleInfo(int memberNo);

	// 날짜별 주문조회
	public int cntHistoryAll(@Param("index") String index, int memberNo, @Param("value") int value,
			@Param("startDate") String startDate, @Param("endDate") String endDate);

	public ArrayList<OrderVo> selectHistoryAll(@Param("index") String index, int memberNo, @Param("value") int value,
			@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("filter") String filter,
			@Param("price") String price);

	public int orderInsert(OrderVo ov);  
	
	/* public SizeVo sizeSelectOne(int sizeNo); */

}
