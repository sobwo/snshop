package com.myteam.myapp.service;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.CommentDto;
import com.myteam.myapp.domain.CommentVo;
import com.myteam.myapp.persistance.CommentService_Mapper;

@Service("CommentServiceImpl")

public class CommentServiceImpl implements CommentService {
	
	private CommentService_Mapper csm;
	
	@Autowired
	public CommentServiceImpl(SqlSession sqlSession) {
		
		this.csm = sqlSession.getMapper(CommentService_Mapper.class);
	}


	@Override
	public int commentInsert(int memberNo, int boardNo,
			String ccontents) {
		
		CommentVo cv = new CommentVo();
		cv.setBoardNo(boardNo);
		cv.setCcontents(ccontents);
		cv.setMemberNo(memberNo);
		
		int value = csm.commentInsert(cv);

		return value;
	}

	@Override
	public ArrayList<CommentDto> getcomment(int boardNo) {
		ArrayList<CommentDto> value = csm.getcomment(boardNo);
		return value;
	}


	@Override
	public int deletecomment(CommentDto CD) {
		int value = csm.deletecomment(CD);
		
		return value;
	}

}
