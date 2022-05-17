package com.talk.gall.mapper;

import com.talk.gall.domain.GallDogLikeVO;

public interface GallDogLikeMapper {

	public void like(GallDogLikeVO vo);
	public void unlike(GallDogLikeVO vo);
	public String islike(GallDogLikeVO vo);
	public long likeCount(long board_num);
}
