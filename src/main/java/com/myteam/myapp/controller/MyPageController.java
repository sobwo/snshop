package com.myteam.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.util.UploadFileUtiles;

@Controller
@RequestMapping(value = "/myPage")
public class MyPageController {
	
	@Autowired  
	BoardService bs; 

	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "/myPageMain.do")
	public String myPageMain(
			Model model,
			HttpSession session) {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		MemberVo mv = ms.memberInfo(memberNo);
		
		model.addAttribute("mv", mv);
		
		return "myPage/myPageMain";
	}
	
	@RequestMapping(value = "/purchase.do")
	public String purchase() {
		
		return "myPage/purchase";
	}
	
	@RequestMapping(value = "/sale.do")
	public String sale() {
		
		return "myPage/sale";
	}
	
	@RequestMapping(value = "/interest.do")
	public String interest() {
		
		return "myPage/interest";
	}
	
	@RequestMapping(value = "/profileInfo.do")
	public String profileInfo() {
		
		return "myPage/profileInfo";
	}
	
	@RequestMapping(value = "/profileImgChange.do")
	public int profileImgChange(
			@RequestParam("profileImg") MultipartFile profileImg,
			HttpSession session
			) throws Exception, Exception{
		
		String str = null;
		
		MultipartFile file = profileImg;
		
		String uploadedFileName="";
		if(!file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadFileUtiles.uploadFile(
				"D:/snshop/uploadFiles", 
				file.getOriginalFilename(),
				file.getBytes());
		}
		
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());

		MemberVo mv = new MemberVo();
		mv.setMemberNo(memberNo);
		mv.setProfileImg(uploadedFileName);
		
		int value = ms.updateProfileImg(mv);
		
		return value; 
	}
	
	@RequestMapping(value = "/myStyle.do")
	public String myStyle() {
		
		return "myPage/myStyle";
	}
	
	@RequestMapping(value = "/myStyle_upload.do")
	public String myStyle_upload() {
		
		return "myPage/myStyle_upload";
	}

	@RequestMapping(value="/myStyle_uploadeAction.do")
	public String myStyleUploadeAction(
			@RequestParam("contentsImg") MultipartFile contentsImg,
			@RequestParam("contents") String contents,
			HttpSession session
			) throws Exception {
		
		MultipartFile file = contentsImg;
		
		String uploadedFileName="";
		if(!file.getOriginalFilename().equals("")) {
			
			uploadedFileName = UploadFileUtiles.uploadFile(
				"D:/dav1230/uploadFiles", 
				file.getOriginalFilename(),
				file.getBytes());
		}
				
		int memberNo = 0;
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		BoardVo bv = new BoardVo();
		bv.setContentsImg(uploadedFileName);
		bv.setContents(contents);
		
		int value = bs.boardInsert(bv);

		return"redirect:/myPage/myStyle.do";
	}	

	@RequestMapping(value = "/address.do")
	public String address() {
		
		return "myPage/address";
	}
	
	@RequestMapping(value = "/incomeAccount.do")
	public String incomeAccount() {
		
		return "myPage/incomeAccount";
	}
	
	@RequestMapping(value = "/point.do")
	public String point() {
		
		return "myPage/point";
	}
	
	@RequestMapping(value = "/payAccount.do")
	public String payAccount() {
		
		return "myPage/payAccount";
	}
}
