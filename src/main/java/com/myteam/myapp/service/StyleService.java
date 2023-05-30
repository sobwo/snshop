package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;

public interface StyleService {


	public ArrayList<BoardVo> boardSelectAll(int memberNo);
	
	public BoardVo boardSelectOne(int boardNo);


	/*
	 * 
	 * public int likeList(LikesVo lv);
	 * 
	 * public int likesCnt(int memberNo,int boardNo);
	 * 
	 * public int insertLike(LikesVo lv);
	 * 
	 * public int updateLike(LikesVo lv);
	 * 
	 * public int likesTotalCntUpdate(int boardNo);
	 * 
	 * public int likesTotalCnt(int boardNo);
	 * 
	 * 
	 */
	 
	
}
