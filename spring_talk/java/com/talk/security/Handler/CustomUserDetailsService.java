package com.talk.security.Handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.talk.user.domain.SecurityUser;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.AuthMapper;
import com.talk.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;


@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	AuthMapper authmapper;
	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
	
		System.out.println("username : " + user_id);

		UserVO vo = authmapper.getUserAuth(user_id);
		
		
		SecurityUser su;
		if(vo == null) {
			System.out.println("vo == null");
			su= null;
		} else {
			System.out.println("user info : " + vo.toString());
			System.out.println("vo != null");
			su= new SecurityUser(vo);
		}
		
		return su;
	}
	


}
