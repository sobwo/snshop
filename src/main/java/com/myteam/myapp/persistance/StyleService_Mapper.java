package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;

public interface StyleService_Mapper {
		
	
	public ArrayList<BoardVo> boardSelectAll(int memberNo);

	public BoardVo boardSelectOne(int boardNo);
}
