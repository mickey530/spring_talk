package com.talk.reply.service;

import java.util.List;

import com.talk.reply.domain.ReplyCriteria;
import com.talk.reply.domain.ReplyVO;

public interface ReplyService {
	
	
	public List<ReplyVO>listReply(ReplyCriteria cri); // 불러오기
	
	public List<ReplyVO> replyPreview(Long post_num); // 좋아요 개수 상위 2개 불러오기
	
	public void addReply(ReplyVO vo); 
	
	public void modifyReply(ReplyVO vo); 
	
	public void removeReply(Long reply_num); 

	public void removeAllReply(Long post_num); 
	
	public ReplyVO getselect(long reply_num);
	
	public long getReplySequence();

}