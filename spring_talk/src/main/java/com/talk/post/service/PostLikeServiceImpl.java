package com.talk.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.post.domain.PostLikeVO;
import com.talk.post.mapper.PostLikeMapper;

@Service
public class PostLikeServiceImpl implements PostLikeService{

	@Autowired
	private PostLikeMapper postLikeMapper;
	
	@Override
	public void like(PostLikeVO vo) {
		postLikeMapper.like(vo);
	}
	
	@Override
	public void unlike(PostLikeVO vo) {
		postLikeMapper.unlike(vo);
	}

}
