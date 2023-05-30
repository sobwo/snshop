package com.myteam.myapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeVo;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	
	@Autowired
	ShopService ss;
	

	@RequestMapping(value = "/shopMain.do")
	public String shopMain() {
		
		return "shop/shopMain";
	}

	@RequestMapping(value = "/shopContents.do")
	public String shopContents(
			@RequestParam("goodsNo") int goodsNo,
			/* @RequestParam("sizeNo")int sizeNo, */
			Model model) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		ArrayList<ProductImgVo> pivList = ss.imgSelectOne(goodsNo);

		ArrayList<ProductDto> recommentList = ss.recommentList(gv);
		ArrayList<SizeVo>sizeList = ss.sizeList(goodsNo);
		
		model.addAttribute("sizeList",sizeList);
		
		model.addAttribute("recommentList", recommentList);
		model.addAttribute("gv", gv);
		model.addAttribute("pivList", pivList);

		return "shop/shopContents";
	}
	
//좌측 필터버튼  ajax	
	@RequestMapping(value="/categoryFilter.do")
	public String categoryFilter(
			@RequestParam(value="filter[]", required=false) List<String> filter,
			@RequestParam(value="value") int value,
			Model model
			) {
		
		ArrayList<ProductDto> filterList = ss.filterList(filter,value);

		model.addAttribute("goodsList", filterList);
		
		return "shop/shopMain_item";
	}
	
//상품 정렬  ajax	
	@RequestMapping(value="/itemAlign.do")
	public String itemAlign(
			@RequestParam(value="filter[]") List<String> filter,
			@RequestParam(value="value") int value,
			@RequestParam(value="index") int index,
			Model model
			) {
		
		ArrayList<ProductDto> alignList = ss.alignList(filter, value, index);
		model.addAttribute("goodsList", alignList);
		
		return "shop/shopMain_item";
	}
	
	@ResponseBody
	@RequestMapping(value="/favoriteAction.do")
	public JSONObject favoriteAction(
			@RequestParam("goodsNo") int goodsNo,
			@RequestParam("sizeNo") int sizeNo,
			HttpSession session) {
		
		int memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		
		
		JSONObject obj = new JSONObject();
		
		
		return null;
	}
}
