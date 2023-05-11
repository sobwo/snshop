package com.myteam.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@Autowired
	ShopService ss;
	
	@RequestMapping(value = "/orderAgree.do")
	public String orderAgree(
			@RequestParam("goodsNo") int goodsNo,
			Model model
			) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		
		model.addAttribute("gv", gv);
		
		return "order/orderAgree";
	}
	
	@RequestMapping(value = "/orderPage.do")
	public String orderPage(
			@RequestParam("goodsNo") int goodsNo,
			Model model) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		
		model.addAttribute("gv", gv);
		
		
		return "order/orderPage";
	}
	
	@RequestMapping(value = "/orderFinish.do")
	public String orderFinish() {
		
		return "order/orderFinish";
	}
	

}
