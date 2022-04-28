package com.talk.user.mapper;

import java.util.List;

import com.talk.user.domain.BanVO;
import com.talk.user.domain.FollowVO;
import com.talk.user.domain.UserVO;

public interface FollowMapper {

	// 버튼 추가를 위해 pageNum 대신 Criteria를 활용합니다.
	
	public void insert(FollowVO vo);

	public List<FollowVO> selectIdsByFollowed(String user_id);

	public List<FollowVO> selectIdsByFollower(String ban_id);

	public List<FollowVO> selectAll();
	
	public FollowVO select(String user_id, String ban_id);
	
	public void delete(String ban_id);
	
	public void update(FollowVO vo);
	
	
}




