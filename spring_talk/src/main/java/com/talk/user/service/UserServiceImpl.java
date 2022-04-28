package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.UserVO;
import com.talk.user.mapper.UserMapper;

public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper UserMapper;

	@Override
	public List<UserVO> selectAll() {
		return UserMapper.getAllUsers();
	}

	
	@Override
	public UserVO select(long uno) {
		return UserMapper.getUser(uno);
	}

	@Override
	public void insert(UserVO vo) {
		UserMapper.insert(vo);
	}

	@Override
	public void delete(long bno) {
		// mapper를 이용해 구현
		UserMapper.delete(bno);
	}

	@Override
	public void update(UserVO vo) {
		UserMapper.update(vo);
	}


	
	
	
	
	
	
	
}
