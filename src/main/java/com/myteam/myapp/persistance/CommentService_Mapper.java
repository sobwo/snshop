package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.CommentDto;
import com.myteam.myapp.domain.CommentVo;
public interface CommentService_Mapper {


	public int commentInsert(CommentVo cv);

	 public ArrayList<CommentDto> getcomment(int boardNo);

	 
	 public int deletecomment(CommentDto CD);
	 public int modifycomment(CommentDto cdo);
	 
}
