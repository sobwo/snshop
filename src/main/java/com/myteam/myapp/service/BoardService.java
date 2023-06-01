package com.myteam.myapp.service;


import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;

public interface BoardService {

	public int boardInsert(BoardVo bv);

	public ArrayList<BoardVo> boardList(int memberNo);
	
	public int likesList(LikesVo lv);
	
	public int likesCnt(int memberNo, int boardNo);

	public int insertLike(LikesVo lv);
	
	public int updateLike(LikesVo lv);

	public int likesTotalCntUpdate(int boardNo);

	public int likesTotalCnt(int boardNo);

	public int boardCnt(int memberNo);

	public ArrayList<BoardVo> boardTotalList(int memberNo);
	
}
