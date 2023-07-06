package com.myteam.myapp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.HashTagVo;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.ShopService;
import com.myteam.myapp.service.StyleService;

@Controller
public class HomeController {
	
	@Autowired
	ShopService ss;
	@Autowired
	MemberService ms;
	@Autowired
	StyleService ss1;
	@Autowired  
	BoardService bs; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			HttpServletRequest req, HttpSession session) throws Exception {
		
//		String tempDir = System.getProperty("java.io.tmpdir");
//		
//		System.out.println("tempDir"+tempDir);
//		
//		String uploadFolderPath = tempDir + File.separator + "uploads"; // 업로드 폴더 경로 설정
//		
//		// 폴더 생성
//		File uploadFolder = new File(uploadFolderPath);
//		if (!uploadFolder.exists()) {
//		    boolean created = uploadFolder.mkdirs();
//		    if(created) {
//	            uploadFolder.setReadable(true);
//	            uploadFolder.setWritable(true);
//	            uploadFolder.setExecutable(true);
//		    }
//		    	
//		    else {
//		        // 폴더 생성 실패 처리
//		        System.out.println("Failed to create upload folder.");
//		    }
//		}
//		else
//			System.out.println("있음");


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
		
		model.addAttribute("hhlist", hhlist);
		model.addAttribute("llist", llist);
		model.addAttribute("hlist",hlist);
		model.addAttribute("mv",mv);

		return "home";
	}
	
}
