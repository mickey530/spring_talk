package com.talk.gall.service;

import java.util.List;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;
import com.talk.gall.domain.SearchCriteria;

public interface GallDogService {

	public List<GallListVO> gallList();
	
	public void insert(GallDogVO vo);
	
	public GallDogVO select(GallDogVO vo);

	public GallDogVO update(GallDogVO vo);
	
	public void delete(GallDogVO vo);
	
	public List<GallDogVO> allList(String gall_name);
	
	public void upHit(GallDogVO vo);
	
	public int countPageNum(SearchCriteria cri);

	}


 //PostService.java 참조