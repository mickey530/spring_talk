package com.talk.gall.service;

import java.util.List;

import com.talk.gall.domain.GallDogReplyVO;

public interface GallDogReplyService {
	
	public List<GallDogReplyVO> listReply(GallDogReplyVO vo);
	
	public void addReply(GallDogReplyVO vo);
	
	public void modifyReply(GallDogReplyVO vo);
	
	public void removeReply(GallDogReplyVO vo);

}
