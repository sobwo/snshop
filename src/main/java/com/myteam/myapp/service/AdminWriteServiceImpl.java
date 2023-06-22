package com.myteam.myapp.service;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.persistance.AdminWriteService_Mapper;

@Service("AdminWriteServiceImpl")
public class AdminWriteServiceImpl implements AdminWriteService {
	
	private AdminWriteService_Mapper awm;

}
