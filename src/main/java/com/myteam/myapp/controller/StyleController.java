package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/style")
public class StyleController {
	
	@RequestMapping(value = "/style_following.do")
	public String styleFollowing() {
		
		return "style/style_following";
	}
	
	@RequestMapping(value = "/style_discover.do")
	public String styleMain() {
		
		return "style/style_discover";
	}

}
