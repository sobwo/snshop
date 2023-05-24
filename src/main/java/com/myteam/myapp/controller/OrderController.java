package com.myteam.myapp.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.OrderService;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@Autowired
	ShopService ss;
	@Autowired
	OrderService os;
	@Autowired
	MemberService ms;

	


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
			@RequestParam(value="point", defaultValue="0") int point,
			HttpSession session,
			Model model) {
		
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		AddressVo av = os.addressOrderPage(memberNo);
		MemberVo mv = ms.memberInfo(memberNo);
		
		int total=gv.getPrice()-point;
		
		model.addAttribute("mv", mv);
		model.addAttribute("gv", gv);
		model.addAttribute("av", av);
		model.addAttribute("total",total);
		model.addAttribute("point",point);
		
		return "order/orderPage"; 
	}
	
	@RequestMapping(value = "/orderFinish.do")
	public String orderFinish(
		@RequestParam("price") int totalPrice, 
		@RequestParam("payInfo") String payInfo,
		@RequestParam("addressNo") int addressNo,
		@RequestParam("goodsNo") int goodsNo, 
			/* @RequestParam("sizeNo")int sizeNo, */
		HttpSession session,
		Model model) {
		
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		//db ���� ����
		int value = os.orderInsert(goodsNo, memberNo, addressNo, totalPrice, payInfo);
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		model.addAttribute("gv", gv);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("payInfo",payInfo);
		
		return "order/orderPage";
	}
	
	
	
	/*
	 * @RequestMapping(value = "/orderFinish.do") public String orderFinish(
	 * 
	 * @RequestParam("goodsNo")int goodsNo, Model model) {
	 * 
	 * Goods gv = ss.goodsSelectOne(goodsNo); model.addAll) }
	 * 
	 * )
	 * 
	 * 
	 * 
	 */
	
	
	
	@RequestMapping(value = "/orderFinish.do")
	public String orderFinish( 
		@RequestParam("goodsNo")int goodsNo,
		Model model ){
		
			GoodsVo gv = ss.goodsSelectOne(goodsNo);
			
			model.addAttribute("gv",gv);
			
			return "order/orderFinish";
		

	}
	

}
