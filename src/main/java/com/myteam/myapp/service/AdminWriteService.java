package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.AdminWriteVo;
import com.myteam.myapp.persistance.AdminWriteService_Mapper;

public interface AdminWriteService {

		public int AWinsert(String AWtitle, String AWcontent, String categorytitle);
		
		
		public ArrayList<AdminWriteVo> boardSelectAll();
		
		public ArrayList<AdminWriteVo> boardSelectAll2();
		public ArrayList<AdminWriteVo> boarduseAll();
		public ArrayList<AdminWriteVo> boardbuyAll();
		public ArrayList<AdminWriteVo> boardsaleAll();
		public ArrayList<AdminWriteVo> boarddelAll();
		public ArrayList<AdminWriteVo> boardcommonAll();
		public AdminWriteVo boardSelectOne(int AWboardNo);
		
		public int deleteAW(AdminWriteVo awv);
		
		
		
}
