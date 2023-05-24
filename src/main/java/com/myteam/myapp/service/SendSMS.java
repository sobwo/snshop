package com.myteam.myapp.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SendSMS{
	
	public void certify_phone(String memberPhone, int randomNum) {
	    String api_key = "NCSGLKSLCIPYGHXU";
	    String api_secret = "MNOXOMFZEJAPT7MNT2TW8Z3PNFXDZ57T";
	    Message coolsms = new Message(api_key, api_secret);
	  
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", memberPhone);    
	    params.put("from", "01093427446");   
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 ["+randomNum+"]입니다 ");
	    params.put("app_version", "test app 1.2"); // application name and version
	
	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	    }
	}
}
