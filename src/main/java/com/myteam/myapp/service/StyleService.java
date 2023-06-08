package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.FollowingVo;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.LikesVo;

public interface StyleService {


	public ArrayList<BoardVo> boardSelectAll(int memberNo);
	
	public BoardVo boardSelectOne(int boardNo);
	public int likesCnt(int memberNo,int boardNo);

	/* 임시 */
	 public int likesTotalCnt(int boardNo);
	 /* 임시 */
	
	 
	 /* 6-5완성x */
	public int followingList(FollowingVo fv); 
	
	public int insertfollowing(FollowingVo fv);

	public int updatefollowing(FollowingVo fv);
	
	public Integer nowfollowingState(int memberNo, int followingMemberNo);/* 현재 상태 */
	/*public int nowfollowingState(FollowingVo fv);/* 현재 상태 */
	
	/* 완성x */
	public ArrayList<LikesDto> boardTotalList(int memberNo);

	public ArrayList<LikesDto> boardTotalList_newest(int memberNo);



	
	 
	
}
