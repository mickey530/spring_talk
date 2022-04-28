package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.mapper.gall_dog_mapper;

@Service
public class gall_dog_serviceImpl implements gall_dog_service {

	@Autowired
	gall_dog_mapper mapper;
	
	@Override
	public int select() {
		// TODO Auto-generated method stub
		return mapper.select();
	}

	@Override
	public int insert() {
		// TODO Auto-generated method stub
		return mapper.insert();
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		return mapper.delete();
	}

	@Override
	public int update() {
		// TODO Auto-generated method stub
		return mapper.update();
	}
	
	// 
	
}
