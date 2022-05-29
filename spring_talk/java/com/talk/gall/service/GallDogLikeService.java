package com.talk.gall.service;

import com.talk.gall.domain.GallDogLikeVO;

public interface GallDogLikeService {	
	public void like(GallDogLikeVO galldoglikeVO);
	public String islike(GallDogLikeVO vo);
	public long likeCount(long board_num);
}
