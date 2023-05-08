package com.myteam.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myteam.myapp.domain.MemberVo;
//import com.myteam.myapp.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
//	@Autowired
//	MemberService ms;
	
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";
	}
	
	@RequestMapping(value = "/memberJoin.do")
	public String memberJoin() {
		
		return "member/memberJoin";
	}
	
//	@RequestMapping(value = "/memberIdCheck.do")
//	public String memberIdCheck() {
//		String str = null;
//		int value = 0;
//		str = "{\"value\":\""+value+"\"}";
//		return str;
//	}
	
//	@RequestMapping(value = "/memberJoinAction.do")
//	public String memberJoinAction(
//			@RequestParam("memberId") String memberId,
//			@RequestParam("memberPw") String memberPw,
//			@RequestParam("memberName") String memberName,
//			@RequestParam("memberEmail") String memberEmail,
//			@RequestParam("memberPhone") String memberPhone,
//			@RequestParam("memberGender") String memberGender) {
//		
//		int value = ms.memberInsert(memberId, memberPw, memberName, memberEmail, memberPhone, memberGender);
//		
//		if(value == 1)
//			return "member/memberLogin";
//		else
//			return "member/memberJoin";
//		
//	}
	
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
