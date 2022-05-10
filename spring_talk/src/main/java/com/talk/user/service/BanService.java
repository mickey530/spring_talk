package com.talk.user.service;

import java.util.List;

import com.talk.user.domain.BanVO;

public interface BanService {
	
	public List<BanVO> banedList(String user_id);

	public List<BanVO> banList(String user_id);
	
	//user_id가 밴 한 횟수
	public int ban(String user_id);
	
	//user_id가 밴 당한 횟수
	public int baned(String user_id);

	//ban_user가 baned_user를 밴 했는지
	public boolean isBaned(String ban_user_id, String baned_user_id);
	
	//baned_user가 ban_user에게 밴 당했는지
	public boolean isBan(String baned_user_id, String ban_user_id);

	public void insert(BanVO vo);

	public void delete(BanVO vo);

	public void update(BanVO vo);
}
