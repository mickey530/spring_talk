package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.FollowVO;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.FollowMapper;
import com.talk.user.mapper.UserMapper;

@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper FollowMapper;

	@Override
	public List<FollowVO> selectIdsByFollowed(String user_id) {
		return FollowMapper.selectIdsByFollowed(user_id);
	}

	@Override
	public List<FollowVO> selectIdsByFollower(String user_id) {
		return FollowMapper.selectIdsByFollower(user_id);
	}

	@Override
	public List<UserVO> getFollowerList(String user_id) {
		
		return FollowMapper.getFollowerList(user_id);
	}

	@Override
	public List<UserVO> getFollowedList(String user_id) {
		return FollowMapper.getFollowedList(user_id);
	}

	@Override
	public List<UserVO> getFriendList(String user_id) {
		// TODO Auto-generated method stub
		return FollowMapper.getFriendList(user_id);
	}

	@Override
	public List<UserVO> getFavoriteList(String user_id) {
		// TODO Auto-generated method stub
		return FollowMapper.getFavoriteList(user_id);
	}


	@Override
	public int countFollower(String user_id) {
		return FollowMapper.countFollower(user_id);
	}

	@Override
	public int countFollowed(String user_id) {
		return FollowMapper.countFollowed(user_id);
	}

	@Override
	public List<FollowVO> selectAll() {
		return FollowMapper.selectAll();
	}

	@Override
	public boolean checkFavorite(FollowVO vo) {
		// TODO Auto-generated method stub
		
		return FollowMapper.checkFavorite(vo).size() > 0;
	}


	@Override
	public void insert(FollowVO vo) {
		FollowMapper.insert(vo);
	}

	@Override
	public void delete(FollowVO vo) {
		FollowMapper.delete(vo);
	}

	public void update(FollowVO vo) {
		System.out.println("update FollowVO : " + vo.toString());
		FollowMapper.update(vo);
	}
}