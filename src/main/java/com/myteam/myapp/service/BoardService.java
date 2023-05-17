package com.myteam.myapp.service;


import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesVo;

public interface BoardService {

	public int boardInsert(BoardVo bv);

	public ArrayList<BoardVo> boardList(int memberNo);
	
	public int like_check(LikesVo lv);

	public int boardNoTotalCnt(int boardNo);

}
