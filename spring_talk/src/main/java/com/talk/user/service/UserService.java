package com.talk.user.service;

import java.util.List;

import com.talk.user.domain.UserVO;

// 구현 클래스 UserServiceImpl의 뼈대가 됩니다.
public interface UserService {
	
	public UserVO select(long user_num);
	
	public void insert(UserVO vo);

	public void delete(long user_num);
	
	public void update(UserVO vo);	
	
}




