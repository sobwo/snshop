package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	@RequestMapping(value = "/shopMain.do")
	public String shopMain() {
		
		return "shop/shopMain";
	}
	
	@RequestMapping(value = "/shopContents.do")
	public String shopcontents() {
		
		return "shop/shopContents";
	}
}
