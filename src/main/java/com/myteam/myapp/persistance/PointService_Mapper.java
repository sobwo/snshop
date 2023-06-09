package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.CouponVo;
import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.PointVo;

public interface PointService_Mapper {
	public String checkCouponUse(String couponNum);
	public CouponVo selectCoupon(String coupon);

	public int insertPoint(PointVo pv);
	public PointVo selectPointNew(int memberNo);
	public int insertMemberPoint(MemberPointVo mpv);
	public MemberPointVo selectMemberPointNew(int memberNo);
	
	public int updateUsage(int couponNo);
	
	public int updateAvaPoint(int memberNo);
	public MemberPointVo selectMemberPointAll(int memberNo);
	public ArrayList<PointVo> selectPointAll(int memberNo);
	
	//인터셉터
	public int updateExpPoint(int memberNo);
	public int updatePointDel(int memberNo);
	
	
	//회원 정보 전체 출력하기
	public ArrayList<MemberVo> selectMemberNoAll();
	
	//관리자일때 쿠폰 등록
	public int insertCoupon(CouponVo cv);
	public int insertCouponUsage(int couponNo,int memberNo);
}
