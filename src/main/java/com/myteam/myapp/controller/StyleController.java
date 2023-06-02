package com.myteam.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.LikesDto;
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

	/*
	 * @RequestMapping(value = "/style_following.do") public String
	 * styleFollowing(HttpSession session) {
	 
	 * ArrayList<BoardVo> blist= ss1.boardSelectAll(); 
	 * int memberNo = Integer.parseInt(model.getAttribute("memberNo").toString());
	 * 
	 * return "style/style_following";
	 * 
	 * }
	 */
	
		@RequestMapping(value = "/style_following.do",method=RequestMethod.GET)
	  
		public String styleFollowing(
				HttpSession session,
				Model model) {
			int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
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
	
	 
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/likebtn_check.do" , method=RequestMethod.POST) public
	 * JSONObject likebtn_check(
	 * 
	 * @RequestParam("boardNo")int boardNo, LikesVo lv, HttpSession session ) throws
	 * Exception{ int memberNo =
	 * Integer.parseInt(session.getAttribute("memberNo").toString());
	 * 
	 * lv.setBoardNo(boardNo); lv.setMemberNo(memberNo);
	 * 
	 * int value = bs.likesList(lv);
	 * 
	 * if(value ==0) { bs.insertLike(lv); }else if(value != 0 ) { bs.updateLike(lv);
	 * } int cnt = bs.likesCnt(memberNo, boardNo); int totalCntUpdate =
	 * bs.likesTotalCntUpdate(lv.getBoardNo());
	 * 
	 * JSONObject json = new JSONObject(); json.put("value", value);
	 * json.put("cnt",cnt); json.put("totalCntUpdate", totalCntUpdate);
	 * 
	 * return json;
	 * 
	 * }
	 */
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="like_TotalCnt.do",method=RequestMethod.GET) public
	 * JSONObject like_TotalCnt(
	 * 
	 * @RequestParam("boardNo")int boardNo, BoardVo bv, HttpSession session) throws
	 * Exception{
	 * 
	 * int totalCntUpdate = bs.likesTotalCntUpdate(bv.getBoardNo());
	 * 
	 * JSONObject json = new JSONObject();
	 * json.put("totalCntUpdate",totalCntUpdate);
	 * 
	 * return json; }
	 */
	
	
	
	
	
	
	
//	@RequestMapping(value = "/style_favorite.do")
//	public String styleFavorite( 
//		@RequestParam("boardNo")int boardNo,Model model) { 
//			BoardVo bv = ss1.boardSelectOne(boardNo);
//
//	
//		return "style/style_favorite";
//	}
	/*
	 * @RequestMapping(value = "/style_comment.do") public String style_comment(
	 * 
	 * @RequestParam(""){ }
	 */
	  
	  

}
