package com.myteam.myapp.controller;

import java.util.ArrayList;
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
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	
	@Autowired
	ShopService ss;
	
	@RequestMapping(value = "/shopMain.do")
	public String shopMain(Model model) {

		ArrayList<GoodsVo> goodsList = ss.goodsSelectAll();
		
		model.addAttribute("goodsList", goodsList);
		
		return "shop/shopMain";
	}
	
	@RequestMapping(value = "/shopContents.do")
	public String shopcontents(
			@RequestParam("goodsNo") int goodsNo,
			Model model) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		ArrayList<ProductImgVo> pivList = ss.imgSelectOne(goodsNo);
		
		model.addAttribute("gv", gv);
		model.addAttribute("pivList", pivList);

		return "shop/shopContents";
	}
	
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
}
