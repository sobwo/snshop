package com.myteam.myapp.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.domain.AddressVo;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.MemberPointVo;
import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.domain.OrderVo;
import com.myteam.myapp.domain.PayVo;
import com.myteam.myapp.domain.PointVo;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.OrderService;
import com.myteam.myapp.service.PaymentService;
import com.myteam.myapp.service.PointService;
import com.myteam.myapp.service.ShopService;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@Autowired
	ShopService ss;
	@Autowired
	OrderService os;
	@Autowired
	MemberService ms;
	@Autowired
	PointService ps;
	@Autowired
	PaymentService pms;

	@RequestMapping(value = "/orderAgree.do")
	public String orderAgree(
			@RequestParam("goodsNo") int goodsNo,
			@RequestParam("sizeName") String sizeName,
			Model model
			) {
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		
		model.addAttribute("sizeName", sizeName);
		model.addAttribute("gv", gv);
		
		return "order/orderAgree";
	}
	
	@RequestMapping(value = "/orderPage.do")
	public String orderPage(
			@RequestParam("goodsNo") int goodsNo,
			@RequestParam("sizeName") String sizeName,
			@RequestParam(value="point", defaultValue="0") int point,
			HttpSession session,
			Model model) {
		
		System.out.println("접속");
		System.out.println("goodsNo"+goodsNo);
		System.out.println("sizeName"+sizeName);
		System.out.println("point"+point);
		
		int memberNo = 0;
	
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		AddressVo av = os.addressOrderPage(memberNo);
		MemberVo mv = ms.memberInfo(memberNo);
		MemberPointVo mpv = ps.selectMemberPointAll(memberNo);
		
		int totalPoint = 0;
		int Avapoint = totalPoint;
		
		if(mpv != null) {
			totalPoint = mpv.getAvaPoint();
			Avapoint = totalPoint;
		}
		
		Avapoint -= point;
		
		int total=gv.getPrice()-point;
		
		model.addAttribute("mv", mv);
		model.addAttribute("gv", gv);
		model.addAttribute("av", av);
		model.addAttribute("total",total);
		model.addAttribute("point",point);
		model.addAttribute("Avapoint",Avapoint);
		model.addAttribute("totalPoint", totalPoint);
		model.addAttribute("sizeName", sizeName);
		
		
		return "order/orderPage"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "/orderInsert.do")
	public String orderInsert(
		@RequestParam("orderNum") String orderNum,
		@RequestParam("totalPrice") int totalPrice, 
		@RequestParam("payInfo") String payInfo,
		@RequestParam("addressNo") int addressNo,
		@RequestParam("goodsNo") int goodsNo, 
		@RequestParam("sizeName") String sizeName,
		@RequestParam("memberPhone") String memberPhone,
		@RequestParam("point") int point,
		@RequestParam(value = "pay_method", required=false) String pay_method,
		@RequestParam(value = "status", required=false) String status,
		@RequestParam(value = "vBankName", required=false) String vBankName,
		@RequestParam(value = "vBankNum", required=false) String vBankNum,
		@RequestParam(value = "vHolder", required=false) String vHolder,
		@RequestParam(value = "vdate", required=false) String vdate,
		HttpSession session,
		Model model) throws Exception {

		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		
		String statusDetail = null;
		if(status.equals("ready")) statusDetail = "입금대기";
		else statusDetail = "입금완료";
		
		int value = os.orderInsert(goodsNo, memberNo,orderNum, addressNo, totalPrice, payInfo, sizeName,statusDetail,memberPhone);
		
		int value2 = 0;
		if(point != 0)
			 value2 = ps.usePoint(memberNo ,point, orderNum);
		
		int result = value+value2;
		
		String str = "{\"value\":\""+result+"\"}";
		
		return str;
	}
	
	
	
	
	
	
	

	/* 수정중 */
	/* @ResponseBody */
	@RequestMapping(value = "/orderFinish.do")
	public String orderFinish( HttpSession session,
			String vIndex,
			Model model,
			@RequestParam(value = "payMethod", defaultValue="card") String payMethod,
			@RequestParam(value = "orderNum") String orderNum ,
			@RequestParam("finishPoint") int finishPoint){
		
		
		 int memberNo = Integer.parseInt(session.getAttribute("memberNo").toString());
		 
		
		OrderDto od = os.orderSelectNew(orderNum);
		PayVo pmv = pms.paySelectNew(od.getOrderNo());
		
	
		int value = os.accumulatefinishPoint(finishPoint, memberNo); 
	
		model.addAttribute("od", od);
		model.addAttribute("pmv", pmv);
	
		return "order/orderFinish";
	}	/* 수정중 */

	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/order_addressAction.do")
	public String order_addressAction(HttpSession session,
			@RequestParam("basicName") String basicName,
			@RequestParam("basicPhone") String basicPhone,
			@RequestParam("basicAddrNum") String basicAddrNum,
			@RequestParam("basicAddr") String basicAddr,
			@RequestParam("basicAddrDetail") String basicAddrDetail,
			@RequestParam(value = "basic_check", defaultValue = "N") String basic_check,
			@RequestParam("goodsNo") int goodsNo, 
			@RequestParam("sizeName") String sizeName,
			Model model) {
	
		int memberNo = 0;
		
		if(session.getAttribute("memberNo") != null) {
			memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
		}
		
		os.addressInsert(basicName, basicPhone, basicAddrNum, basicAddr, basicAddrDetail, basic_check, memberNo);
		
		GoodsVo gv = ss.goodsSelectOne(goodsNo);
		model.addAttribute("gv", gv);
		model.addAttribute("goodsNo", goodsNo);
		model.addAttribute("sizeName", sizeName);
	
		return "redirect:/order/orderPage.do";
	
	}
	@ResponseBody
	@RequestMapping(value = "/order_showAddress.do")
	public JSONObject showAddress(@RequestParam("index") int index) {
		HashMap<String, Object> map = new HashMap<>();
		AddressVo av = os.addressSelectOne(index);

		map.put("av", av);

		JSONObject js = new JSONObject(map);

		return js;
	}
	
	@ResponseBody
	@RequestMapping(value = "/orderCancel.do")
	public JSONObject orderCancel(
			@RequestParam("orderNum") String orderNum,
			@RequestParam("reason") String reason,
			@RequestParam("checksum") int checksum,
			OrderVo ov) {
		
		HashMap<String, Object> map = new HashMap<>();

		ov.setOrderNum(orderNum);
		ov.setReason(reason);
		ov.setChecksum(checksum);
		
		int value = os.orderCancel(ov);
		
		map.put("value",value);
		
		JSONObject js = new JSONObject(map);

		return js;
		
	}
	
}
