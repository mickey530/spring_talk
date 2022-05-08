package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.domain.GallDogReplyVO;
import com.talk.gall.mapper.GallDogReplyMapper;
	
@Service
public class GallDogReplyServiceImpl implements GallDogReplyService{

	@Autowired
	private GallDogReplyMapper GallDogReplyMapper;
	
	@Override
	public void insert(GallDogReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public GallDogReplyVO select(long board_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(GallDogReplyVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(long board_num) {
		// TODO Auto-generated method stub
		
	}

}

