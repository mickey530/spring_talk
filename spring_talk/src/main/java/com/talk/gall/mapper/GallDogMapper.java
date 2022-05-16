package com.talk.gall.mapper;

import java.util.List;

import com.talk.gall.domain.GallDogVO;

public interface GallDogMapper {

	public void insert(GallDogVO vo);
	
	public GallDogVO select(long board_num);
	
	public void delete(long board_num);
	
	public void update(GallDogVO vo);
	
	public List<GallDogVO> allList(long board_num);
}

// PostMapper.java 참조