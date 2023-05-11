package com.myteam.myapp.service;


import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;

public interface BoardService {

	public int boardInsert(BoardVo bv);

	public ArrayList<BoardVo> boardList(int memberNo);

}
