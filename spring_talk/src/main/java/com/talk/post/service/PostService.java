package com.talk.post.service;

import com.talk.post.domain.PostVO;

public interface PostService {

	public void insert(PostVO vo);
	
	public PostVO select(long post_num);
	
	public void delete(long post_num);
	
	public void update(PostVO vo);
}