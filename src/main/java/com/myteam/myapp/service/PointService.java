package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.CouponVo;
import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.domain.PointVo;

public interface PointService {
	public int checkCouponUse(String couponNum);
	public CouponVo selectCoupon(String coupon);
	public int insertPoint(int memberNo, String index, String coupon) throws Exception;
	public int usePoint(int memberNo, int point, String useDetail);
	
	public ArrayList<PointVo> selectPointAll(int memberNo);
	public MemberPointVo selectMemberPointAll(int memberNo);
	
	//관리자일떄 쿠폰 등록
	public int insertCoupon(String couponName, String couponNum, int point, String usePeriod);
}
