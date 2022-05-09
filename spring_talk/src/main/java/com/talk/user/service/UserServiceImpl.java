package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.UserVO;
import com.talk.user.mapper.UserMapper;

@Service
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
	public UserVO selectById(String uid) {
		return UserMapper.getUserById(uid);
	}
	
	public UserVO loginCheck(String uid, String upw) {
		return UserMapper.loginCheck(uid, upw);
	}

	@Override
	public void insert(UserVO vo) {
		UserMapper.insert(vo);
	}

	@Override
	public void delete(long uno) {
		UserMapper.delete(uno);
	}

	@Override
	public void update(UserVO vo) {
		UserMapper.update(vo);
	}

	@Override
	public long getLastNum() {
		long result = UserMapper.lastUserNum();

		return result;
	}
	
}