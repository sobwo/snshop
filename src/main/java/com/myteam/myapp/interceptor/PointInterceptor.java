package com.myteam.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.persistance.PointService_Mapper;

public class PointInterceptor extends HandlerInterceptorAdapter{
	private PointService_Mapper psm;
	
	@Autowired
	public PointInterceptor(SqlSession sqlSession) {
		this.psm = sqlSession.getMapper(PointService_Mapper.class);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)	throws Exception {
		HttpSession session = request.getSession();
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		updatePoint(memberNo);

		return true;
	}
	
	public void updatePoint(int memberNo) {
		MemberPointVo mpv = psm.selectMemberPointNew(memberNo);
		
		psm.updatePointDel(memberNo);
		
		if(mpv != null)
			psm.updateAvaPoint(memberNo);
		
		psm.updateExpPoint(memberNo);
	}
}