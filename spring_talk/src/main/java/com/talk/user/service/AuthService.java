package com.talk.user.service;

import java.util.List;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.UserAuthVO;

public interface AuthService {
	
	public List<AuthVO>  userAuthList(String user_id);

	public List<UserAuthVO> readAllAuthList();

	public void insert(UserAuthVO vo);

	public void delete(UserAuthVO vo);

	public void update(UserAuthVO vo);
}
