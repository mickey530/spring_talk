package com.talk.reply.mapper;

import java.util.List;

import com.talk.reply.domain.ReplyVO;
import com.talk.user.domain.UserVO;

public interface ReplyAtMapper {

	public List<ReplyVO>getReplyList(Long board_num);
	
	// 보류
	public List<UserVO>getReplyUserList(String user_id);
	
}