package com.talk.user.mapper;

import java.util.List;

import com.talk.user.domain.BanVO;
import com.talk.user.domain.UserVO;

public interface BanMapper {

	/*
	 * 
	 * 특정 유저의 밴당한 횟수
	 * 특정 유저의 밴한 횟수
	 * A 유저가 B 유저를 밴 했는지
	 * A 유저에게 B 유저가 밴 당했는지
	
	
	*/
	
	//밴한 횟수
	public int ban(String user_id);
	
	//밴 당한 횟수
	public int baned(String user_id);

	//ban_user가 baned_user를 밴 했는지
	public boolean isBaned(String ban_user_id, String baned_user_id);
	
	//baned_user가 ban_user에게 밴 당했는지
	public boolean isBan(String baned_user_id, String ban_user_id);

	public void insert(BanVO vo);

	public void delete(BanVO vo);

	public void update(BanVO vo);
	
}