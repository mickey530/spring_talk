package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.talk.user.domain.UserVO;
import com.talk.user.mapper.AuthMapper;
import com.talk.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private AuthMapper authMapper;
	
	@Autowired
	private UserMapper UserMapper;
	
	@Autowired
	private PasswordEncoder pwEncode;

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
		System.out.println("loginCheck uid : " + uid);
		System.out.println("loginCheck upw : " + upw);
		
		UserVO user = UserMapper.getUserById(uid);
		
		if(user == null) {
			return null;
		}
		
		String encodedPW = user.getUser_pw();

		System.out.println("loginCheck upw : " + upw);
		
		if(pwEncode.matches(upw, encodedPW)) {
			return UserMapper.getUserById(uid);
		}
		else {
			return null;
		}
	}


// 권한이 따로 주어지 않았을 때
	@Override 
	public void insert(UserVO vo) {
		String [] default_auth = {"ROLE_ALL"};
		insert(vo,default_auth);
	}
	
// 권한이 따로 주어질 때
	@Override
	public void insert(UserVO vo, String[] auths) {
		String originPW = vo.getUser_pw();
		String encodedPW = pwEncode.encode(originPW);
		vo.setUser_pw(encodedPW);
		System.out.println("VO insert");
		System.out.println(vo.toString());
		UserMapper.insert(vo);
		for(String auth : auths) {
			String user_id = vo.getUser_id();

			System.out.println("auth : " + auth);
			authMapper.insert(user_id, auth);
		}
	}

	@Override
	public void delete(String user_id) {

		authMapper.deleteAll(user_id);
		UserMapper.delete(user_id);
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