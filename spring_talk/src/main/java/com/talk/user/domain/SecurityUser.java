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
	
	private UserAuthVO member;
	
	public SecurityUser(String username, String password, Collection<? extends GrantedAuthority> auth) {
		super(username, password, auth);
	}

	public SecurityUser(UserAuthVO vo) {
		super(vo.getUvo().getUser_id(), vo.getUvo().getUser_pw(), vo.getAvos().stream().map(author ->
						new SimpleGrantedAuthority(author.getAuthority()))
						.collect(Collectors.toList()));
		this.member = vo;
	}
}
