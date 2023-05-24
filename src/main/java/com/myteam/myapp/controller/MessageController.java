package com.myteam.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myteam.myapp.service.SendSMS;

@Controller(value="/message")
public class MessageController {
	
	@Autowired
	SendSMS sendSMS;
	
	
	@RequestMapping("/sendSMS.do") //jsp 페이지 넘긴 mapping 값
	@ResponseBody    
    public String sendSMS(
    		@RequestParam("phone") String phone) {
 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		
		sendSMS.certify_phone(phone,randomNumber);
		
		return Integer.toString(randomNumber);
	}

}
