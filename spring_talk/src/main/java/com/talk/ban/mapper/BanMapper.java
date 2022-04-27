package com.talk.ban.mapper;

import java.util.List;

import com.talk.ban.domain.BanVO;
import com.talk.user.domain.UserVO;

public interface BanMapper {

	// 버튼 추가를 위해 pageNum 대신 Criteria를 활용합니다.
	
	public void insert(BanVO vo);
	
	public List<BanVO> selectIdsByUser(String user_id);

	public List<BanVO> selectIdsByBan(String ban_id);
	
	public List<BanVO> selectAll();
	
	public BanVO select(String user_id,String ban_id);
	
	public void delete(String user_id,String ban_id);
	
	public void update(UserVO vo);
	
	
}




