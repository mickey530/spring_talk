package com.talk.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.FriendBookVO;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.FriendBookMapper;

@Service
public class FriendBookServiceImpl implements FriendBookService {
	
	@Autowired
	public FriendBookMapper mapper;

	@Override
	public List<FriendBookVO> getFriendBook(String user_id) {
		
		return mapper.getFriendBook(user_id);
	}

	@Override
	public void insert(FriendBookVO fbVO) {
		// TODO Auto-generated method stub
		mapper.insert(fbVO);
	}

	@Override
	public void update(FriendBookVO vo) {
		// TODO Auto-generated method stub

		mapper.update(vo);
	}

	@Override
	public void delete(long book_num) {
		// TODO Auto-generated method stub

		mapper.delete(book_num);
	}
}
