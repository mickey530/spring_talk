package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.mapper.GallDogMapper;
import com.talk.post.domain.PostVO;
import com.talk.post.mapper.PostMapper;

import oracle.jdbc.proxy.annotation.Post;

@Service
public class GallDogServiceImpl implements GallDogMapper {

	@Autowired
	private PostMapper postMapper;
	
	@Override
	public void insert(PostVO vo) {
		postMapper.insert(vo);
	}

	@Override
	public PostVO select(long post_num) {
		return postMapper.select(post_num);
	}

	@Override
	public void delete(long post_num) {
		postMapper.delete(post_num);
	}

	@Override
	public void update(PostVO vo) {
		postMapper.update(vo);
		
		// 0502수정 했습니다.
		
	}

}