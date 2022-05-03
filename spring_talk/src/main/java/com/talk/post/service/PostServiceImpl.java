package com.talk.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.post.domain.Criteria;
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
	public List<PostVO> getAllPost(Criteria cri) {
		return postMapper.getAllPost(cri);
	}

	@Override
	public List<PostVO> getUserPost(String writer, Criteria cri) {
		return postMapper.getUserPost(writer, cri);
	}

}
