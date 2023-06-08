package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.FollowingVo;
import com.myteam.myapp.domain.LikeMemberDto;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.LikesVo;

public interface StyleService_Mapper {
		
	
	public ArrayList<BoardVo> boardSelectAll(int memberNo);

	public BoardVo boardSelectOne(int boardNo);
	
	public int likesCnt(int memberNo, int boardNo);
	/* 완성x */
	public int followingList(FollowingVo fv); 
	public int insertfollowing(FollowingVo fv);
	public int updatefollowing(FollowingVo fv);

	public Integer nowfollowingState(int memberNo, int followingMemberNo);/* 현재 상태 */
	/* 완성x */
	 public int likesTotalCnt(int boardNo);

	public ArrayList<LikesDto> boardTotalList(int memberNo);

	public ArrayList<LikesDto> boardTotalList_newest(int memberNo);

<<<<<<< HEAD
	public int boardDelete(LikesDto ld);

	
	
=======
	/* 좋아요 누른사람 */

	public ArrayList<LikeMemberDto> getlikeMemberList(int boardNo);
>>>>>>> branch 'main' of https://github.com/sobwo/snshop.git
	

}
