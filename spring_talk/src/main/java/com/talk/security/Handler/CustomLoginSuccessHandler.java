package com.talk.security.Handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;


@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("onAuthenticationSuccess");
		List<String> authList = new ArrayList<String>();

//			session.setAttribute("user_id", vo.getUser_id());
//			session.setAttribute("user_name", vo.getUser_name()); 
//		 session.setAttribute(null, session);
		 
		for(GrantedAuthority ga : authentication.getAuthorities()) {
			authList.add(ga.getAuthority());
			System.out.println("CustomLoginSuccessHandler : " + ga.getAuthority());
		}

		if(authList.contains("ROLE_ADMIN")) {

	        response.sendRedirect("post/newsfeed");
			return;
		}
		
		if(authList.contains("ROLE_MEMBER")) {
	        response.sendRedirect("post/newsfeed");
	        return;
		}
		
		if(authList.contains("ROLE_ALL")) {
	        response.sendRedirect("post/newsfeed");
			return;
		}
	}


}
