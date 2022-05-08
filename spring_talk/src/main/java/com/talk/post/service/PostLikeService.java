package com.talk.post.service;

import com.talk.post.domain.PostLikeVO;

public interface PostLikeService {
	public void like(PostLikeVO vo);
	public void unlike(PostLikeVO vo);
	public PostLikeVO islike(PostLikeVO vo);
}
