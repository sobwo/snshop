package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;

public interface StyleService {


	public ArrayList<BoardVo> boardSelectAll(int memberNo);
	
	public BoardVo boardSelectOne(int boardNo);
	
}
