package com.talk.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.post.domain.Criteria;
import com.talk.post.domain.FollowCriteria;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;
import com.talk.post.mapper.PostLikeMapper;
import com.talk.post.mapper.PostMapper;
import com.talk.reply.mapper.ReplyMapper;

@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private PostLikeMapper postLikeMapper;

	@Override
	public void insert(PostVO vo) {
		postMapper.insert(vo);
	}

	@Override
	public PostVO select(long post_num) {
		return postMapper.select(post_num);
	}

	@Transactional
	@Override
	public void delete(long post_num) {
		replyMapper.deleteAllReplies(post_num);
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
	public List<PostVO> getUserPost(UserCriteria cri) {
		return postMapper.getUserPost(cri);
	}

	@Override
	public List<PostVO> getFollowingPost(FollowCriteria cri) {
		return postMapper.getFollowingPost(cri);
	}
	

	

}
