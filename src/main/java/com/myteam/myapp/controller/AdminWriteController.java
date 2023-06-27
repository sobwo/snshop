package com.myteam.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myteam.myapp.domain.AdminWriteVo;
import com.myteam.myapp.service.AdminWriteService;


@Controller
@RequestMapping(value="/AdminWrite")

public class AdminWriteController {

	
	@Autowired
	AdminWriteService aws;
	
	@RequestMapping(value="/AdminWrite.do")
	public String AdminWriteAction(HttpSession session,
	Model model) {
		
		return"customerCenter/AdminWrite";
	}
	
	@RequestMapping(value="/AdminWriteAction.do")
	public String AdminWrite(HttpSession session,
			@RequestParam("AWtitle")String AWtitle,
			@RequestParam("AWcontent")String AWcontent,
			@RequestParam("categorytitle")String categorytitle,
			Model model) {
		  System.out.println("AWtitle : " +AWtitle);
		  System.out.println("AWcontent : " +AWcontent);
		  System.out.println("categorytitle : " +categorytitle);
		int value = aws.AWinsert(AWtitle,AWcontent,categorytitle);
		 
		
		 return "redirect:/customerCenter/customerCenterMain.do";
		
	}
	@RequestMapping(value="/AdminDetail.do")
	public String AdminDetail(HttpSession session,
			@RequestParam("AWboardNo")int  AWboardNo,
		Model model) {
		System.out.println("AWboardNo : " +AWboardNo);
		
		
		AdminWriteVo awv = aws.boardSelectOne(AWboardNo);
		model.addAttribute("awv",awv);
	
	return "customerCenter/AdminDetail";
	}
	
	
	@RequestMapping(value="/AdminWriteDelete.do")
	public String AdminWriteDelete(HttpSession session,
			@RequestParam("AWboardNo")int AWboardNo,
			AdminWriteVo awv,
			Model model) {
		System.out.println("AWboardNo : " +AWboardNo);
		

						

		 int value = aws.deleteAW(awv);
		
		
		
		 return "redirect:/customerCenter/customerCenterMain.do";
	}
		
			
	
}
