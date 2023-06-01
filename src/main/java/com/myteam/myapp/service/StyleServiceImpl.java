package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.persistance.BoardService_Mapper;
import com.myteam.myapp.persistance.StyleService_Mapper;

@Service("StyleServiceImpl")
/* public class StyleServiceImpl implements StyleService { 원래 */
public class StyleServiceImpl implements StyleService {

	private StyleService_Mapper ssm1;
	private BoardService_Mapper bsm;

	@Autowired
	public StyleServiceImpl(SqlSession sqlSession) {

		this.ssm1 = sqlSession.getMapper(StyleService_Mapper.class);

	}

	/* 임시 */
	@Autowired
	public void BoardServiceInpl(SqlSession sqlSession) {
		this.bsm = sqlSession.getMapper(BoardService_Mapper.class);
	}

	@Override
	public ArrayList<BoardVo> boardSelectAll(int memberNo) {

		ArrayList<BoardVo> blist = ssm1.boardSelectAll(memberNo);

		return blist;
	}

	@Override
	public BoardVo boardSelectOne(int boardNo) {

		BoardVo bv = new BoardVo();

		bv = ssm1.boardSelectOne(boardNo);
		return bv;
	}

	@Override
	public int likesCnt(int memberNo, int boardNo) {

		int value = bsm.likesCnt(memberNo, boardNo);

		return value;
	}

	@Override
	public int likesTotalCnt(int boardNo) {
		int value = bsm.likesTotalCnt(boardNo);
		return value;
	}

	/*
	 * @Override public int likesList(LikesVo lv) {
	 * 
	 * int value = ssm1.likesList(lv);
	 * 
	 * return value; }
	 * 
	 * @Override public int likesCnt(int memberNo, int boardNo) {
	 * 
	 * int value = ssm1.likesCnt(memberNo, boardNo);
	 * 
	 * return value;
	 * 
	 * 
	 * }
	 * 
	 * @Override public int insertLike(LikesVo lv) {
	 * 
	 * int value = ssm1.insertLike(lv);
	 * 
	 * return value; }
	 * 
	 * @Override public int updateLike(LikesVo lv) {
	 * 
	 * int value = ssm1.updateLike(lv);
	 * 
	 * return value;
	 * 
	 * }
	 * 
	 * @Override public int likesTotalCntUpdate(int boardNo) {
	 * 
	 * int value = ssm1.likesTotalCntUpdate(boardNo);
	 * 
	 * return value;
	 * 
	 * }
	 * 
	 * @Override public int likesTotalCnt(int boardNo) {
	 * 
	 * int value = ssm1.likesTotalCnt(boardNo);
	 * 
	 * return value; }
	 * 
	 * @Override public int likeList(LikesVo lv) { int value = ssm1.likesList(lv);
	 * return value;
	 * 
	 * }
	 */
	/* 임시 */
	/*
	 * @Override public int likesTotalCnt(int boardNo) { int value =
	 * bsm.likesTotalCnt(boardNo); return value; } 임시
	 */
}