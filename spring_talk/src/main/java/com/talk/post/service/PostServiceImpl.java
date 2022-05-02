package com.talk.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.post.domain.PostVO;
import com.talk.post.mapper.PostMapper;

@Service
public class PostServiceImpl implements PostService{

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
	}

	@Override
	public List<PostVO> getAllPost(int page_num) {
		return postMapper.getAllPost(page_num);
	}

	@Override
	public List<PostVO> getUserPost(String user_id, int page_num) {
		return postMapper.getUserPost(user_id, page_num);
	}

}