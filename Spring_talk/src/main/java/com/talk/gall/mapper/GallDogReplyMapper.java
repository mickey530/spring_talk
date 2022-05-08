package com.talk.gall.mapper;

import com.talk.gall.domain.GallDogReplyVO;

public interface GallDogReplyMapper {
	
	public void insert(GallDogReplyVO vo);
	
	public GallDogReplyVO select(long board_num);
	
	public void delete(long board_num);
	
	public void update(GallDogReplyVO vo);
	
}
