package com.talk.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.reply.domain.ReplyVO;
import com.talk.reply.mapper.ReplyLikeMapper;
import com.talk.reply.mapper.ReplyMapper;
import com.talk.user.domain.UserVO;

@Service
public class ReplyLikeServiceImpl implements ReplyLikeService{

	@Autowired
	private ReplyLikeMapper mapper;
	
	@Override
	public List<ReplyVO> ReplyList(Long reply_num) {
		return mapper.getReplyList(reply_num);
	}

	@Override
	public List<UserVO> ReplyLikeUserList(String user_id) {
		return mapper.getReplyLikeUserList(user_id);
	}

	
	
	
}