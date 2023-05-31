package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.CouponVo;
import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.domain.MemberVo;
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
	public int checkCouponUse(String couponNum) {
		int value = psm.checkCouponUse(couponNum);
		
		return value;
	}
	
	@Override
	public CouponVo selectCoupon(String coupon) {
		CouponVo cv = psm.selectCoupon(coupon);
		
		return cv;
	}

	@Override
	public int insertPoint(int memberNo, String index, String couponNum) throws Exception{
		
		PointVo pv = new PointVo();
		CouponVo cv = psm.selectCoupon(couponNum);
		
		if(index.equals("coupon")) {
			pv.setMemberNo(memberNo);
			pv.setPoint(cv.getPoint());
			pv.setExpiration(cv.getUsePeriod());
			pv.setUseStatus("적립");
			pv.setUseHistory("쿠폰");
			pv.setUseDetail(cv.getCouponName());
		}
		
		int value = psm.insertPoint(pv);
		
		if(value==1 && couponNum != null) {
			value = psm.updateUsage(cv.getCouponNo());
		}
		
		PointVo pv_newSelect = psm.selectPointNew(memberNo);
		
        MemberPointVo mpv_insert = new MemberPointVo();	
        
        mpv_insert.setPointNo(pv_newSelect.getPointNo());
        mpv_insert.setMemberNo(memberNo);
        
        MemberPointVo mpv = psm.selectMemberPointNew(memberNo);
        if(mpv==null)
        	psm.insertMemberPoint(mpv_insert);
			
		return value;
	}
	
	@Override
	public int usePoint(int memberNo, int point, String useStatus, String useDetail) {
		PointVo pv = new PointVo();
		
		useDetail = useDetail+" 상품";
		
		pv.setPoint(point);
		pv.setUseStatus(useStatus);
		pv.setUseHistory("구매");
		pv.setUseDetail(useDetail);
		pv.setMemberNo(memberNo);
		
		if(useStatus.equals("사용"))
			pv.setDelYn("U");
		
		int value = psm.insertPoint(pv);
		int result = 0;
		if(value == 1)
			result = psm.updateAvaPoint(memberNo);
		
		return result;
	}
	
	@Override
	public MemberPointVo selectMemberPointAll(int memberNo) {
		MemberPointVo mpv = psm.selectMemberPointAll(memberNo);

		return mpv;
	}

	@Override
	public ArrayList<PointVo> selectPointAll(int memberNo) {
		ArrayList<PointVo> plist= psm.selectPointAll(memberNo);
		
		return plist;
	}

	@Override
	public int insertCoupon(String couponName, String couponNum, int point, String usePeriod) {
		CouponVo cv = new CouponVo();
		CouponVo cv2 = new CouponVo();
		
		int value2 = 0;
		
		cv.setCouponName(couponName);
		cv.setCouponNum(couponNum);
		cv.setPoint(point);
		cv.setUsePeriod(usePeriod);
		
		int value = psm.insertCoupon(cv);
		
		int result = 0;
		if(value==1) {
			cv2 = psm.selectCoupon(couponNum);
			
			ArrayList<MemberVo> memberNo = psm.selectMemberNoAll();
			
			for(int i=0;i<memberNo.size();i++) {
				value2 = psm.insertCouponUsage(cv2.getCouponNo(),memberNo.get(i).getMemberNo());
				if(value2==1) result++; 
			}
		}
		
		return result;
	}
	
	
}
