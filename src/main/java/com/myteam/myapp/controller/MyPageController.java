package com.myteam.myapp.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.SearchCriteria;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.util.MediaUtils;
import com.myteam.myapp.util.UploadFileUtiles;

import oracle.jdbc.proxy.annotation.Post;

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
	public String myStyle(
			Model model,
			HttpSession session) {
				
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		MemberVo mv = ms.memberInfo(memberNo);
		
		ArrayList<BoardVo> blist = bs.boardList(memberNo);

		model.addAttribute("mv", mv);
		model.addAttribute("blist", blist);



		return "myPage/myStyle";
	}

	@RequestMapping(value = "/myStyle_upload.do")
	public String myStyle_upload() {
		
		return "myPage/myStyle_upload";
	}

	@RequestMapping(value="/myStyle_uploadeAction.do")
	public String myStyleUploadeAction(
			@RequestParam("contentsImg") MultipartFile[] contentsImg,
			@RequestParam("contents") String contents,
			@RequestParam("viewCnt") String viewCnt,
			HttpSession session
			) throws Exception {
		
		String uploadPath = "D:/dav1230/uploadFiles"; // юс╫ц
		List<String> uploadedFileNames = new ArrayList<>();
		for (MultipartFile file : contentsImg) {
			if (!file.getOriginalFilename().equals("")) {
				String uploadedFileName = UploadFileUtiles.uploadFile(
						uploadPath, 
						file.getOriginalFilename(),
						file.getBytes());
				uploadedFileNames.add(uploadedFileName);
			}
		}
		
		BoardVo bv = new BoardVo();
		bv.setContentsImg(String.join(",", uploadedFileNames));
		bv.setContents(contents);
		bv.setViewCnt(viewCnt);
				
		int memberNo = 0;
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		bv.setMemberNo(memberNo);
		
		int value = bs.boardInsert(bv);

		return "redirect:/myPage/myStyle.do";
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