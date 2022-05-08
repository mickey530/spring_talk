package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.BanVO;
import com.talk.user.mapper.BanMapper;

@Service
public class BanServiceImpl implements BanService {

	@Autowired
	private BanMapper BanMapper;

	@Override
	public List<BanVO> banedList(String user_id) {
		return BanMapper.banedList(user_id);
	}


	@Override
	public List<BanVO> banList(String user_id) {
		return BanMapper.banList(user_id);
	}


	@Override
	public int ban(String user_id) {
		return BanMapper.ban(user_id);
	}

	@Override
	public int baned(String user_id) {
		return BanMapper.baned(user_id);
	}
	
	//boolean 자료형 처리
	private boolean booleanProcess(int result) {
		return (result != 0);
	}
	
	@Override
	public boolean isBan(String baned_user_id, String ban_user_id) {
		int result = BanMapper.isBan(ban_user_id, baned_user_id);
		return booleanProcess(result);
	}

	@Override
	public boolean isBaned(String ban_user_id, String baned_user_id) {
		int result = BanMapper.isBaned(ban_user_id, baned_user_id);
		return booleanProcess(result);
	}


	@Override
	public void insert(BanVO vo) {
		BanMapper.insert(vo);
		
	}

	@Override
	public void delete(BanVO vo) {
		BanMapper.delete(vo);
	}

	@Override
	public void update(BanVO vo) {
		BanMapper.update(vo);
		
	}


}