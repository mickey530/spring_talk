package com.talk.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import com.talk.user.domain.UserVO;

public interface UserMapper {

	public UserVO getUser(@Param("uno") long uno);
	
	public UserVO getUserById(@Param("uid") String uid);
	
	public UserVO loginCheck(@Param("uid") String uid, @Param("upw") String upw);
	
	public List<UserVO> getAllUsers();
	
	public void insert(UserVO vo);
	
	public void delete(@Param("uid") String uid);
	
	public void update(UserVO vo);
	
	public long lastUserNum();

	
	
}