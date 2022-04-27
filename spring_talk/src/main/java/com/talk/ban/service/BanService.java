package com.talk.ban.service;

import java.util.List;

import com.talk.ban.domain.BanVO;

// 구현 클래스 UserServiceImpl의 뼈대가 됩니다.
public interface BanService {

	public void insert(BanVO vo);
	
	public List<BanVO> selectIdsByUser(String user_id);

	public List<BanVO> selectIdsByBan(String ban_id);
	
	public List<BanVO> selectAll();
	
	public BanVO select(String user_id,String ban_id);
	
	public void delete(String user_id,String ban_id);
	
	public void update(BanVO vo);
}




