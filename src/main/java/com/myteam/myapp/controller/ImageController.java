package com.myteam.myapp.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.util.UploadProfile;

@RestController
@RequestMapping(value="/image")
public class ImageController {
	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "/profileImgShow.do")
	public ResponseEntity<Resource> profileImgShow(
			HttpSession session,
			HttpServletRequest request) throws Exception {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
//		String tempDir = System.getProperty("java.io.tmpdir");
		
//		String uploadFolderPath = tempDir + File.separator + "uploads"; // 업로드 폴더 경로 설정
		String uploadFolderPath = "C:\\\\upload\\\\dev1230";
		String uploadedPath = uploadFolderPath;
		MemberVo mv = ms.profileImgShow(memberNo);
		
		File dir = new File(uploadedPath);
		
		int check = 0;
		String uploadedFileName = "";
		String[] fileList = dir.list();
		
		
		if(mv.getProfileImg()==null || mv.getProfileImg().equals("noImage")) {
			return null;
		}
		
		else {
			for(String file : fileList) {
				if(mv.getProfileImg().contains(file)) {
					check=1;
				}
			}
			
			if(check!=1) {
				if(!mv.getProfileImg().equals("")) {	
					uploadedFileName = UploadProfile.uploadFile(
						uploadedPath, 
						mv.getProfileImg(),
						mv.getProfileImgData(),
						"show");
				}
			}
			
			else
				uploadedFileName = mv.getProfileImg();
		}
		
		System.out.println("uploadedFileName"+uploadedFileName);
		
		Path imagePath = Paths.get(uploadedPath, uploadedFileName);
		Resource imageResource = new UrlResource(imagePath.toUri());

		if (imageResource.exists() && imageResource.isReadable()) {
			return ResponseEntity.ok()
					.contentType(MediaType.IMAGE_PNG)
					.body(imageResource);
        } else {
            return null;
        }	
	}
	
	@RequestMapping(value = "/profileImgChange.do")
	public String profileImgChange(
			@RequestParam("profileImg") MultipartFile profileImg,
			HttpSession session,
			HttpServletRequest request
			) throws Exception, Exception{
		
		String str = null;
		MultipartFile file = profileImg;
		
//		String tempDir = System.getProperty("java.io.tmpdir");
//		
//		String uploadedPath = tempDir + File.separator + "uploads"; // 업로드 폴더 경로 설정
		String uploadedPath = "\\\\DESKTOP-IQUHLB7\\uploadFiles";
		String uploadedFileName="";
		if(!file.getOriginalFilename().equals("")) {	
			uploadedFileName = UploadProfile.uploadFile(
				uploadedPath, 
				file.getOriginalFilename(),
				file.getBytes(),
				"upload");
		}
		System.out.println("getBytes : "+file.getBytes().length);
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}

		MemberVo mv = new MemberVo();
		mv.setMemberNo(memberNo);
		mv.setProfileImg(uploadedFileName);
		mv.setProfileImgData(file.getBytes());
		
		int value = ms.updateProfileImg(mv);
		
		str = "{\"value\":\""+value+"\"}";
		
		return str; 
	}
	
	@RequestMapping(value = "/profileImgDelete.do")
	public String profileImgDelete(
			HttpSession session,
			HttpServletRequest request) throws Exception {
		
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		int value = ms.profileImgDelete(memberNo);
		
		String tempDir = System.getProperty("java.io.tmpdir");
		
		String uploadedPath = tempDir + File.separator + "uploads"; // 업로드 폴더 경로 설정
		
		File directory = new File(uploadedPath);
		File[] files = directory.listFiles();
		for(File file : files) {
		    if(file.delete()) {
		        System.out.println(file.getName() + "삭제");
		    } else {
		        System.out.println(file.getName() + "삭제 불가");
		    }
		}
		
		String str = "{\"value\":\""+value+"\"}";

		return str; 
	}
}
