package com.myteam.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.SendSMS;

@Controller
@RequestMapping(value="/message")
public class MessageController {

	@Autowired
	MemberService ms;
	
	@Autowired
	SendSMS sendSMS;
	
	
	@RequestMapping("/sendSMS.do") //jsp 페이지 넘긴 mapping 값
	@ResponseBody    
    public String sendSMS(
    		@RequestParam("memberName") String memberName,
    		@RequestParam("phone") String phone) {
		
		String value = null;
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		
    	String memberPhone = ms.searchPhoneCheck(memberName);
    	
    	System.out.println("randomNumber"+randomNumber);
    	
    	if(phone.equals(memberPhone)) {
    		value = Integer.toString(randomNumber);
//    		sendSMS.certify_phone(phone,randomNumber);
    	}
    	else
    		value = "no";
		
		return value;
	}

}
