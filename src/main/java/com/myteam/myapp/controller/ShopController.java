package com.myteam.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeVo;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	
	@Autowired
	ShopService ss;
	
//硫붿씤 珥덇린 �긽�뭹 由ъ뒪�듃
	@RequestMapping(value = "/shopMain.do")
	public String shopMain(Model model) {
		
		ArrayList<GoodsVo> goodsList = ss.goodsSelectAll();
		
		model.addAttribute("goodsList", goodsList);

		return "shop/shopMain";
	}

	@RequestMapping(value = "/shopContents.do")
	public String shopContents(
			@RequestParam("goodsNo") int goodsNo,
			/* @RequestParam("sizeNo")int sizeNo, */
			Model model) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		ArrayList<ProductImgVo> pivList = ss.imgSelectOne(goodsNo);

		ArrayList<GoodsVo> recommentList = ss.recommentList(gv);
		ArrayList<SizeVo>sizeList = ss.sizeList(goodsNo);
		
		model.addAttribute("sizeList",sizeList);
		
		model.addAttribute("recommentList", recommentList);
		model.addAttribute("gv", gv);
		model.addAttribute("pivList", pivList);

		return "shop/shopContents";
	}
	
//醫뚯륫 移댄뀒怨좊━ �븘�꽣 ajax	
	@RequestMapping(value="/categoryFilter.do")
	public String categoryFilter(
			@RequestParam(value="filter[]") List<String> filter,
			@RequestParam(value="value") int value,
			Model model
			) {
		
		ArrayList<GoodsVo> filterList = ss.filterList(filter,value);

		model.addAttribute("goodsList", filterList);
		
		return "shop/shopMain_item";
	}
	
//�긽�뭹 由ъ뒪�듃 �젙�젹 ajax	
	@RequestMapping(value="/itemAlign.do")
	public String itemAlign(
			@RequestParam(value="filter[]") List<String> filter,
			@RequestParam(value="value") int value,
			@RequestParam(value="index") int index,
			Model model
			) {
		
		ArrayList<GoodsVo> alignList = ss.alignList(filter, value, index);
		model.addAttribute("goodsList", alignList);
		
		return "shop/shopMain_item";
	}
}
