package com.talk.ban.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.ban.domain.BanVO;
import com.talk.ban.mapper.BanMapper;

// BanService 인터페이스 구현
@Service // 빈 컨테이너에 등록(root-context.xml에서 컴포넌트 스캔까지 완료해야 등록됨)
public class BanServiceImpl implements BanService {

	@Autowired
	private BanMapper BanMapper;

	@Override
	public List<BanVO> selectIdsByUser(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BanVO> selectIdsByBan(String ban_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<com.talk.ban.domain.BanVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public com.talk.ban.domain.BanVO select(String user_id, String ban_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String user_id, String ban_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(BanVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(com.talk.ban.domain.BanVO vo) {
		// TODO Auto-generated method stub
		
	}


	
	
	
	
	
	
	
}
