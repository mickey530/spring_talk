package com.talk.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.user.domain.FriendBookVO;

public interface FriendBookMapper {

	public List<FriendBookVO> getFriendBook(@Param("user_id") String user_id);

	public void insert(FriendBookVO fbVO);
	
	public void update(FriendBookVO vo);
	
	public void delete(long book_num);

}
