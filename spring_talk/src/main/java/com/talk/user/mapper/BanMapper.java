package com.talk.user.mapper;

import java.util.List;

import com.talk.user.domain.BanVO;
import com.talk.user.domain.UserVO;

public interface BanMapper {
	
	public void insert(BanVO vo);
	
	public List<BanVO> selectIdsByUser(String user_id);

	public List<BanVO> selectIdsByBan(String ban_id);
	
	public List<BanVO> selectAll();
	
	public BanVO select(String user_id,String ban_id);
	
	public void delete(String user_id,String ban_id);
	
	public void update(UserVO vo);
	
	
}




