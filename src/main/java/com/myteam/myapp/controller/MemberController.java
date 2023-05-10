package com.myteam.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	MemberService ms;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin() {

		return "member/memberLogin";
	}

	@RequestMapping(value = "/memberLoginAction.do")
	public String memberLoginAction(
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			HttpSession session,
			RedirectAttributes rttr) {
		
		String path= null;
		MemberVo mv = ms.memberLogin(memberId);
		
		if(mv != null && bcryptPasswordEncoder.matches(memberPw, mv.getMemberPw())) {
			rttr.addAttribute("memberNo",mv.getMemberNo());
			
			if(session.getAttribute("dest")==null)
				path = "redirect:/";
			else {
				String dest = (String) session.getAttribute("dest");
				path = "redirect:"+dest;
			}
		}
		
		else {
			System.out.println("실패");
			rttr.addFlashAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
			path="redirect:/member/memberLogin.do";
		}
			
		return path;
	}
	
	@RequestMapping(value = "/memberLogOut.do")
	public String memberLogOut(
			HttpSession session) {
		String path = null;
		
		if(session.getAttribute("memberNo")!=null) {
			session.removeAttribute("memberNo");

		}
		
		if(session.getAttribute("dest")==null)
			path = "redirect:/";
		else {
			String dest = (String) session.getAttribute("dest");
			path = "redirect:"+dest;
		}
		
		session.invalidate();
		
		return path;
	}
	
	@RequestMapping(value = "/memberJoin.do")
	public String memberJoin() {

		return "member/memberJoin";
	}

	@ResponseBody
	@RequestMapping(value = "/memberIdCheck.do") 
	public String memberIdCheck(
			@RequestParam("memberId") String memberId) {
		String str = null; 
		int value = ms.memberIdCheck(memberId);
		str = "{\"value\":\""+value+"\"}";
		return str; 
	}
	
	@RequestMapping(value = "/memberJoinAction.do") 
	public String memberJoinAction(
			 @RequestParam("memberId") String memberId,
			 @RequestParam("memberPw") String memberPw,
			 @RequestParam("memberName") String memberName,
			 @RequestParam("memberEmail") String memberEmail,
			 @RequestParam("memberPhone") String memberPhone,
			 @RequestParam("memberGender") String memberGender) {
		
		String memberPw2 = bcryptPasswordEncoder.encode(memberPw);
		
		int value = ms.memberInsert(memberId, memberPw2, memberName, memberEmail, memberPhone, memberGender);
		
		if(value == 1) 
			return "member/memberLogin"; 
		else 
			return "member/memberJoin";
	}

	@RequestMapping(value = "/searchId.do")
	public String searchId() {

		return "member/searchId";
	}

	@RequestMapping(value = "/searchIdAction.do")
	public String searchIdAction(
			Model model,
			@RequestParam("searchMeasure") String searchMeasure,
			@RequestParam(value="memberName_phone",required=false) String memberName_phone,
			@RequestParam(value="memberName_email",required=false) String memberName_email,
			@RequestParam(value="memberPhone", required = false)  String memberPhone,
			@RequestParam(value="memberEmail",required = false) String memberEmail,
			RedirectAttributes rttr) {
		
		String memberId = ms.searchId(searchMeasure,memberName_phone, memberName_email, memberPhone, memberEmail);
		
		model.addAttribute("memberId",memberId);
		
		if(memberId != null)
			return "member/searchIdVal";
		
		else {
			System.out.println("실패");
			rttr.addFlashAttribute("msg", "정보가 일치하지 않습니다.");
			return "redirect:/member/searchId.do";
		}
			
	}

	@RequestMapping(value = "/searchPw.do")
	public String searchPw(
			Model model,
			@RequestParam(value="memberId",required=false) String memberId) {
		
		model.addAttribute("memberId", memberId);
		
		return "member/searchPw";
	}

	@RequestMapping(value = "/searchPwAction.do")
	public String searchPwAction(
			Model model,
			@RequestParam("searchMeasure") String searchMeasure,
			@RequestParam(value="memberId_phone",required=false) String memberId_phone,
			@RequestParam(value="memberId_email",required=false) String memberId_email,
			@RequestParam(value="memberName_phone",required=false) String memberName_phone,
			@RequestParam(value="memberName_email",required=false) String memberName_email,
			@RequestParam(value="memberPhone", required = false)  String memberPhone,
			@RequestParam(value="memberEmail",required = false) String memberEmail,
			RedirectAttributes rttr) {

		int value = ms.searchPw(searchMeasure, memberId_phone, memberId_email, memberName_phone, memberName_email, memberPhone, memberEmail);
		
		String memberId = null;
		
		if(memberId_phone==null || memberId_phone == "") memberId = memberId_email;
		else if(memberId_email==null || memberId_email == "") memberId = memberId_phone;
		else memberId = memberId_phone;
		
		if(value==1)
			return "redirect:/member/searchPwVal.do?memberId="+memberId;
		
		else {
			System.out.println("실패");
			rttr.addFlashAttribute("msg", "정보가 일치하지 않습니다.");
			return "redirect:/member/searchPw.do?memberId="+memberId;
		}
	}

	@RequestMapping(value = "/searchPwVal.do")
	public String searchPwVal(
			Model model,
			@RequestParam("memberId") String memberId) {
		
		model.addAttribute("memberId", memberId);
		
		return "member/searchPwVal";
	}
	

	@RequestMapping(value = "/searchPwValAction.do")
	public String searchPwValAction(
			Model model,
			@RequestParam("memberId") String memberId,
			@RequestParam("memberPw") String memberPw,
			RedirectAttributes rttr) {
		
		String memberPw2 =  bcryptPasswordEncoder.encode(memberPw);
		
		int value = ms.memberPwChange(memberId, memberPw2);
		
		model.addAttribute("memberId", memberId);
		
		if(value==1) {
			rttr.addFlashAttribute("msg", "패스워드가 변경되었습니다.");
			return "redirect:/member/memberLogin.do";
		}
		
		else {
			System.out.println("실패");	
			return "redirect:/member/searchPwVal.do?memberId="+memberId;
		}
	}
}
