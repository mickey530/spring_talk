package com.talk.gall.mapper;

import com.talk.gall.domain.GallDogVO;

public interface GallDogMapper {

	public void insert(GallDogVO vo);
	
	public GallDogVO select(long board_num);
	
	public void delete(long board_num);
	
	public void update(GallDogVO vo);
}

// PostMapper.java 참조