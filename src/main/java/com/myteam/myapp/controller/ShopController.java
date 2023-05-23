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
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	
	@Autowired
	ShopService ss;
	
	@RequestMapping(value = "/shopMain.do")
	public String shopMain(Model model) {

		ArrayList<GoodsVo> goodsList  = ss.goodsSelectAll();
		
		int cnt = goodsList.size();
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("goodsList", goodsList);
		
		return "shop/shopMain";
	}
	
	@RequestMapping(value = "/shopContents.do")
	public String shopcontents(
			@RequestParam("goodsNo") int goodsNo,
			Model model) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		ArrayList<ProductImgVo> pivList = ss.imgSelectOne(goodsNo);
		
		
		
		HashMap<Integer, Object> hashMap = new HashMap();
		
		hashMap.put(0,gv.getCategoryName());
		hashMap.put(1, goodsNo);
		
		ArrayList<GoodsVo> recommentList = ss.recommentList(hashMap);
		
		model.addAttribute("recommentList", recommentList);
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
		
		ArrayList<GoodsVo> filterList = new ArrayList<GoodsVo>();
		filterList = ss.filterList(filter,value);

		model.addAttribute("goodsList", filterList);
		
		return "shop/shopMain_item";
	}
	
	@RequestMapping(value="/itemAlign.do")
	public String itemAlign(
			@RequestParam(value="filter[]") List<String> filter,
			@RequestParam(value="value") int value,
			@RequestParam(value="index") int index,
			Model model
			) {
		
		ArrayList<GoodsVo> alignList = new ArrayList<GoodsVo>();
		alignList = ss.alignList(filter, value, index);
		model.addAttribute("goodsList", alignList);
		
		return "shop/shopMain_item";
	}
	
}
