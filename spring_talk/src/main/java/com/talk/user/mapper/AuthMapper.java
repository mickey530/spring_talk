package com.talk.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.user.domain.MemberVO;
import com.talk.user.domain.UserAuthVO;

public interface AuthMapper {

	public UserAuthVO getUserAuth(String userId);

	public List<UserAuthVO> getAllUserAuth();

	public void insert(@Param("user_id") String user_id, @Param("user_auth") String user_auth);

	public void deleteAll(@Param("user_id") String user_id);
	
	public void delete(@Param("user_id") String user_id, @Param("user_auth") String user_auth);

}
