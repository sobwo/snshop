package com.myteam.myapp.persistance;

import com.myteam.myapp.domain.CouponVo;
import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.domain.PointVo;

public interface PointService_Mapper {
	public int checkCoupon(String coupon);
	public CouponVo selectCoupon(String coupon);
	public int insertPoint(PointVo pv);
	public PointVo selectPointNew(int memberNo);
	public int insertMemberPoint(int pointNo, int memberNo, int point);
	public MemberPointVo selectMemberPointNew(int memberNo);
	public int updateMemberPoint(int memberNo, int pointNo);
	public MemberPointVo selectMemberPointAll(int memberNo);
	public int updateExpPoint(int memberNo);
	public int deletePoint(int memberNo,int pointNo);
}
