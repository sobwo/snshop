package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.SearchCriteria;
import com.myteam.myapp.persistance.BoardService_Mapper;

@Service("boardServiceInpl")

public class BoardServiceInpl implements BoardService{
	
	private BoardService_Mapper bsm;

	@Autowired
	public BoardServiceInpl (SqlSession sqlSession) {
		this.bsm = sqlSession.getMapper(BoardService_Mapper.class);
	}


	@Override
	public ArrayList<BoardVo> boardList(SearchCriteria scri) {
		
		ArrayList<BoardVo> blist = bsm.boardList(scri);

		return blist;
	}

	@Override
	public int boardInsert(BoardVo bv) {
		
		int value = bsm.boardInsert(bv);

		return value;
	}

}
