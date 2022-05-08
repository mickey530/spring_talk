package com.talk.post.service;

import java.util.List;

import com.talk.post.domain.PostTagVO;
import com.talk.post.domain.TagVO;

public interface PostTagService {

//	public List<PostTagVO> postTagList(long post_num);
	
	public void tag(long post_num, List<TagVO> vo);

}
