package com.myteam.myapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.util.MediaUtils;
import com.myteam.myapp.util.UploadFileUtiles;
import com.myteam.myapp.util.UploadProfile;

@Controller
@RequestMapping(value = "/myPage")
public class MyPageController {
	
	@Autowired  
	BoardService bs; 

	@Autowired
	MemberService ms;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

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
	public String profileInfo(
			Model model,
			HttpSession session) {
		
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		MemberVo mv = ms.memberInfo(memberNo);
		
		model.addAttribute("mv", mv);
		
		return "myPage/profileInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/profileImgChange.do")
	public String profileImgChange(
			@RequestParam("profileImg") MultipartFile profileImg,
			HttpSession session,
			HttpServletRequest request
			) throws Exception, Exception{
		
		String str = null;
		MultipartFile file = profileImg;
		String uploadedPath = request.getSession().getServletContext().getResource("/resources/uploadFiles/").getPath();

		String uploadedFileName="";
		if(!file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadProfile.uploadFile(
				uploadedPath, 
				file.getOriginalFilename(),
				file.getBytes());
		}

		
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());

		MemberVo mv = new MemberVo();
		mv.setMemberNo(memberNo);
		mv.setProfileImg(uploadedFileName);
		
		int value = ms.updateProfileImg(mv);
		
		str = "{\"value\":\""+value+"\"}";
		
		return str; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/profileImgShow.do")
	public String profileImgShow(
			HttpSession session) {
		String result = null;
		
		int memberNo=  Integer.parseInt(session.getAttribute("memberNo").toString());
		
		String str = ms.profileImgShow(memberNo);
		result = "{\"value\":\""+str+"\"}";

		return result; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/profileImgDelete.do")
	public String profileImgDelete(
			HttpSession session) throws Exception {
		
		int memberNo=  Integer.parseInt(session.getAttribute("memberNo").toString());
		
		
		int value = ms.profileImgDelete(memberNo);
		
		String uploadedPath = request.getSession().getServletContext().getResource("/resources/uploadFiles/").getPath();
		
		File directory = new File(uploadedPath);
		File[] files = directory.listFiles();
		for(File file : files) {
		    if(file.delete()) {
		        System.out.println(file.getName() + " �궘�젣 �꽦怨�");
		    } else {
		        System.out.println(file.getName() + " �궘�젣 �떎�뙣");
		    }
		}
		
		String str = "{\"value\":\""+value+"\"}";

		return str; 
	}
	@ResponseBody
	@RequestMapping(value = "/infoChange.do")
	public String infoChange(
			HttpSession session,
			@RequestParam("index") String index,
			@RequestParam("value") String value) {
		
		int memberNo=  Integer.parseInt(session.getAttribute("memberNo").toString());
		
		if(index.equals("pw"))
			value = bcryptPasswordEncoder.encode(value);
		

		int result = ms.modifyProfile(index, value, memberNo);
		
		System.out.println("result:"+result);
		
		String str = "{\"result\":\""+result+"\"}";
		
		return str;
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
	
	@ResponseBody
	@RequestMapping(value="/displayFile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String contentsImg) throws Exception {
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;

	    try {
	        String formatName = contentsImg.substring(contentsImg.lastIndexOf(".") + 1);
	        MediaType mediaType = MediaUtils.getMediaType(formatName);

	        HttpHeaders headers = new HttpHeaders();

	        String uploadPath = "D:/dav1230/uploadFiles"; // 임시
	        in = new FileInputStream(uploadPath + contentsImg);

	        if (mediaType != null) {
	            headers.setContentType(mediaType);
	        } else {
	            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	            headers.add("Content-Disposition", "attachment; filename=\"" +
	                    new String(contentsImg.getBytes("UTF-8"), "ISO-8859-1") + "\"");
	        }

	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    } finally {
	        in.close();
	    }

	    return entity;
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
		
		String uploadPath = "D:/dav1230/uploadFiles"; // 임시
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