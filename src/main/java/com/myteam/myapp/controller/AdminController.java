package com.myteam.myapp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myteam.myapp.domain.AdminGoodsDto;
import com.myteam.myapp.domain.AdminSizeDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.service.AdminService;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/admin")
	public class AdminController {
		
		@Autowired
		AdminService as;
		@Autowired
		ShopService ss;
		
		@RequestMapping(value="/adminMain.do")
		public String adminMain(Model model){
		
			int memberNum = as.totalMemberNum();
			model.addAttribute("memberNum",memberNum);
			
			int goodsNum = as.totalGoodsNum();
			model.addAttribute("goodsNum",goodsNum);
			
			int refundNum = as.totalRefund();
			model.addAttribute("refundNum",refundNum);

			return "admin/adminMain";
		}
		
		@RequestMapping(value="/adminMember.do")
		public String adminMember(Model model) {
			
			ArrayList<MemberVo> mvList = as.memberList();
			model.addAttribute("mvList",mvList);
			
			return "admin/adminMember";
		}
		
		@RequestMapping(value="/adminGoods.do")
		public String adminGoods(Model model) {
			
			ArrayList<AdminGoodsDto> gvList = as.goodsList();
			model.addAttribute("gvList",gvList);
			
			return "admin/adminGoods";
		}
		@RequestMapping(value="adminSizeList.do")
		public String adminSizeList(
				Model model,
				@RequestParam("goodsNo") int goodsNo) {
			
			GoodsVo gv = ss.goodsSelectOne(goodsNo);
			model.addAttribute("gv",gv);
			
			ArrayList<AdminSizeDto> asList = as.sizeList(goodsNo);
			model.addAttribute("asList",asList);
			
			return "admin/adminPopup";
		}
		
		
		@RequestMapping(value="/adminOrder.do")
		public String adminOrder(Model model) {
			
			ArrayList<OrderDto> odList = as.orderList();
			model.addAttribute("odList",odList);
			
			return "admin/adminOrder";
		}

		
		@RequestMapping(value="/adminRefund.do")
		public String adminRefund(Model model) {
			
			ArrayList<OrderDto> rfList = as.refundList();
			model.addAttribute("rfList",rfList);
			
			return "admin/adminRefund";
		}
	}
