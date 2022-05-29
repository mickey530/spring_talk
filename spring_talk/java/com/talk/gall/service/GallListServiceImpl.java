package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.gall.domain.GallListVO;
import com.talk.gall.mapper.GallListMapper;

@Service
public class GallListServiceImpl implements GallListService{

	@Autowired
	GallListMapper gallList;
	
	@Override
	@Transactional
	public void create(GallListVO vo) {
		gallList.create(vo);
		gallList.createTbl(vo);

	}
	
	public String getGallName(String table_name) {
		return gallList.getGallName(table_name);
	}
	

}
