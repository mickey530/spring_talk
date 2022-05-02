package com.talk.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.reply.domain.ReplyVO;
import com.talk.reply.mapper.ReplyAtMapper;
import com.talk.user.domain.UserVO;
@Service
public class ReplyAtServiceImpl implements ReplyAtService {
	
	@Autowired
	private ReplyAtMapper mapper;
	
	
	@Override
	public List<ReplyVO> ReplyList(Long board_num) {
		
		return mapper.getReplyList(board_num);
	}

	@Override
	public List<UserVO> ReplyUserList(String user_id) {
		
		return mapper.getReplyUserList(user_id);
	}

}