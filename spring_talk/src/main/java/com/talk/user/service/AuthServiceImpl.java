package com.talk.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.AuthMapper;

@Service
public class AuthServiceImpl implements AuthService{
	
	@Autowired
	AuthMapper mapper;

	@Override
	public List<AuthVO> userAuthList(String user_id) {
		// TODO Auto-generated method stub
		
		List<AuthVO> authList = new ArrayList<AuthVO>();
		
		UserVO auvoList = mapper.getUserAuth(user_id);
		
		for(AuthVO avo : auvoList.getAvos()) {
			authList.add(avo);
		}
		
		return authList;
	}

	@Override
	public List<UserVO> readAllAuthList() {
		// TODO Auto-generated method stub
		return mapper.getAllUserAuth();
	}

	@Override
	public void insert(UserVO vo) {
		// TODO Auto-generated method stub
		
		for(AuthVO auth : vo.getAvos()) {
			System.out.println("insert auth : " + auth);
		}
		
		mapper.insertAuth(vo);
		
	}

	@Override
	public void deleteAll(String user_id) {
		// TODO Auto-generated method stub
		mapper.deleteAll(user_id);
	}

	@Override
	public void delete(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addAuth(AuthVO vo) {
		// TODO Auto-generated method stub


		mapper.addAuth(vo);
	}

}
