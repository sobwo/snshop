package com.myteam.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.CommentVo;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.CommentService;
import com.myteam.myapp.service.MemberService;

@Controller
@RequestMapping(value ="/comment")
public class CommentController {

	@Autowired
	MemberService ms;
	@Autowired
	BoardService bs;
	@Autowired
	CommentService cs;
	
	@Transactional
	@ResponseBody
	@RequestMapping(value ="/comment_commentAction.do")
	public JSONObject comment_commentAction(HttpSession session,
			  @RequestParam("boardNo")int boardNo,
			  @RequestParam("ccontents") String ccontents,
			  Model model ){
		 
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		int value = cs.commentInsert(memberNo, boardNo, ccontents);
		  
		  System.out.println("boardNo : " +boardNo);
		  System.out.println("ccontents :"+ ccontents);
		  
		  HashMap<String,Object> hm = new HashMap<>();
		  hm.put("value",value);
		  
		  JSONObject json = new JSONObject(hm);

		  return json;
	}
	
	@RequestMapping(value ="/comment_commentShow.do")
	public String comment_commentShow(
			  @RequestParam("boardNo")int boardNo,
			  Model model){
		
		ArrayList<CommentVo> get = cs.getcomment(boardNo);
		
		model.addAttribute("get",get);
		
		return "style/commentAjax";
	
	}

}

