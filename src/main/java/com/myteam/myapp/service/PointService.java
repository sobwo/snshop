package com.myteam.myapp.service;

import com.myteam.myapp.domain.CouponVo;
import com.myteam.myapp.domain.MemberPointVo;

public interface PointService {
	public int checkCoupon(String coupon);
	public CouponVo selectCoupon(String coupon);
	public int insertPoint(int memberNo, String coupon);
	public MemberPointVo selectMemberPointAll(int memberNo);
	public String selectExpriation(int memberNo);
}
