package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;

public interface BoardService_Mapper {
	
	public int boardInsert(BoardVo bv);

	public ArrayList<BoardVo> boardList(int memberNo);
	
	public ArrayList<LikesVo> likesInfo(int memberNo);

	public int insertLike(LikesVo lv);
	
	public int updateLike(LikesVo lv);
	
	public int likesTotalCnt(int boardNo);

	public int likesList(LikesVo lv);
	
}
