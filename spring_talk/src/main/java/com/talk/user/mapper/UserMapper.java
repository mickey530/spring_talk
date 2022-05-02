package com.talk.user.mapper;

import java.util.List;

import com.talk.user.domain.UserVO;

public interface UserMapper {
	
	/*
	 * 
	 * 유저 조회
	 * 유저 정보 변경
	 * 유저 삭제
	 * 유저 추가
	
	
	*/
	
	public UserVO getUser(long uno);
	
	public List<UserVO> getAllUsers();
	
	public void insert(UserVO vo);
	
	public void delete(long uno);
	
	public void update(UserVO vo);

	
	
}