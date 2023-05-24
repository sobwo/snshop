package com.myteam.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/style")
public class StyleController {
	
	@Autowired
	ShopService ss;
	
	
	
	@RequestMapping(value = "/style_following.do")
	public String styleFollowing(	HttpSession session) {
		
//		ArrayList<BoardVo> blist = select �Լ�
		/*
		 * int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		 */
		return "style/style_following";
	}
	
	@RequestMapping(value = "/style_discover.do")
	public String styleMain() {
		
		return "style/style_discover";
	}
	
	@RequestMapping(value = "/style_discover_newest.do")
	public String styleDiscoverNewest() {
		
		return "style/style_discover_newest";
	}
	

	
	@RequestMapping(value = "/style_favorite.do")
	public String styleFavorite()  {
		
	
		
		return "style/style_favorite";
	}

}
