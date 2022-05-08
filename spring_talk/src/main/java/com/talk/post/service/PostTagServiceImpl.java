package com.talk.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.post.domain.PostTagVO;
import com.talk.post.domain.TagVO;
import com.talk.post.mapper.PostTagMapper;
import com.talk.post.mapper.TagMapper;

@Service
public class PostTagServiceImpl implements PostTagService {

	@Autowired
	private PostTagMapper postTagMapper;
	
	@Autowired
	private TagMapper tagMapper;
	
//	@Override
//	public List<PostTagVO> postTagList(long post_num) {
//		return postTagMapper.postTagList(post_num);
//	}
	
	@Override
	public void tag(long post_num, List<TagVO> vo) {
//		향상된 for문으로 post_num : vo1, post_num : vo2... 이런식으로 반복문 돌려서 저장
	}


}