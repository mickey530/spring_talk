package com.talk.gall.mapper;

import com.talk.gall.domain.GallLikeVO;

public interface GallLikeMapper {

	public void like(GallLikeVO vo);
	public void unlike(GallLikeVO vo);
	public String islike(GallLikeVO vo);
	public long likeCount(long board_num);
}
