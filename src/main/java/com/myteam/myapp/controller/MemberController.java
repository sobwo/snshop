package com.myteam.myapp.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.KakaoLoginService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.NaverLoginService;
import com.myteam.myapp.service.RegisterMail;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private NaverLoginService naverLoginService;
	private String apiResult = null;
	
	@Autowired
	MemberService ms;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private KakaoLoginService kakaoLoginService;
	
	@Autowired
	private void setNaverLoginService(NaverLoginService naverLoginService) {
		this.naverLoginService = naverLoginService;
	}

	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin(
			Model model,
			HttpSession session) {
		String naverAuthUrl = naverLoginService.getAuthorizationUrl(session);
		String kakaoAuthUrl = kakaoLoginService.getAuthorizationUrl(session);
		
		model.addAttribute("urlKakao", kakaoAuthUrl);
		model.addAttribute("urlNaver",naverAuthUrl);
		
		return "member/memberLogin";
	}

	@RequestMapping(value = "/memberLoginAction.do")
	public String memberLoginAction(
			@RequestParam(value="memberId",required=false) String memberId,
			@RequestParam(value="memberPw",required=false) String memberPw,
			HttpSession session,
			RedirectAttributes rttr) {
		
		String path= null;
		MemberVo mv = ms.memberLogin(memberId);
		
		if(mv != null && mv.getSocial().equals("other") && bcryptPasswordEncoder.matches(memberPw, mv.getMemberPw())) {
			rttr.addAttribute("memberNo",mv.getMemberNo());
			
			if(session.getAttribute("dest")==null)
				path = "redirect:/";
			else {
				String dest = (String) session.getAttribute("dest");
				path = "redirect:"+dest;
			}
		}
		
		else if(mv != null && mv.getSocial().equals("social")) {
			rttr.addAttribute("memberNo",mv.getMemberNo());
			
			if(session.getAttribute("dest")==null)
				path = "redirect:/";
			else {
				String dest = (String) session.getAttribute("dest");
				path = "redirect:"+dest;
			}
		}
		
		else {
			rttr.addFlashAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
			path="redirect:/member/memberLogin.do";
		}
			
		return path;
	}
	
	@RequestMapping(value = "/socialLoginAction.do")
	public String socialLoginAction(
			Model model,
			@RequestParam String code,
			@RequestParam String state,
			@RequestParam("index") String index,
			HttpSession session
			) throws Exception {
		
		String memberId = null;
		String memberName = null;
		String memberEmail = null;
		String memberPhone = null;
		String memberGender = null;
		MemberVo mv = new MemberVo();
		//네이버
		if(index.equals("naver")) {
		OAuth2AccessToken oauthToken_naver;
		oauthToken_naver = naverLoginService.getAccessToken(session, code, state);
		apiResult = naverLoginService.getuserProfile(oauthToken_naver);
		
		JSONParser jsonParser_naver = new JSONParser();
		JSONObject jsonObj_naver;
		jsonObj_naver = (JSONObject) jsonParser_naver.parse(apiResult);
		JSONObject response_obj_naver = (JSONObject) jsonObj_naver.get("response");
		
		System.out.println(response_obj_naver);
		
		memberId = (String) response_obj_naver.get("id");
		memberName = (String) response_obj_naver.get("name");
		memberEmail = (String) response_obj_naver.get("email");
		memberPhone = (String) response_obj_naver.get("mobile_e164");
		
		}
		
		else if(index.equals("kakao")) {
		//카카오
		OAuth2AccessToken oauthToken_kakao;
		oauthToken_kakao = kakaoLoginService.getAccessToken(session, code, state);
		apiResult = kakaoLoginService.getuserProfile(oauthToken_kakao);
		
		JSONParser jsonParser_kakao = new JSONParser();
		JSONObject jsonObj_kakao;
		
		jsonObj_kakao = (JSONObject) jsonParser_kakao.parse(apiResult);
		JSONObject response_obj_kakao = (JSONObject) jsonObj_kakao.get("kakao_account");
		JSONObject response_obj2_kakao = (JSONObject) response_obj_kakao.get("profile");
		
		memberId = (String) response_obj_kakao.get("email");
		memberName = (String) response_obj2_kakao.get("nickname");
		memberEmail = (String) response_obj_kakao.get("email");
		memberGender = (String) response_obj_kakao.get("gender");	
		}
		
		ms.memberInsertSocial(memberId, memberName, memberEmail, memberPhone,memberGender);
		
		model.addAttribute("memberId",memberId);
		
		return "redirect:/member/memberLoginAction.do";
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
