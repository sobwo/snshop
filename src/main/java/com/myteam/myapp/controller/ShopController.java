package com.myteam.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.LikesVo;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeDto;
import com.myteam.myapp.domain.SizeVo;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	
	@Autowired
	ShopService ss;
	

	@RequestMapping(value = "/shopMain.do")
	public String shopMain(Model model) {
		ArrayList<ProductDto> trandList = ss.trandList();
		model.addAttribute("trandList",trandList);
		
		return "shop/shopMain";
	}

	@RequestMapping(value = "/shopContents.do")
	public String shopContents(
			@RequestParam("goodsNo") int goodsNo,
			/* @RequestParam("sizeNo")int sizeNo, */
			Model model,
			HttpSession session) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		ArrayList<ProductImgVo> pivList = ss.imgSelectOne(goodsNo);

		ArrayList<ProductDto> recommentList = ss.recommentList(gv);
		ArrayList<SizeDto>sizeList = ss.sizeList(goodsNo);
		
		int memberNo = 0;
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		int interestGoodsCheck = ss.interestGoodsCheck(goodsNo, memberNo);
		
		model.addAttribute("interestGoodsCheck", interestGoodsCheck);
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
			@RequestParam(value="page") int page,
//			@RequestParam(value="price",required=false) int price,

			Model model
			) {

		ArrayList<ProductDto> filterList = ss.filterList(filter,value,page);
		model.addAttribute("goodsList", filterList);
		
		int price = 0;
		int total = ss.goodsTotal(filter, value, page, price);
		model.addAttribute("total", total);		
		
		return "shop/shopMain_item";
	}
//가격 검색 ajax
	@RequestMapping(value="/priceFilter.do")
	public String categorySize(
			@RequestParam(value="filter[]", required=false) List<String> filter,
			@RequestParam(value="value") int value,
			@RequestParam(value="page") int page,
			@RequestParam(value="price")int price,
			Model model){
		
		ArrayList<ProductDto> priceAlign = ss.priceAlign(filter, value, page, price);
		model.addAttribute("goodsList",priceAlign);
		
		int total = ss.goodsTotal(filter, value, page, price);
		model.addAttribute("total", total);
		
		return "shop/shopMain_item";
	}
	//상품 정렬  ajax	
		@RequestMapping(value="/itemAlign.do")
		public String itemAlign(
				@RequestParam(value="filter[]") List<String> filter,
				@RequestParam(value="value") int value,
				@RequestParam(value="index") int index,
				@RequestParam(value="page") int page,
				Model model
				) {		
			ArrayList<ProductDto> alignList = ss.alignList(filter, value, index, page);
			model.addAttribute("goodsList", alignList);
			
			int price = 0;
			int total = ss.goodsTotal(filter, value, page, price);
			model.addAttribute("total", total);
			
			return "shop/shopMain_item";
		}
	
	@ResponseBody
	@RequestMapping(value="/interest_check.do" , method=RequestMethod.POST)
	public JSONObject interest_check(
			@RequestParam("goodsNo")int goodsNo,
			@RequestParam("sizeNo") int sizeNo,
			InterestVo iv,
			GoodsVo gv,
			HttpSession session) throws Exception{

		int memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		
		iv.setGoodsNo(goodsNo);
		iv.setSizeNo(sizeNo);
		iv.setMemberNo(memberNo);
	    
	    int value = ss.interestAction(iv);
		
	    int interestCheck = ss.interestCheck(iv);
	    gv = ss.goodsSelectOne(goodsNo);
	    int interestCnt = gv.getInterestNum();
		int interestGoodsCheck = ss.interestGoodsCheck(goodsNo, memberNo);
		
		
	    HashMap<String,Object> hm = new HashMap<>();
	    hm.put("interestGoodsCheck", interestGoodsCheck);
	    hm.put("interestCheck",interestCheck);
	    hm.put("interestCnt",interestCnt);
	    hm.put("value",value);
	    
		JSONObject json = new JSONObject(hm);
	    
	    return json;
	}
}
