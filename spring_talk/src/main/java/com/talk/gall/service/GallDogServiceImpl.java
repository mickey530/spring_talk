package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.mapper.GallDogMapper;


import oracle.jdbc.proxy.annotation.Post;

@Service
public class GallDogServiceImpl implements GallDogMapper {

	@Autowired
	private GallDogMapper gallDogMapper;
	

		
	}

