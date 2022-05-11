package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.BanVO;
import com.talk.user.domain.UserAuthVO;
import com.talk.user.mapper.AuthMapper;

public class AuthServiceImpl implements AuthService{
	
	@Autowired
	AuthMapper mapper;

	@Override
	public List<AuthVO> userAuthList(String user_id) {
		// TODO Auto-generated method stub
		return mapper.getUserAuth(user_id).getAvos();
	}

	@Override
	public List<UserAuthVO> readAllAuthList() {
		// TODO Auto-generated method stub
		return mapper.getAllUserAuth();
	}

	@Override
	public void insert(UserAuthVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(UserAuthVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(UserAuthVO vo) {
		// TODO Auto-generated method stub
		
	}

}
