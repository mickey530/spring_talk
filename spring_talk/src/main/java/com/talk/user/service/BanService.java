package com.talk.user.service;

import java.util.List;

import com.talk.user.domain.BanVO;

public interface BanService {

	public void insert(BanVO vo);
	
	public List<BanVO> selectIdsByUser(String user_id);

	public List<BanVO> selectIdsByBan(String ban_id);
	
	public List<BanVO> selectAll();
	
	public BanVO select(String user_id,String ban_id);
	
	public void delete(String user_id,String ban_id);
	
	public void update(BanVO vo);
}




