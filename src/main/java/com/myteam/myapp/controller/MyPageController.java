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
	
	@RequestMapping(value = "/interest.do")
	public String interest() {
		
		return "myPage/interest";
	}
	
	@RequestMapping(value = "/profileInfo.do")
	public String profileInfo() {
		
		return "myPage/profileInfo";
	}
	
	@RequestMapping(value = "/myStyle.do")
	public String myStyle() {
		
		return "myPage/myStyle";
	}
	
	@RequestMapping(value = "/address.do")
	public String address() {
		
		return "myPage/address";
	}
	
	@RequestMapping(value = "/incomeAccount.do")
	public String incomeAccount() {
		
		return "myPage/incomeAccount";
	}
}
