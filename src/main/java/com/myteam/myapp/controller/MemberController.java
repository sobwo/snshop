package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";
	}
	
	@RequestMapping(value = "/memberJoin.do")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value = "/searchId.do")
	public String searchId() {
		
		return "member/searchId";
	}
	
	@RequestMapping(value = "/searchIdVal.do")
	public String searchIdAction() {
		
		return "member/searchIdVal";
	}
	
	@RequestMapping(value = "/searchPw.do")
	public String searchPw() {
		
		return "member/searchPw";
	}
	
	@RequestMapping(value = "/searchPwVal.do")
	public String searchPwVal() {
		
		return "member/searchPwVal";
	}
	
	@RequestMapping(value = "/searchPwAction.do")
	public String searchPwAction() {
		
		return "redirect:/member/memberLogin.do";
	}
}
