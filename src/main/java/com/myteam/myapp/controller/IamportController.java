package com.myteam.myapp.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.OrderService;
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
	ShopService ss;
	@Autowired
	OrderService os;
	@Autowired
	MemberService ms;
	@Autowired
	PointService ps;
	
	private IamportClient api;

    public IamportController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("2780751757484782","oQH1UyykG80Iw7yAgy8W5zwsim6KvZbIX3moFFYPITFcrwh4TK9OyPoO25UvFS0V8Qv45gSWkGa8W5A9");
    }
    
    @ResponseBody
    @RequestMapping(value="/verifyIamport.do")
    public IamportResponse<Payment> paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session,
            @RequestParam("imp_uid") String imp_uid,
            @RequestParam("amount") String amount) throws IamportResponseException, Exception{
    	
    	IamportResponse<Payment> irsp = api.paymentByImpUid(imp_uid); 
    	
        return api.paymentByImpUid(imp_uid);
    }
}
