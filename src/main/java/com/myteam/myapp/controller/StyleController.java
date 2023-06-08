package com.myteam.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.FollowingVo;
import com.myteam.myapp.domain.LikeMemberDto;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.domain.MemberVo;

import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.ShopService;
import com.myteam.myapp.service.StyleService;


@Controller
@RequestMapping(value = "/style")
public class StyleController {

	@Autowired
	ShopService ss;
	@Autowired
	MemberService ms;
	@Autowired
	StyleService ss1;
	@Autowired  
	BoardService bs; 


		@RequestMapping(value = "/style_following.do",method=RequestMethod.GET)
	  
		public String styleFollowing(
				HttpSession session,
				Model model) {
			
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<BoardVo> blist =ss1.boardSelectAll(memberNo);

		model.addAttribute("blist", blist);
		/* model.addAttribute("memberName", memberName); */
		model.addAttribute("mv",mv);
	  
		return "style/style_following";
	 
	 }
	  
	@RequestMapping(value = "/style_discover.do")
	public String style_discover(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}

		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<LikesDto> llist =ss1.boardTotalList(memberNo);
		
		model.addAttribute("llist", llist);
		model.addAttribute("mv",mv);
		
		return "style/style_discover";
	}
	
	@RequestMapping(value = "/style_discover_newest.do")
	public String style_discover_newest(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}

		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<LikesDto> llist =ss1.boardTotalList_newest(memberNo);
		
		model.addAttribute("llist", llist);
		model.addAttribute("mv",mv);
		
		return "style/style_discover_newest";
	}
	
	@ResponseBody
	@RequestMapping(value="/followingCheck.do", method=RequestMethod.POST)
	public JSONObject followingCheck(
			@RequestParam("followingMemberNo")int followingMemberNo,
			FollowingVo fv,			
			HttpSession session) throws Exception{
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		fv.setFollowingMemberNo(followingMemberNo);
		fv.setMemberNo(memberNo);
		
		int value = ss1.followingList(fv);
		int value2  = 0;
		
		if (value == 0){
			
			value2 = ss1.insertfollowing(fv);
		
		}else if (value != 0) {
			
			value2 = ss1.updatefollowing(fv);
		}

		JSONObject json = new JSONObject();
			
		json.put("value", value2);
		
		return json;
	};
	
	@ResponseBody
	@RequestMapping(value="/followingshow.do")
	public JSONObject followingshow(
			@RequestParam("followingMemberNo")int followingMemberNo,
			FollowingVo fv,			
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		int nowfollowingState = ss1.nowfollowingState(memberNo, followingMemberNo);
		JSONObject json = new JSONObject();
			
		json.put("nowfollowingState", nowfollowingState);
		return json;
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/likeMemberList.do") public JSONObject likeMemberList(
	 * 
	 * @RequestParam("boardNo")int boardNo, Model model, HttpSession session) {
	 * ArrayList<LikesDto> get = ss1.getlikeMemberList(boardNo);
	 * 
	 * model.addAttribute("get", get); }
	 */
	
	@RequestMapping(value="/likeMemberList.do") 
	public String  likeMemberList(
			@RequestParam("boardNo")int boardNo,
			Model model) {
			
		ArrayList<LikeMemberDto> get = ss1.getlikeMemberList(boardNo);
		/* model.addAttribute("likeMemberList",likeMemberList); */
		
		model.addAttribute("get", get);
		/* JSONObject result = new JSONObject(); */
		
		
		return "style/likepush2";
			
		}

	}
	
	
	
	

