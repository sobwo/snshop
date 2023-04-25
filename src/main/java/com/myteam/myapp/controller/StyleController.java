package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/style")
public class StyleController {
	
	@RequestMapping(value = "/styleMain.do")
	public String styleMain() {
		
		return "style/styleMain";
	}

}
