package com.talk.gall.mapper;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;

public interface GallListMapper {
	
	public void create(GallListVO vo);
	
	public void createTbl(GallListVO vo);
	
	public String getGallName(String table_name);

}
