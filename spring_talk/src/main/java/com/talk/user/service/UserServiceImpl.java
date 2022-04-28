package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.UserVO;
import com.talk.user.mapper.UserMapper;

// UserService 인터페이스 구현
@Service // 빈 컨테이너에 등록(root-context.xml에서 컴포넌트 스캔까지 완료해야 등록됨)
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper UserMapper;

	@Override
	public UserVO select(long bno) {
		return UserMapper.select(bno);
	}

	@Override
	public void insert(UserVO vo) {
		UserMapper.insert(vo);
	}

	@Override
	public void delete(long bno) {
		// mapper를 이용해 구현
		UserMapper.delete(bno);
	}

	@Override
	public void update(UserVO vo) {
		UserMapper.update(vo);
	}



	
	
	
	
	
	
	
}
