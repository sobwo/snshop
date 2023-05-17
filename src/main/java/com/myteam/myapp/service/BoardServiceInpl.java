package com.myteam.myapp.service;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.persistance.BoardService_Mapper;

@Service("boardServiceInpl")

public class BoardServiceInpl implements BoardService{
	
	private BoardService_Mapper bsm;

	@Autowired
	public BoardServiceInpl (SqlSession sqlSession) {
		this.bsm = sqlSession.getMapper(BoardService_Mapper.class);
	}


	@Override
	public int boardInsert(BoardVo bv) {
		
		int value = bsm.boardInsert(bv);

		return value;
	}


	@Override
	public ArrayList<BoardVo> boardList(int memberNo) {
		
		ArrayList<BoardVo> blist = bsm.boardList(memberNo);
		
		return blist;
	}
	
	@Override
	public int like_check(LikesVo lv) {

		int value = bsm.like_checkInsert(lv);
		
		return value;

	}

	@Override
	public int boardNoTotalCnt(int boardNo) {

		int value = bsm.boardNoTotalCnt(boardNo);
		
		return value;

	}

}
