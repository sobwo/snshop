package com.myteam.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@RequestMapping(value = "/orderAgree.do")
	public String orderAgree() {
		
		return "order/orderAgree";
	}
	
	@RequestMapping(value = "/orderPage.do")
	public String orderPage() {
		
		return "order/orderPage";
	}
	

}
