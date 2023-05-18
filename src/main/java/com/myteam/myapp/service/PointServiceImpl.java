package com.myteam.myapp.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.CouponVo;
import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.domain.PointVo;
import com.myteam.myapp.persistance.PointService_Mapper;

@Service("pointServiceImpl")
public class PointServiceImpl implements PointService{
	private PointService_Mapper psm;
	
	@Autowired
	public PointServiceImpl(SqlSession sqlSession) {
		this.psm = sqlSession.getMapper(PointService_Mapper.class);
	}

	@Override
	public int checkCoupon(String coupon) {
		int value = psm.checkCoupon(coupon);
		
		return value;
	}
	
	@Override
	public CouponVo selectCoupon(String coupon) {
		CouponVo cv = psm.selectCoupon(coupon);
		
		return cv;
	}

	@Override
	public int insertPoint(int memberNo,String coupon) throws Exception{
		PointVo pv = new PointVo();
		CouponVo cv = psm.selectCoupon(coupon);
		
		//쿠폰 가격, 유효기간 insert
		pv.setMemberNo(memberNo);
		pv.setPoint(cv.getPoint());
		pv.setExpiration(cv.getUsePeriod());
		
		int value = psm.insertPoint(pv);
		int value2=0;
		
		//memberPoint 테이블 생성(기존에 존재할 시 update, 없을시 insert)
		PointVo pv2 = psm.selectPointNew(memberNo);
		MemberPointVo mpv = psm.selectMemberPointNew(memberNo);
        	
		if(mpv==null)
			value2=psm.insertMemberPoint(pv2.getPointNo(),memberNo,pv2.getPoint());
		else {
			value2=psm.updateMemberPoint(memberNo,pv2.getPoint());
		}
			
		return value+value2;
	}

	@Override
	public MemberPointVo selectMemberPointAll(int memberNo) {
		MemberPointVo mpv = psm.selectMemberPointAll(memberNo);

		return mpv;
	}
}
