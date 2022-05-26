package com.talk.gall.service;

import java.util.List;

import com.talk.gall.domain.GallReplyVO;

public interface GallReplyService {
	
	public List<GallReplyVO> listReply(GallReplyVO vo);
	
	public void addReply(GallReplyVO vo);
	
	public void modifyReply(GallReplyVO vo);
	
	public void removeReply(GallReplyVO vo);

}
