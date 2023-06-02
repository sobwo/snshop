package com.myteam.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myteam.myapp.domain.BoardVo;
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
	
	@RequestMapping(value ="/comment_commentAction.do")
	public String comment_commentAction(HttpSession session,
			  @RequestParam("boardNo")int boardNo,
			  @RequestParam("ccontents") String ccontents,
			  Model model ){
		 
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		cs.commentInsert(memberNo, boardNo, ccontents);
		  
		  System.out.println("boardNo : " +boardNo);
		  System.out.println("ccontents :"+ ccontents);
		  
		  return "style/following";
	}


}

