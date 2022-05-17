package com.talk.fcm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.user.domain.UserVO;

public interface FCMMapper {

	public UserVO getUserAuth(String userId);

	public List<UserVO> getAllUserAuth();

	public void insertAuth(UserVO authList);

	public void deleteAll(@Param("user_id") String user_id);
	
	public void delete(@Param("user_id") String user_id, @Param("user_auth") String user_auth);

}