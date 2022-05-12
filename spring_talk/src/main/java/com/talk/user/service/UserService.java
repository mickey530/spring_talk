package com.talk.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.user.domain.UserVO;

public interface UserService {

	public List<UserVO> selectAll();
	
	public UserVO select(long user_num);
	
	public UserVO loginCheck(String uid, String upw);

	public UserVO selectById(String uid);
	
	public void insert(UserVO vo);

	public void delete(String user_id);
	
	public void update(UserVO vo);
	
	public long getLastNum();

}