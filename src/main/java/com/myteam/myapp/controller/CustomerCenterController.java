package com.myteam.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myteam.myapp.domain.AdminWriteVo;
import com.myteam.myapp.service.AdminWriteService;

@Controller
@RequestMapping(value = "/customerCenter")
public class CustomerCenterController {
	
	@Autowired
	AdminWriteService aws;
	
	
	@RequestMapping(value = "/customerCenterMain.do")
	public String customerCenterMain(	
			HttpSession session,
			Model model) {

		ArrayList<AdminWriteVo>AWlist = aws.boardSelectAll();

		model.addAttribute("AWlist",AWlist);

	 return "customerCenter/customerCenterMain"; 
	}
	
	
	
	
	
	@RequestMapping(value = "/customerCenterQuestion_all.do")
	public String customerCenterQuestion_all(	
			HttpSession session,
			Model model) {
		
		ArrayList<AdminWriteVo>AWlist2 = aws.boardSelectAll2();

		model.addAttribute("AWlist2",AWlist2);
		
		return "customerCenter/customerCenterQuestion_all";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/customerCenterQuestion_use.do")
	public String customerCenterQuestion_use(	
			HttpSession session,
			Model model) {
		ArrayList<AdminWriteVo>uselist = aws.boarduseAll();
		model.addAttribute("uselist",uselist);
		return "customerCenter/customerCenterQuestion_use";
	}
	
	
	
	
	@RequestMapping(value = "/customerCenterQuestion_common.do")
	public String customerCenterQuestion_common(		
			HttpSession session,
			Model model) {
		
		ArrayList<AdminWriteVo>commonlist = aws.boardcommonAll();

		model.addAttribute("commonlist",commonlist);
		return "customerCenter/customerCenterQuestion_common";
	}
	
	
	
	
	@RequestMapping(value = "/customerCenterQuestion_buy.do")
	public String customerCenterQuestion_buy(	
			HttpSession session,
			Model model) {
		ArrayList<AdminWriteVo>buylist = aws.boardbuyAll();
		model.addAttribute("buylist",buylist);
		return "customerCenter/customerCenterQuestion_buy";
	}
	
	@RequestMapping(value = "/customerCenterQuestion_sale.do")
	public String customerCenterQuestion_sale(HttpSession session,
			Model model) {
		ArrayList<AdminWriteVo>salelist = aws.boardsaleAll();
		model.addAttribute("salelist",salelist);
		return "customerCenter/customerCenterQuestion_sale";
	}
	
	
	@RequestMapping(value = "/customerCenterQuestion_delivery.do")
	public String customerCenterQuestion_delivery(HttpSession session,
			Model model) {
		ArrayList<AdminWriteVo>dellist = aws.boarddelAll();
		model.addAttribute("dellist",dellist);
		return "customerCenter/customerCenterQuestion_delivery";
	}
	
	
}