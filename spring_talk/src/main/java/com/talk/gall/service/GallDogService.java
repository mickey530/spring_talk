package com.talk.gall.service;

import com.talk.gall.domain.GallDogVO;

public interface GallDogService {

	public void insert(GallDogVO vo);
	
	public GallDogVO select(long board_num);

	public void update(GallDogVO vo);
	
	public void delete(long board_num);
	}


 //PostService.java 참조