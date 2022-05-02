package com.talk.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.post.domain.PostVO;

public interface PostMapper {

	public void insert(PostVO vo);
	
	public PostVO select(long post_num);
	
	public void delete(long post_num);
	
	public void update(PostVO vo);
	
	public List<PostVO> getAllPost(int page_num);
	
	public List<PostVO> getUserPost(String user_id, int page_num);
	
	public void updateReplyCount(@Param("post_num") Long post_bno,
								@Param("amount") int amount);
	

}