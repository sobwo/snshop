package com.myteam.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myteam.myapp.service.MemberService;
import com.myteam.myapp.service.RegisterMail;


@RestController
@RequestMapping(value = "/email")
public class MailController {

	@Autowired
	MemberService ms;
	
    @Autowired
    RegisterMail registerMail;

    @PostMapping(value = "/registerEmailAction.do")
    public String mailConfirm(
    		@RequestParam("index") String index,
    		@RequestParam(value="memberName",required=false) String memberName,
    		@RequestParam("email") String email) throws Exception{
    	
    	String code = null;
    	
    	if(index.equals("join")) {
    		code = registerMail.sendSimpleMessage(email);
    	}

    	else if(index.equals("searchId") || index.equals("searchPw")) {
        	String searchEmail = ms.searchEmailCheck(memberName);
        	
        	System.out.println("searchEmail"+searchEmail);
        	
        	if(email.equals(searchEmail))
        		code = registerMail.sendSimpleMessage(email);
        	else
        		code = "no";
        }
        
        return code;
    }    
}