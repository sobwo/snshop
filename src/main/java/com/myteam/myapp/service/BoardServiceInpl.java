package com.myteam.myapp.service;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.domain.MemberVo;
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
	public int likesList(LikesVo lv) {
		
		int value = bsm.likesList(lv);
		
		return value;
	}

	@Override
	public int likesCnt(int memberNo, int boardNo) {
		
		int value = bsm.likesCnt(memberNo, boardNo);
		
		return value;
	}
	@Override
	public int insertLike(LikesVo lv) {
		
		int value = bsm.insertLike(lv);
		
		return value;
	}
	
	@Override
	public int updateLike(LikesVo lv) {
		
		int value = bsm.updateLike(lv);
		
		return value;
	}

	@Override
	public int likesTotalCntUpdate(int boardNo) {

		int value = bsm.likesTotalCntUpdate(boardNo);
		
		return value;
	}


	@Override
	public int likesTotalCnt(int boardNo) {

		int value = bsm.likesTotalCnt(boardNo);
		
		return value;
	}


	@Override
	public int boardCnt(int memberNo) {
		
		int value = bsm.boardCnt(memberNo);
		
		return value;
	}


	@Override
	public ArrayList<BoardVo> boardTotalList() {
		
		ArrayList<BoardVo> blist = bsm.boardTotalList();
		
		return blist;
	}

}
