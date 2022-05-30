package com.talk.gall.service;

import java.util.List;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;

public interface GallListService {

	public void create(GallListVO vo);
	
	public void createTbl(String gall_name);
	
	public List<GallListVO> list(String gall_name);
	
	public void ReplyTbl(String gall_name);
	
	public void deleteTbl(String gall_name);

	public String getGallName(String table_name);

}
