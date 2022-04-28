package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.FollowVO;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.FollowMapper;
import com.talk.user.mapper.UserMapper;

// UserService 인터페이스 구현
@Service // 빈 컨테이너에 등록(root-context.xml에서 컴포넌트 스캔까지 완료해야 등록됨)
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper Mapper;

	@Override
	public void insert(FollowVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<FollowVO> selectIdsByFollowed(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FollowVO> selectIdsByFollower(String ban_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FollowVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FollowVO select(String user_id, String ban_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String ban_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(FollowVO vo) {
		// TODO Auto-generated method stub
		
	}
	
}
