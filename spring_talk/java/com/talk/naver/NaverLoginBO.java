package com.talk.naver;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;


public class NaverLoginBO {
	
	private final static String CLIENT_ID = "iiUTE6FImKTXzKim2xN2";
	
	private final static String CLIENT_SECRET = "MtO6h7CviS";
	
	private final static String REDIRECT_URI = "http://localhost:8181/naver/login";
	
	private final static String SESSION_STATE = "oauth_state";
	
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	public String getAuthorizationUrl(HttpSession session) {
		
		String state = generateRandomString();
		
		setSession(session, state);
		
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
											.callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();			
	}	
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		String sessionState = getSession(session);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = (new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
												.callback(REDIRECT_URI)).state(state).build(NaverLoginApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
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
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
		System.out.println("getUserProfile 0 : "+ oauthToken);
		Response response = null;
		try {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.build(NaverLoginApi.instance());
			
			
			OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
			oauthService.signRequest(oauthToken, request);	
			response = request.send();
			
			
		}catch(com.github.scribejava.core.exceptions.OAuthConnectionException e){

			e.printStackTrace();
			System.out.println("getUserProfile OAuthConnectionException : "+ e);
		}
		
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("getUserProfile error : "+ e);
		}
		return response.getBody();
	}
	
}

















