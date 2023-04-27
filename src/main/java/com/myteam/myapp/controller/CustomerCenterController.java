package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/customerCenter")
public class CustomerCenterController {
	
	@RequestMapping(value = "/customerCenterMain.do")
	public String customerCenterMain() {
		
		return "customerCenter/customerCenterMain";
	}
	
	@RequestMapping(value = "/customerCenterQuestion_all.do")
	public String customerCenterQuestion_all() {
		
		return "customerCenter/customerCenterQuestion_all";
	}
	
	@RequestMapping(value = "/customerCenterQuestion_use.do")
	public String customerCenterQuestion_use() {
		
		return "customerCenter/customerCenterQuestion_use";
	}
	
	@RequestMapping(value = "/customerCenterQuestion_common.do")
	public String customerCenterQuestion_common() {
		
		return "customerCenter/customerCenterQuestion_common";
	}
	
	@RequestMapping(value = "/customerCenterQuestion_buy.do")
	public String customerCenterQuestion_buy() {
		
		return "customerCenter/customerCenterQuestion_buy";
	}
	
	@RequestMapping(value = "/customerCenterQuestion_sale.do")
	public String customerCenterQuestion_sale() {
		
		return "customerCenter/customerCenterQuestion_sale";
	}
	
}