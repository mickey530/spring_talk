package com.talk.post.service;

import java.util.List;

import com.talk.file.domain.ImageFileVO;
import com.talk.post.domain.Criteria;
import com.talk.post.domain.FollowCriteria;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;

public interface PostService {

	public void insert(PostVO vo, List<ImageFileVO> ifVOs);
	
	public PostVO select(long post_num);
	
	public void delete(long post_num);
	
	public void update(PostVO vo);

	
	public List<PostVO> getAllPost(Criteria cri);
	
	public List<PostVO> getUserPost(UserCriteria cri);
	
	public List<PostVO> getFollowingPost(FollowCriteria cri);
}
