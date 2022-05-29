package com.talk.reply.service;

import java.util.List;

import com.talk.reply.domain.ReplyVO;
import com.talk.user.domain.UserVO;

public interface ReplyAtService {
	
	public List<ReplyVO>ReplyList(Long board_num);
	
	public List<UserVO>ReplyUserList(String user_id);
	
	
	
}
