package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;

public interface BoardService_Mapper {
	
	public int boardInsert(BoardVo bv);

	public ArrayList<BoardVo> boardList(int memberNo);
	
	public int like_checkInsert(LikesVo lv);

	public int boardNoTotalCnt(int boardNo);
}
