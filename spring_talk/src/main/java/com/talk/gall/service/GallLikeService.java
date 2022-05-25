package com.talk.gall.service;

import com.talk.gall.domain.GallLikeVO;

public interface GallLikeService {	
	public void like(GallLikeVO vo);
	public String islike(GallLikeVO vo);
	public long likeCount(long board_num);
}
