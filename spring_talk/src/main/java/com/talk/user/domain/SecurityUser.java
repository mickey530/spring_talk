package com.talk.user.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class SecurityUser extends User {

	private static final long serialVersionUID = 1L;
	
	private UserVO user;
	
	public SecurityUser(String username, String password, 
			Collection<? extends GrantedAuthority> auth) {
		
		super(username, password, auth);
		System.out.println("SecurityUser 1");
	}

	public SecurityUser(UserVO vo) {
		super(vo.getUser_id(), vo.getUser_pw(), 
				vo.getAvos().stream().map(author ->
						new SimpleGrantedAuthority(author.getAuthority()))
						.collect(Collectors.toList()));
		this.user = vo;
		System.out.println("SecurityUser 2");
	}
}
