package com.myteam.myapp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		ArrayList<ProductImgVo> imgList = ss.imgSelectAll();
		
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("imgList", imgList);
		
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
}
