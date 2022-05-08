package com.talk.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.post.mapper.TagMapper;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagMapper tagMapper;
	
	public void insert(String tag) {
		tagMapper.insert(tag);
	}

}