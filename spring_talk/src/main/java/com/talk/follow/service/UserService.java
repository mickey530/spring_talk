package com.talk.follow.service;

import java.util.List;

import com.talk.follow.domain.FollowVO;

// 구현 클래스 UserServiceImpl의 뼈대가 됩니다.
public interface UserService {

	public void insert(FollowVO vo);
	
	public List<FollowVO> selectIdsByFollowed(String user_id);
	
	public List<FollowVO> selectIdsByFollower(String ban_id);
	
	public List<FollowVO> selectAll();
	
	public FollowVO select(String user_id, String ban_id);
	
	public void delete(String ban_id);
	
	public void update(FollowVO vo);

}


