package com.talk.gall.service;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;

public interface GallListService {

	public void create(GallListVO vo);
	
	public void createTbl(String gall_name);

}