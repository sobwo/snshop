package com.myteam.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

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
		
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		psm.updateExpPoint(memberNo);
        
		return true;
	}
}