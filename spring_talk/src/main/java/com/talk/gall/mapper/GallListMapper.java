package com.talk.gall.mapper;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;

public interface GallListMapper {
	
	public void create(GallListVO vo);
	
	public void createTbl(String gall_name);

}
