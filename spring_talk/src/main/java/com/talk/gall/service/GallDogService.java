package com.talk.gall.service;

import com.talk.post.domain.PostVO;

import oracle.jdbc.proxy.annotation.Post;

public interface GallDogService {
		
		public void insert(Post vo);
			
		public PostVO select(long post_num);
			
		public void delete(long post_num);
			
		public void update(PostVO vo);
		
		// 0502수정 했습니다.
	}
