package com.talk.post.service;

import java.util.List;

import com.talk.post.domain.Criteria;
import com.talk.post.domain.PostVO;

public interface PostService {

	public void insert(PostVO vo);
	
	public PostVO select(long post_num);
	
	public void delete(long post_num);
	
	public void update(PostVO vo);

	
	public List<PostVO> getAllPost(Criteria cri);
	
	public List<PostVO> getUserPost(String writer, Criteria cri);
}
