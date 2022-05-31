package com.talk.gall.mapper;

import java.util.List;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;

public interface GallListMapper {
	
	public void create(GallListVO vo);
	
	public void createTbl(String gall_name);
	
	public List<GallListVO> list(String gall_name);
	
	public void ReplyTbl(String gall_name);
	
	public void deleteTbl(String table_name);
	
	public void deleteTblList(String table_name);
	
	public String getGallName(String table_name);

}
