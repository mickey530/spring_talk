package com.talk.reply.service;

import java.util.List;

import com.talk.reply.domain.ReplyLikeVO;
import com.talk.reply.domain.ReplyVO;
import com.talk.user.domain.UserVO;

public interface ReplyLikeService {
	public void like(ReplyLikeVO vo);
	public String islike(ReplyLikeVO vo);
	public long likeCount(long reply_num);
	
//	// 보류
//	public List<ReplyVO>ReplyList(Long reply_num);
//	
//	//보류
//	public List<UserVO>ReplyLikeUserList(String user_id);

	
}