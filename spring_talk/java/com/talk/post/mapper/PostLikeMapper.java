package com.talk.post.mapper;

import com.talk.post.domain.PostLikeVO;

public interface PostLikeMapper {
	
	public void like(PostLikeVO vo);
	public void unlike(PostLikeVO vo);
	public String islike(PostLikeVO vo);
	public long likeCount(long post_num);
}
