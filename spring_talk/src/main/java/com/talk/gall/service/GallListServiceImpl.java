package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	

}
