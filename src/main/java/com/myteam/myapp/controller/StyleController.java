package com.myteam.myapp.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.service.BoardService;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.ShopService;
import com.myteam.myapp.service.StyleService;

@Controller
@RequestMapping(value = "/style")
public class StyleController {

	@Autowired
	ShopService ss;
	@Autowired
	MemberService ms;
	@Autowired
	StyleService ss1;
/*
	@RequestMapping(value = "/style_following.do")
	public String styleFollowing(Model model) {


		 * ArrayList<BoardVo> blist= ss1.boardSelectAll();
		 * 
		 * 
		 * int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		 * 
		 * model.addAttribute("blist", blist);
		 * 
		 * return "style/style_following";
		
	}
*/
	@RequestMapping(value = "/style_discover.do")
	public String styleMain() {

		return "style/style_discover";
	}

	@RequestMapping(value = "/style_discover_newest.do")
	public String styleDiscoverNewest() {

		return "style/style_discover_newest";
	}

	@RequestMapping(value = "/style_favorite.do")
	public String styleFavorite(@RequestParam("boardNo") int boardNo, Model model) {

		/* BoardVo bv = ss1.boardSelectAll(boardNo); */

		/*
		 * @RequestParam("boardNo") String boardNo,
		 * 
		 * @RequestParam("contents")String contents,
		 * 
		 * @RequestParam("contentsImg")String contentsImg,
		 * 
		 * @RequestParam("delyn") String delyn,
		 * 
		 * @RequestParam("likeCnt")String likeCnt,
		 * 
		 * @RequestParam("viewCnt")String viewCnt,
		 * 
		 * @RequestParam("memberNo")int memberNo, HttpSession session, Model model){
		 * 
		 * int member = Integer.parseInt(session.getAttribute("memberNo").toString());
		 * 
		 * ss1.boardSelectAll()
		 */

		return "style/style_favorite";
	}

}
