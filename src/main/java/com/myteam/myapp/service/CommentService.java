package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.CommentVo;

public interface CommentService {



	public int commentInsert(int memberNo, int boardNo, String ccontents);
	
	
	public ArrayList<CommentVo> getcomment(int boardNo);
	



}
