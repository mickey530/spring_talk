package com.talk.gall.service;

import java.util.List;

import com.talk.gall.domain.GallDogReplyVO;

public interface GallDogReplyService {
	
	public List<GallDogReplyVO> listReply(Long board_num);
	
	public void addReply(GallDogReplyVO vo);
	
	public void modifyReply(GallDogReplyVO vo);
	
	public void removeReply(Long reply_num);

}
