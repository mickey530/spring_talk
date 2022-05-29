package com.talk.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.talk.user.domain.SecurityUser;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.AuthMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
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
