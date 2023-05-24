package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.persistance.StyleService_Mapper;

@Service("StyleServiceImpl")
public class StyleServiceImpl implements StyleService {

	private StyleService_Mapper ssm;
	@Autowired
	public StyleServiceImpl(SqlSession sqlSession) {
		
		this.ssm = sqlSession.getMapper(StyleService_Mapper.class);
	
	}
	@Override
	public ArrayList<BoardVo> boardSelectAll() {

		ArrayList<BoardVo> blist = ssm.boardSelectAll();
		
		return  blist;
	}





}