package com.talk.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.post.domain.Criteria;
import com.talk.post.domain.FollowCriteria;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;

public interface PostMapper {

	public void insert(PostVO vo);
	
	public PostVO select(long post_num);
	
	public void delete(long post_num);
	
	public void update(PostVO vo);
	
	public List<PostVO> getAllPost(Criteria cri);
	
	public List<PostVO> getUserPost(UserCriteria cri);
	
	public List<PostVO> getFollowingPost(FollowCriteria cri);
	
	public void updateReplyCount(@Param("post_num") Long post_bno,
								@Param("amount") int amount);
	
	public void updateLikeCount(@Param("post_num") Long post_bno,
								@Param("amount") int amount);
}