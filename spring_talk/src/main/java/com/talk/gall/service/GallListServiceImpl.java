package com.talk.gall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;
import com.talk.gall.mapper.GallListMapper;

@Service
public class GallListServiceImpl implements GallListService{

	@Autowired
	GallListMapper gallList;
	
	@Override
	public void create(GallListVO vo) {
		gallList.create(vo);		
	}

	@Override
	public void createTbl(String gall_name) {
		gallList.createTbl(gall_name);
		
	}

	@Override
	public List<GallListVO> list(String gall_name) {
		return gallList.list(gall_name);
	}

	@Override
	public void ReplyTbl(String gall_name) {
		gallList.ReplyTbl(gall_name);
		
	}

	@Override
	public void deleteTbl(String gall_name) {
		gallList.deleteTbl(gall_name);
		
	}
	
	@Override
	public String getGallName(String table_name) {
		return gallList.getGallName(table_name);
	}
}
