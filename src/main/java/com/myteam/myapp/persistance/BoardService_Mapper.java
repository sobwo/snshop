package com.myteam.myapp.persistance;

import java.util.ArrayList;
import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.SearchCriteria;

public interface BoardService_Mapper {

	public ArrayList<BoardVo> boardList(SearchCriteria scri);
	
	public int boardTotal(SearchCriteria scri);
	
	public int boardViewCnt(int bidx);
	
	public BoardVo boardSelectOne(int bidx);
	
	public int boardInsert(BoardVo bv);

}