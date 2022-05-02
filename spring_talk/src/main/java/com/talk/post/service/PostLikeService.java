package com.talk.post.service;

import com.talk.post.domain.PostLikeVO;

public interface PostLikeService {
	public void like(PostLikeVO postLikeVO);
	public void unlike(PostLikeVO postLikeVO);
}
