package com.talk.gall.service;

import java.util.List;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.SearchCriteria;

public interface GallDogService {

	public void insert(GallDogVO vo);
	
	public GallDogVO select(long board_num);

	public void update(GallDogVO vo);
	
	public void delete(long board_num);
	
	public List<GallDogVO> allList(long board_num);
	
	public int countPageNum(SearchCriteria cri);
	
	}


 //PostService.java 참조