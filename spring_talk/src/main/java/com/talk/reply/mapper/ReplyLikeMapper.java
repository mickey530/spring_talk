package com.talk.reply.mapper;

import java.util.List;

import com.talk.reply.domain.ReplyVO;
import com.talk.user.domain.UserVO;

public interface ReplyLikeMapper {
	
	// 보류
	public List<ReplyVO>getReplyList(Long reply_num);
	
	//보류
	public List<UserVO>getReplyLikeUserList(String reply_id);
	
	
}