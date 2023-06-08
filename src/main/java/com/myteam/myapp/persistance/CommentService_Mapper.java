package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.CommentVo;
public interface CommentService_Mapper {

//	int commentInsert(CommentVo cv);
	public int commentInsert(CommentVo cv);

	 public ArrayList<CommentVo> getcomment(int boardNo);

}
