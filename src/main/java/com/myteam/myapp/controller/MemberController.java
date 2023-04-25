package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin() {
		
		return "/member/memberLogin";
	}
	
}
