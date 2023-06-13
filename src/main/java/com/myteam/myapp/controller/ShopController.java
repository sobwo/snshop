package com.myteam.myapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeDto;
import com.myteam.myapp.service.ShopService;
import com.myteam.myapp.util.UploadFileUtiles;

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
	

	@RequestMapping(value = "/shop_upload.do")
	public String shop_upload(
			@RequestParam("goodsName") String goodsName,
			@RequestParam("goodsEng") String goodsEng,
			@RequestParam("modelNum") String modelNum,
			@RequestParam("category") String category,
			@RequestParam("categoryName") String[] categoryName,
			@RequestParam("goodsGender") String goodsGender,
			@RequestParam("price") String price,
			@RequestParam("size") String size,
			@RequestParam("quantity") int quantity,
			@RequestParam("contentsImg") MultipartFile[] contentsImg,
			HttpSession session,
			Model model,
			GoodsVo gv,
			RedirectAttributes rttr) throws Exception {
		
		System.out.println("contentsImg"+contentsImg);
		
		int memberNo = 0;
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		String categoryName2 = "";
		
		for(int i=0;i<categoryName.length;i++) {
			System.out.println("하위 카테고리"+categoryName[i]);
			if(!categoryName[i].equals("none"))
				categoryName2 = categoryName[i];
		}
		
		
		
		String uploadPath = "\\\\DESKTOP-IQUHLB7\\productImg";
		List<String> uploadedFileNames = new ArrayList<>();
		for (MultipartFile file : contentsImg) {
			if (!file.getOriginalFilename().equals("")) {
				String uploadedFileName = UploadFileUtiles.uploadFile(
						uploadPath, 
						file.getOriginalFilename(),
						file.getBytes());
				uploadedFileNames.add(uploadedFileName);
			}
		}
		
		gv.setProductImg(String.join(",", uploadedFileNames));
		gv.setGoodsName(goodsName);
		gv.setGoodsEng(goodsEng);
		gv.setModelNum(modelNum);
		gv.setCategory(category);
		gv.setCategoryName(categoryName2);
		gv.setGoodsGender(goodsGender);
		gv.setMemberNo(memberNo);
		
		int value = ss.goodsInsert(gv,size,quantity);
		
		if(value == 1)
			return "redirect:/shop/shopMain.do";
		else {
			rttr.addFlashAttribute("msg", "상품 등록이 실패하였습니다. 다시 시도해주세요.");
			return "redirect:/shop/salePage.do";
		}
		
	}
	
	@RequestMapping(value = "/salePage.do")
	public String salePage() {
		
		return "shop/salePage";
	}
	
	
//좌측 필터버튼  ajax	
	@RequestMapping(value="/categoryFilter.do")
	public String categoryFilter(
			@RequestParam(value="filter[]", required=false) List<String> filter,
			@RequestParam(value="value") int value,
			@RequestParam(value="page") int page,
			@RequestParam(value="price") int price,
			Model model
			) {

		ArrayList<ProductDto> filterList = ss.filterList(filter,value,page,price);
		model.addAttribute("goodsList", filterList);
		
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
	
	@RequestMapping(value="/shopSell.do")
	public String shopSell(
		@RequestParam("goodsNo") int goodsNo,
		@RequestParam("category") String category,
		Model model
		){
	
		int value;
		
		switch(category) {
			case "신발" : value = 0;
				break; 
			case "아우터": case "상의": case "하의": value = 1;
				break;
			default : value =2;								
		};
		
		ProductDto pd = ss.sellSelect(goodsNo);
		
		model.addAttribute("pd", pd);
		model.addAttribute("value", value);
		
	return "shop/shopSell";
	}
	@RequestMapping(value="/shopReview.do")
	public String shopReview(
			@RequestParam("goodsNo")int goodsNo,
			Model model) {
		
		ProductDto pd = ss.sellSelect(goodsNo);
		ArrayList<LikesDto> ReviewList = ss.shopReviewList(goodsNo);
		
		model.addAttribute("llist", ReviewList);
		model.addAttribute("pd", pd);
		
		return "shop/shopReview";
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
	
	@RequestMapping(value = "/interestShow.do")
	public String interestShow(
			@RequestParam("goodsNo") int goodsNo,
			Model model,
			HttpSession session) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);

		ArrayList<SizeDto>sizeList = ss.sizeListAll(goodsNo);
		
		model.addAttribute("sizeList",sizeList);
		model.addAttribute("gv", gv);	
		
		return "shop/favorite_ajax";
		
	}
	
}
