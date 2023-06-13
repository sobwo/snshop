package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.CommentDto;
import com.myteam.myapp.domain.CommentVo;

public interface CommentService {



	public int commentInsert(int memberNo, int boardNo, String ccontents);
	
	
	public ArrayList<CommentDto> getcomment(int boardNo);

	 public int deletecomment(CommentDto CD);
	 public int modifycomment(int commentNo,String ccontents);

		/*
		 * public CommentDto modifycomment(int commentNo, String ccontents);
		 */
	 
	 
}
