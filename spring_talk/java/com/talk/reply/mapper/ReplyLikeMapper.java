package com.talk.reply.mapper;

import java.util.List;

import com.talk.reply.domain.ReplyLikeVO;
import com.talk.reply.domain.ReplyVO;
import com.talk.user.domain.UserVO;

public interface ReplyLikeMapper {
	
	public void like(ReplyLikeVO vo);
	public void unlike(ReplyLikeVO vo);
	public String islike(ReplyLikeVO vo);
	public long likeCount(long reply_num);

	
//	// 보류
//	public List<ReplyVO>getReplyList(Long reply_num);
//	
//	//보류
//	public List<UserVO>getReplyLikeUserList(String reply_id);
	
	
}