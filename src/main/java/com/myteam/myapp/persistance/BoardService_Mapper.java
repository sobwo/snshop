package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;

public interface BoardService_Mapper {
	
	public int boardInsert(BoardVo bv);

	public ArrayList<BoardVo> boardList(int memberNo);


}
