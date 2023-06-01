package com.myteam.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myteam.myapp.domain.OrderDto;
import com.myteam.myapp.service.OrderService;
import com.myteam.myapp.service.PaymentService;
import com.myteam.myapp.service.PointService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@RestController
@RequestMapping(value = "/Iamport")
public class IamportController {
	@Autowired
	PaymentService ps;
	
	private IamportClient api;

    public IamportController() {
        this.api = new IamportClient("2780751757484782","oQH1UyykG80Iw7yAgy8W5zwsim6KvZbIX3moFFYPITFcrwh4TK9OyPoO25UvFS0V8Qv45gSWkGa8W5A9");
    }
    
    public IamportResponse<Payment> paymentLookup(String impUid) throws IamportResponseException, Exception{
		return api.paymentByImpUid(impUid);
	}
    
    @RequestMapping(value="/verifyIamport.do")
    public JSONObject paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session,
            @RequestBody Map<String,String> map) throws IamportResponseException, Exception{
    	
    	IamportResponse<Payment> irsp = paymentLookup(map.get("imp_uid")); 
    	
    	
    	int memberNo= Integer.parseInt(session.getAttribute("memberNo").toString());
    	
    	HashMap<String, Object> hm = ps.verifyPayment(irsp,map,memberNo);
    	
    	JSONObject json = new JSONObject(hm);

        return json;
    }
    
    @RequestMapping(value="/cancelIamport.do")
    public JSONObject cancelIamport(
    		@RequestBody Map<String,String> map) throws IamportResponseException, Exception {

		IamportResponse<Payment> irsp = paymentLookup(map.get("impUid"));
		
		HashMap<String, Object> hm = ps.cancelPayment(irsp,map);
		
		JSONObject json = new JSONObject(hm);
		
		return json;
    	
    }
    
    	
    
}
