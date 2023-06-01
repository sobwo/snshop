package com.myteam.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.OrderService;
import com.myteam.myapp.service.PaymentService;
import com.myteam.myapp.service.PointService;
import com.myteam.myapp.service.ShopService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
@RequestMapping(value = "/Iamport")
public class IamportController {
	@Autowired
	OrderService os;
	@Autowired
	PointService ps;
	@Autowired
	PaymentService pms;
	
	private IamportClient api;

    public IamportController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("2780751757484782","oQH1UyykG80Iw7yAgy8W5zwsim6KvZbIX3moFFYPITFcrwh4TK9OyPoO25UvFS0V8Qv45gSWkGa8W5A9");
    }
    
	@ResponseBody
    @RequestMapping(value="/verifyIamport.do")
    public JSONObject paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session,
            @RequestParam("imp_uid") String imp_uid,
            @RequestParam("price") String price,
            @RequestParam("goodsNo") int goodsNo,
            @RequestParam("addressNo") int addressNo,
            @RequestParam("pay_info") String payInfo,
            @RequestParam("size") String size,
            @RequestParam("point") int point) throws IamportResponseException, Exception{
    	
    	IamportResponse<Payment> irsp = api.paymentByImpUid(imp_uid); 
    	
    	int value = 0;
    	int value2 = 0;
    	int value3 = 0;
    	
    	int memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
    	String orderNum = irsp.getResponse().getMerchantUid();
    	int totalPrice = Integer.parseInt(irsp.getResponse().getAmount().toString());
    	String status = irsp.getResponse().getStatus().toString();
    	String memberPhone = irsp.getResponse().getBuyerTel();
    	
    	String payMethod = irsp.getResponse().getPayMethod().toString();
    	String bankName = null;
    	String bankNum = null;
    	Date date_init = null;
    	
    	
    	
    	String holder = null;
    	if(payMethod.equals("vbank")) {
    		bankName = irsp.getResponse().getVbankName();
	    	bankNum = irsp.getResponse().getVbankNum();
	    	date_init = irsp.getResponse().getVbankDate();
	    	holder = irsp.getResponse().getVbankHolder();
    	}
    	else {
    		bankName = irsp.getResponse().getBankName();
    		bankNum = irsp.getResponse().getCardNumber(); 
    	}
    	
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String date = format.format(date_init);

    	String statusDetail = null;
    	if(status.equals("ready")) statusDetail = "입금대기";
    	else statusDetail = "입금완료";
    	
    	int result = 0;
    	
    	if(irsp.getResponse().getAmount().toString().equals(price)) {
    		value = os.orderInsert(goodsNo, memberNo, orderNum, addressNo, totalPrice, payInfo, size, statusDetail, memberPhone);
    		value2 = ps.usePoint(memberNo, point, orderNum);
    		
    		if(value == 1) {
    			OrderDto od = os.orderSelectNew(orderNum);
    			value3 = pms.payInsert(bankName, bankNum, totalPrice, date, holder, od.getOrderNo(), payMethod);
    		}
    	}
    	
    	result = value2 + value3;
    	
    	HashMap<String,Object> hm = new HashMap<>();
    	hm.put("result", result);
    	hm.put("orderNum", orderNum);
    	
    	JSONObject json = new JSONObject(hm);

        return json;
    }
}
