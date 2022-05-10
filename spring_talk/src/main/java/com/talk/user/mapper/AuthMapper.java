package com.talk.user.mapper;

import java.util.List;

import com.talk.user.domain.MemberVO;
import com.talk.user.domain.UserAuthVO;

public interface AuthMapper {

	public UserAuthVO getUserAuth(String userId);

	public void insert(String user_id,String user_auth);
	
	public void delete(String user_id,String user_auth);

}
