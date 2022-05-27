package com.talk.user.service;

import java.util.List;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.UserVO;

public interface AuthService {
	
	public List<AuthVO>  userAuthList(String user_id);

	public List<UserVO> readAllAuthList();

	public void insert(String user_id,String authName);

	public void deleteAll(String user_id);
	
	public void delete(UserVO vo);

	public void update(UserVO vo);
}
