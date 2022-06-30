package com.talk.sns.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.sns.domain.SnsVO;
import com.talk.sns.mapper.SnsMapper;

@Service
public class SnsServiceImpl implements SnsService{

	@Autowired
	private SnsMapper mapper;
	
	@Override
	public List<SnsVO> getAllData(String addr) {
		return mapper.getAllData(addr);
	}

}
