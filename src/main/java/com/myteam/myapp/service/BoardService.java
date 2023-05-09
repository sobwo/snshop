package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.SearchCriteria;

public interface BoardService {

	public ArrayList<BoardVo> boardList(SearchCriteria scri);
	
	public int boardTotal(SearchCriteria scri);
	
	public int boardViewCnt(int boardNo);
	
	public BoardVo boardSelectOne(int boardNo);
	
	public int boardInsert(BoardVo bv);

}
