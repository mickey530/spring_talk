package com.talk.reply.service;

import java.util.List;

import com.talk.reply.domain.ReplyVO;

public interface ReplyService {
	
	
public List<ReplyVO>listReply(Long board_num); // 불러오기
	
	public void addReply(ReplyVO vo); 
	
	public void modifyReply(ReplyVO vo); 
	
	public void removeReply(Long reply_num); 

	public void removeAllReply(Long post_num); 

}