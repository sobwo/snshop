package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.AdminWriteVo;
import com.myteam.myapp.persistance.AdminWriteService_Mapper;
import com.myteam.myapp.persistance.CommentService_Mapper;

@Service("AdminWriteServiceImpl")

public class AdminWriteServiceImpl implements AdminWriteService {
	
	private AdminWriteService_Mapper awm;
	
	
	@Autowired
	public AdminWriteServiceImpl(SqlSession sqlSession) {
		
		this.awm = sqlSession.getMapper(AdminWriteService_Mapper.class);
	}

	@Override
	public int AWinsert(String AWtitle, String AWcontent,String categorytitle) {
		AdminWriteVo awv = new AdminWriteVo();
		awv.setAWcontents(AWcontent);
		awv.setAWtitle(AWtitle);
		awv.setCategorytitle(categorytitle);
		int value = awm.AWinsert(awv);
		return value;
	}

	@Override
	public ArrayList<AdminWriteVo> boardSelectAll() {
		ArrayList<AdminWriteVo> awlist = awm.boardSelectAll();
		return awlist;
	}
	@Override
	public ArrayList<AdminWriteVo> boardSelectAll2() {
		ArrayList<AdminWriteVo> awlist2 = awm.boardSelectAll2();
		return awlist2;
	}
	
	@Override
	public ArrayList<AdminWriteVo> boarduseAll() {
		ArrayList<AdminWriteVo> uselist = awm.boarduseAll();
		return uselist;
	}
	
	@Override
	public ArrayList<AdminWriteVo> boardbuyAll() {
		ArrayList<AdminWriteVo> buylist = awm.boardbuyAll();
		return buylist;
	}

	@Override
	public ArrayList<AdminWriteVo> boardsaleAll() {
		ArrayList<AdminWriteVo> salelist = awm.boardsaleAll();
		return salelist;
	}	
	@Override
	public ArrayList<AdminWriteVo> boarddelAll() {
		ArrayList<AdminWriteVo> dellist = awm.boarddelAll();
		return dellist;
	}
	@Override
	public ArrayList<AdminWriteVo> boardcommonAll() {
		ArrayList<AdminWriteVo> commonlist = awm.boardcommonAll();
		return commonlist;
	}


	@Override
	public AdminWriteVo boardSelectOne(int AWboardNo) {
		AdminWriteVo awv = awm.boardSelectOne(AWboardNo);
		return awv;
	}

	
	  @Override public int deleteAW(AdminWriteVo awv) {
	  
	  int value = awm.deleteAW(awv);
	  
	  return value; }
	 


	

}
