package com.talk.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.post.domain.PostLikeVO;
import com.talk.post.mapper.PostLikeMapper;
import com.talk.post.mapper.PostMapper;

@Service
public class PostLikeServiceImpl implements PostLikeService{

	@Autowired
	private PostLikeMapper postLikeMapper;
	
	@Autowired
	private PostMapper postMapper;
	
	@Transactional
	@Override
	public void like(PostLikeVO vo) {
		String check = postLikeMapper.islike(vo);
		long post_num = vo.getPost_num();
		if(check == null) {
			postLikeMapper.like(vo);
			postMapper.updateLikeCount(post_num, 1);
		} else {
			postLikeMapper.unlike(vo);
			postMapper.updateLikeCount(post_num, -1);
		}
	}

	@Override
	public String islike(PostLikeVO vo) {	
		return postLikeMapper.islike(vo);
	}

	@Override
	public long likeCount(long post_num) {
		return postLikeMapper.likeCount(post_num);
	}

}
