package com.talk.post.service;

import com.talk.post.domain.PostLikeVO;

public interface PostLikeService {
	public void like(PostLikeVO vo);
	public String islike(PostLikeVO vo);
	public long likeCount(long post_num);
}
