package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/myPage")
public class MyPageController {
	
	@RequestMapping(value = "/myPageMain.do")
	public String memberLogin() {
		
		return "myPage/myPageMain";
	}
	
	@RequestMapping(value = "/purchase.do")
	public String purchase() {
		
		return "myPage/purchase";
	}
	
	@RequestMapping(value = "/sale.do")
	public String sale() {
		
		return "myPage/sale";
	}
}
