package com.myteam.myapp.controller;

import java.io.File;
import java.net.MalformedURLException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
			HttpServletRequest req) throws Exception {
		
		String uploadFolderPath = "/uploads"; // 업로드 폴더 경로 설정
		
		// 폴더 생성
		File uploadFolder = new File(uploadFolderPath);
		if (!uploadFolder.exists()) {
		    boolean created = uploadFolder.mkdirs();
		    if (!created) {
		        // 폴더 생성 실패 처리
		        System.out.println("Failed to create upload folder.");
		    }
		}
		else
			System.out.println("있음");
		
		
		return "home";
	}
	
}
