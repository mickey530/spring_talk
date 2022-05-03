package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.mapper.GallDogMapper;


import oracle.jdbc.proxy.annotation.Post;

@Service
public class GallDogServiceImpl implements GallDogService {

	@Autowired
	private GallDogMapper gallDogMapper;

	@Override
	public void insert(GallDogVO vo) {
		gallDogMapper.insert(vo);
	}

	@Override
	public GallDogVO select(long board_num) {
		return gallDogMapper.select(board_num);
	}

	@Override
	public void delete(long board_num) {
		gallDogMapper.delete(board_num);
	}

	@Override
	public void update(GallDogVO vo) {
		gallDogMapper.update(vo);
		
	}	
}	


