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
		
		//db 관련 로직
		int value = os.orderInsert(goodsNo, memberNo, addressNo, totalPrice, payInfo);
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		model.addAttribute("gv", gv);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("payInfo",payInfo);
		
	
		if(value==1) 
			return "order/orderFinish";
		else
			return "redirect:/order/orderPage.do";
	}
	
	@RequestMapping(value = "/order_addressAction.do")
	public String order_addressAction(HttpSession session,
	
			@RequestParam("basicName") String basicName,
			@RequestParam("basicPhone") String basicPhone,
	
			@RequestParam("basicAddrNum") String basicAddrNum,
	
			@RequestParam("basicAddr") String basicAddr,
	
			@RequestParam("basicAddrDetail") String basicAddrDetail,
			@RequestParam(value = "basic_check", defaultValue = "N") String basic_check,
			@RequestParam("goodsNo") int goodsNo, Model model) {
	
		int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		
		os.addressInsert(basicName, basicPhone, basicAddrNum, basicAddr, basicAddrDetail, basic_check, memberNo);
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		model.addAttribute("gv", gv);
		model.addAttribute("goodsNo", goodsNo);
	
		return "redirect:/order/orderPage.do";
	
	}
	@ResponseBody
	@RequestMapping(value = "/order_showAddress.do")
	public JSONObject showAddress(@RequestParam("index") int index) {
		HashMap<String, Object> map = new HashMap<>();
		AddressVo av = os.addressSelectOne(index);

		map.put("av", av);

		JSONObject js = new JSONObject(map);

		return js;
	}
	
	
	
//	@ResponseBody
//	@RequestMapping(value = "/order_orderPayInfo.do", method = RequestMethod.POST)
//	public String order_orderPayInfo(HttpServletRequest )
//	
//	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/order_point.do")
	public JSONObject order_point(
			@RequestParam("index") int index) {


		JSONObject js = new JSONObject();

		return js;
	}

}
