package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.LikesVo;

public interface StyleService_Mapper {
		
	
	public ArrayList<BoardVo> boardSelectAll(int memberNo);

	public BoardVo boardSelectOne(int boardNo);
	
	public int likesCnt(int memberNo, int boardNo);
	
	
	 public int likesTotalCnt(int boardNo);

	public ArrayList<LikesDto> boardTotalList(int memberNo);

	public ArrayList<LikesDto> boardTotalList_newest(int memberNo);

	
	
	
	/*시도*/
	/*
	 * public int likesList(LikesVo lv);
	 * 
	 * public int likesCnt(int memberNo, int boardNo);
	 * 
	 * public int insertLike(LikesVo lv);
	 * 
	 * public int updateLike(LikesVo lv);
	 * 
	 * public int likesTotalCntUpdate(int boardNo);
	 * 
	 * public int likesTotalCnt(int boardNo);
	 */
}
