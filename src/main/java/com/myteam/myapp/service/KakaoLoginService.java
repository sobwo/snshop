package com.myteam.myapp.service;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class KakaoLoginService {
	private final static String KAKAO_CLIENT_ID = "b105a78f2f820c2c7d5481219dbec789";
    private final static String KAKAO_CLIENT_SECRET = "eM4fVQB2IkbsjvW52BG60YXGCyGOLdK3";
    private final static String KAKAO_REDIRECT_URI = "http://localhost:8080/myapp/member/socialLoginAction.do?index=kakao";
    private final static String KAKAO_SESSION_STATE = "kakao_oauth_state";
    private final static String KAKAO_PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
    
    public String getAuthorizationUrl(HttpSession session) {
    	
    	String state = generateRandomString();
    	
    	setSession(session,state);
    	
    	OAuth20Service oauthService = new ServiceBuilder()
    			.apiKey(KAKAO_CLIENT_ID)
    			.apiSecret(KAKAO_CLIENT_SECRET)
    			.callback(KAKAO_REDIRECT_URI)
    			.state(state)
    			.build(KakaoOAuthApi.instance());
    	
    	return oauthService.getAuthorizationUrl();
    	
    }
    
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
    	String sessionState = getSession(session);
    	if(StringUtils.pathEquals(sessionState, state)) {
    		OAuth20Service oauthService = new ServiceBuilder()
    				.apiKey(KAKAO_CLIENT_ID)
    				.apiSecret(KAKAO_CLIENT_SECRET)
    				.callback(KAKAO_REDIRECT_URI)
    				.state(state)
    				.build(KakaoOAuthApi.instance());
    		
    		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
    		
    		return accessToken;
    	}
    	
    	return null;		
    }
	
	public String getuserProfile(OAuth2AccessToken oauthToken) throws Exception{
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(KAKAO_CLIENT_ID)
				.apiSecret(KAKAO_CLIENT_SECRET)
				.callback(KAKAO_REDIRECT_URI)
				.build(KakaoOAuthApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, KAKAO_PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		
		Response response = request.send();
		return response.getBody();
		
	}
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
    private void setSession(HttpSession session, String state) {
		session.setAttribute(KAKAO_SESSION_STATE, state);
	}
    
    private String getSession(HttpSession session) {
		return (String) session.getAttribute(KAKAO_SESSION_STATE);
	}

}
