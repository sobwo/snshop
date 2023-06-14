package com.myteam.myapp.service;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.HashTagVo;
import com.myteam.myapp.domain.LikesDto;
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
	public ArrayList<LikesDto> boardList(int memberNo) {
		
		ArrayList<LikesDto> llist = bsm.boardList(memberNo);
		
		return llist;
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
	public BoardVo boardSelectOne(int boardNo) {
		
		BoardVo bv =  bsm.boardSelectOne(boardNo);
		
		return bv;
	}


	@Override
	public int boardModifyUpdate(BoardVo bv) {
		
		int value = bsm.boardModifyUpdate(bv);

		return value;
	}


	@Override
	public int hashTagInsert(HashTagVo hv) {

		int value = bsm.hashTagInsert(hv);
		
		return value;
	}


	@Override
	public int hashTagList(HashTagVo hv) {
		
		int value = bsm.hashTagList(hv);
				
		return value;
	}


	@Override
	public int tagCntUpdate(HashTagVo hv) {
		
		int value = bsm.tagCntUpdate(hv);
				
		return value;
	}


	@Override
	public int insertBoardHashTag(int boardNo, int hashTagNo) {
		
		int value = bsm.insertBoardHashTag(boardNo,hashTagNo);
		
		return value;
	}


	@Override
	public int hashTagList2(HashTagVo hv) {
		int value = bsm.hashTagList2(hv);
		
		return value;
	}


}
