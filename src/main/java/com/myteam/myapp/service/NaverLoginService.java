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

public class NaverLoginService {
	private final static String CLIENT_ID = "kRlXBrP34_BO8MxeKTh8";
    private final static String CLIENT_SECRET = "BG1ZySo8Aq";
    private final static String REDIRECT_URI = "http://localhost:8080/myapp/member/socialLoginAction.do?index=naver";
    private final static String SESSION_STATE = "oauth_state";
    /* 프로필 조회 API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* 네이버 아이디로 인증  URL 생성  Method */
    public String getAuthorizationUrl(HttpSession session) {
    	
    	String state = generateRandomString();
    	
    	setSession(session,state);
    	
    	OAuth20Service oauthService = new ServiceBuilder()
    			.apiKey(CLIENT_ID)
    			.apiSecret(CLIENT_SECRET)
    			.callback(REDIRECT_URI)
    			.state(state)
    			.build(NaverOAuthApi.instance());
    	
    	return oauthService.getAuthorizationUrl();
    	
    }
    
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
    	String sessionState = getSession(session);
    	if(StringUtils.pathEquals(sessionState, state)) {
    		OAuth20Service oauthService = new ServiceBuilder()
    				.apiKey(CLIENT_ID)
    				.apiSecret(CLIENT_SECRET)
    				.callback(REDIRECT_URI)
    				.state(state)
    				.build(NaverOAuthApi.instance());
    		
    		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
    		
    		return accessToken;
    	}
    	
    	return null;		
    }
	
	public String getuserProfile(OAuth2AccessToken oauthToken) throws Exception{
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.build(NaverOAuthApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		
		Response response = request.send();
		return response.getBody();
		
	}
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
    private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
    
    private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}


}