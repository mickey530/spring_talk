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
		
		
		 HttpSession session = request.getSession();
		 
		 if(session != null) {
	         String redirectUrl = (String) session.getAttribute("prevPage");
	
			 String a = (String)(session.getAttribute("username"));
			 String b = (String)(session.getAttribute("userid"));
			 String c = (String)(session.getAttribute("uid"));
			 String d = (String)(session.getAttribute("user_id"));
			 String e = (String)(session.getAttribute("user_name"));
	
			 System.out.println("username : " + a );
			 System.out.println("userid : " + b );
			 System.out.println("uid : " + c );
			 System.out.println("user_id : " + d );
			 System.out.println("user_name : " + e );
			 System.out.println("redirectUrl : " + redirectUrl );

			 if (redirectUrl != null) {
	             session.removeAttribute("prevPage");
	         } 
		 }

//			session.setAttribute("user_id", vo.getUser_id());
//			session.setAttribute("user_name", vo.getUser_name()); 
//		 session.setAttribute(null, session);
		 
		for(GrantedAuthority ga : authentication.getAuthorities()) {
			authList.add(ga.getAuthority());
			System.out.println("CustomLoginSuccessHandler : " + ga.getAuthority());
		}

        response.sendRedirect("user/getAllUsers");
		if(authList.contains("ROLE_ADMIN")) {
			return;
		}
		
		if(authList.contains("ROLE_MEMBER")) {
			return;
		}
		
		if(authList.contains("ROLE_ALL")) {
			return;
		}
	}


}
