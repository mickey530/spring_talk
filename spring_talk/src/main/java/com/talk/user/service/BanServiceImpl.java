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
	public int ban(String user_id) {
		return BanMapper.ban(user_id);
	}

	@Override
	public int baned(String user_id) {
		return BanMapper.baned(user_id);
	}
	@Override
	public boolean isBan(String baned_user_id, String ban_user_id) {
		return BanMapper.isBan(ban_user_id, baned_user_id);
	}

	@Override
	public boolean isBaned(String ban_user_id, String baned_user_id) {
		
		return BanMapper.isBaned(ban_user_id, baned_user_id);
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