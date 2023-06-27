package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.AdminWriteVo;

public interface AdminWriteService_Mapper {


	public ArrayList<AdminWriteVo> boardSelectAll();
	public ArrayList<AdminWriteVo> boardSelectAll2();
	public ArrayList<AdminWriteVo> boarduseAll();
	public ArrayList<AdminWriteVo> boardbuyAll();
	public ArrayList<AdminWriteVo> boardsaleAll();
	public ArrayList<AdminWriteVo> boarddelAll();
	public ArrayList<AdminWriteVo> boardcommonAll();
	public int AWinsert(AdminWriteVo awv);


	public AdminWriteVo boardSelectOne(int AWboardNo);
	
	public int deleteAW(AdminWriteVo awv);

}
