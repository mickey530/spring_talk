package com.talk.user.service;

import java.util.List;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.FriendBookVO;
import com.talk.user.domain.UserVO;

public interface FriendBookService {
	
	public List<FriendBookVO> getFriendBook(String user_id);

	public void insert(FriendBookVO fbVO);
	
	public void update(FriendBookVO vo);
	
	public void delete(long book_num);
}
