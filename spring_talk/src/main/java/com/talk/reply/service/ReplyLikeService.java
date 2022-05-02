package com.talk.reply.service;

import java.util.List;

import com.talk.reply.domain.ReplyVO;
import com.talk.user.domain.UserVO;

public interface ReplyLikeService {

	
		// 보류
		public List<ReplyVO>ReplyList(Long reply_num);
		
		//보류
		public List<UserVO>ReplyLikeUserList(String user_id);
	
	
}