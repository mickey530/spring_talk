package com.talk.gall.service;

import java.util.List;

import com.talk.gall.domain.GallVO;
import com.talk.gall.domain.SearchCriteria;

public interface GallService {

	public void insert(GallVO vo);
	
	public GallVO select(GallVO vo);

	public GallVO update(GallVO vo);
	
	public void delete(GallVO vo);
	
	public List<GallVO> allList(String gall_name);
	
	public void upHit(GallVO vo);
	
	public int countPageNum(SearchCriteria cri);
	
	}