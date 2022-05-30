package com.talk.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.user.domain.FollowVO;
import com.talk.user.domain.UserVO;

// 구현 클래스 UserServiceImpl의 뼈대가 됩니다.
public interface FollowService {

	//user_id가 팔로우한 사람들 조회
	public List<FollowVO> selectIdsByFollowed(String user_id);

	//user_id를 팔로우한 사람들 조회
	public List<FollowVO> selectIdsByFollower(String user_id);

	//user를 팔로우한 사람들의 UserVO 조회
	public List<UserVO> getFollowerList(String user_id);

	//user가 팔로우한 사람들의 UserVO 조회
	public List<UserVO> getFollowedList(String user_id);


	//user를 팔로우한 사람들 중 user도 팔로우 한 UserVO 조회
	public List<UserVO> getFriendList(String user_id);

	//user가 팔로우한 사람들 중 favorite 체크를 한 UserVO 조회
	public List<UserVO> getFavoriteList(String user_id);
	
	//user_id로 Follow 정보 조회
	public int countFollower(String user_id);
	
	//user_id로 Follow 정보 조회
	public int countFollowed(String user_id);
	
	//모든 사람들 조회
	public List<FollowVO> selectAll();

	//맞팔인지 판단
	public boolean checkFavorite(FollowVO vo);
	
	//넣고
	public void insert(FollowVO vo);
	
	//빼고
	public void delete(FollowVO vo);
	
	//고치고
	public void update(FollowVO vo);;
}