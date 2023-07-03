package com.myteam.myapp.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.ArrayUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.Board_hashtagVo;
import com.myteam.myapp.domain.FollowingVo;
import com.myteam.myapp.domain.HashTagVo;
import com.myteam.myapp.domain.LikeMemberDto;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.ShopService;
import com.myteam.myapp.service.StyleService;
import com.myteam.myapp.util.MediaUtils;


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
		ArrayList<HashTagVo> hlist = new ArrayList<>();

		for (BoardVo bv : blist) {
		    int boardNo = bv.getBoardNo();
		    
		    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
		    
		    hlist.addAll(hashtagList);
		    
		}

		model.addAttribute("hlist", hlist);
		model.addAttribute("blist", blist);
		model.addAttribute("mv",mv);
	  
		return "style/style_following";
	 
	 }
		@RequestMapping(value = "/style_discover2.do")
		public String style_discover2(
				Model model,
				HttpSession session) {
			
			int memberNo = 0;
			
			if(session.getAttribute("memberNo") != null) {
				memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
			}

			MemberVo mv = ms.memberInfo(memberNo);
			
			ArrayList<LikesDto> llist =ss1.boardTotalList(memberNo);
			ArrayList<HashTagVo> hlist = new ArrayList<>();

			for (BoardVo bv : llist) {
			    int boardNo = bv.getBoardNo();
			    
			    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
			    
			    hlist.addAll(hashtagList);
			}

			model.addAttribute("hlist", hlist);
			model.addAttribute("llist", llist);
			model.addAttribute("mv",mv);
			
			return "style/style_discover2";
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
		ArrayList<HashTagVo> hlist=ss1.hashTagTotalList(memberNo);
		
		ArrayList<HashTagVo> hhlist = new ArrayList<>();
		for (BoardVo bv : llist) {
		    int boardNo = bv.getBoardNo();
		    
		    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
		    
		    hhlist.addAll(hashtagList);
		}
		
		/*
		 * ArrayList<BoardVo> llistt = new ArrayList<>(); for (BoardVo bv : llist) { int
		 * memberNo = bv.getMemberNo(); MemberVo mv1 = ms.memberInfo(memberNo);
		 * bv.setMemberNo(memberNo); llistt.add(bv); } model.addAttribute("llistt",
		 * llistt);
		 */
		
		model.addAttribute("hhlist", hhlist);
		model.addAttribute("llist", llist);
		model.addAttribute("hlist",hlist);
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
		ArrayList<HashTagVo> hlist=ss1.hashTagTotalList(memberNo);
		
		ArrayList<HashTagVo> hhlist = new ArrayList<>();

		for (BoardVo bv : llist) {
		    int boardNo = bv.getBoardNo();
		    
		    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
		    
		    hhlist.addAll(hashtagList);
		}

		model.addAttribute("hhlist", hhlist);
		
		model.addAttribute("llist", llist);
		model.addAttribute("hlist",hlist);
		
		
		model.addAttribute("mv",mv);
		
		return "style/style_discover_newest";
	}
	
	@RequestMapping(value = "/style_discover_newest2.do")
	public String style_discover_newest2(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}

		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<LikesDto> llist =ss1.boardTotalList_newest(memberNo);
		
		ArrayList<HashTagVo> hlist = new ArrayList<>();

		for (BoardVo bv : llist) {
		    int boardNo = bv.getBoardNo();
		    
		    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
		    
		    hlist.addAll(hashtagList);
		}

		model.addAttribute("hlist", hlist);
		
		model.addAttribute("llist", llist);
		model.addAttribute("mv",mv);
		
		return "style/style_discover_newest2";
	}
	
	@RequestMapping(value = "/style_hashTag.do")
	public String style_hashTag(
			@RequestParam("hashTagNo") int hashTagNo,
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}

		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<LikesDto> llist =ss1.boardHashTagList(memberNo,hashTagNo);
		
		ArrayList<HashTagVo> hlist=ss1.hashTagTotalList(memberNo);
		
		ArrayList<HashTagVo> hhlist = new ArrayList<>();

		for (BoardVo bv : llist) {
		    int boardNo = bv.getBoardNo();
		    
		    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
		    
		    hhlist.addAll(hashtagList);
		}

		model.addAttribute("hhlist", hhlist);
		
		model.addAttribute("llist", llist);
		model.addAttribute("hlist",hlist);
		model.addAttribute("mv",mv);
		
		
		return "style/style_hashTag";
	}
	
	@RequestMapping(value = "/style_hashTag2.do")
	public String style_hashTag2(
			@RequestParam("hashTagNo") int hashTagNo,
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}

		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<LikesDto> llist =ss1.boardHashTagList(memberNo,hashTagNo);

		ArrayList<HashTagVo> hlist = new ArrayList<>();

		for (BoardVo bv : llist) {
		    int boardNo = bv.getBoardNo();
		    
		    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
		    
		    hlist.addAll(hashtagList);
		}

		model.addAttribute("hlist", hlist);
		
		model.addAttribute("llist", llist);
		model.addAttribute("mv",mv);
		
		return "style/style_hashTag2";
	}
	
	@RequestMapping(value = "/myStyle2.do")
	public String myStyle2(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<LikesDto> llist = bs.boardList(memberNo);
		
		ArrayList<HashTagVo> hlist = new ArrayList<>();

		for (BoardVo bv : llist) {
		    int boardNo = bv.getBoardNo();
		    
		    ArrayList<HashTagVo> hashtagList = bs.hashtagBoard(boardNo);
		    
		    hlist.addAll(hashtagList);
		}

		model.addAttribute("hlist", hlist);
				
		model.addAttribute("mv", mv);
		model.addAttribute("llist", llist);
		
		return "style/myStyle2";
	}

	@ResponseBody
	@RequestMapping(value = "/deleteAction.do" , method=RequestMethod.POST)
	public JSONObject deleteAction(
			@RequestParam("boardNo") int boardNo,
			LikesDto ld,
			HttpSession session) throws Exception{
		
		
			ld.setBoardNo(boardNo);
			int value = ss1.boardDelete(ld);
			
			int value3 = ss1.hashtagCntUpdate(ld.getBoardNo());
			int value2 = ss1.board_hashtagDelete(ld.getBoardNo());
			
			JSONObject json = new JSONObject();
			
			json.put("value", value);

			
			return json;
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
		
		if (value == 0){
			
			ss1.insertfollowing(fv);
		
		}else if (value != 0) {
			
			ss1.updatefollowing(fv);
		}

		JSONObject json = new JSONObject();
			
		json.put("value", value);
		
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
		
		Integer nowfollowingState = ss1.nowfollowingState(memberNo, followingMemberNo);
		
		JSONObject json = new JSONObject();
		json.put("nowfollowingState", nowfollowingState);
		
		return json;
	}
	

	@RequestMapping(value="/likeMemberList.do") 
	public String  likeMemberList(
			@RequestParam("boardNo")int boardNo,
			Model model) {
			
		ArrayList<LikeMemberDto> get = ss1.getlikeMemberList(boardNo);

		
		model.addAttribute("get", get);

		
		
		return "style/likepush2";
			
		}

	}
	
	
	
	

