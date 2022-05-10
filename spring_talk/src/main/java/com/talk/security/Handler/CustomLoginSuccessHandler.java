package com.talk.security.Handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;


@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> authList = new ArrayList<String>();
		
		for(GrantedAuthority ga : authentication.getAuthorities()) {
			authList.add(ga.getAuthority());
			System.out.println("CustomLoginSuccessHandler" + ga.getAuthority());
		}
		
		if(authList.contains("ROLE_ADMIN")) {
			response.sendRedirect("secu/admin");
			return;
		}
		
		if(authList.contains("ROLE_MEMBER")) {
			response.sendRedirect("secu/member");
			return;
		}
	}


}
