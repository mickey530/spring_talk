package com.talk.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.user.domain.UserVO;

public interface UserMapper {

	// 버튼 추가를 위해 pageNum 대신 Criteria를 활용합니다.
	
	public void insert(UserVO vo);
	
	public UserVO select(long bno);
	
	public void delete(long bno);
	
	public void update(UserVO vo);
	
	
}




