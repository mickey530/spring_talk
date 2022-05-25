package com.talk.gall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.gall.domain.GallVO;
import com.talk.gall.domain.SearchCriteria;
import com.talk.gall.mapper.GallMapper;
import com.talk.gall.mapper.GallReplyMapper;

@Service
public class GallServiceImpl implements GallService {

	@Autowired
	private GallMapper gallDogMapper;
	
	@Autowired
	private GallReplyMapper gallDogReplyMapper;
	
	

	@Override
	public void insert(GallVO vo) {
		gallDogMapper.insert(vo);
	}

	@Override
	public GallVO select(GallVO vo) {
		return gallDogMapper.select(vo);
	}

	@Transactional
	@Override
	public void delete(GallVO vo) {
		gallDogMapper.delete(vo);
		
	}
	@Override
	public GallVO update(GallVO vo) {
		return gallDogMapper.update(vo);		
	}

	@Override
	public List<GallVO> allList(String gall_name) {
		return gallDogMapper.allList(gall_name);
	}

	@Override
	public void upHit(GallVO vo) {
		gallDogMapper.upHit(vo);
		
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return gallDogMapper.countPageNum(cri);
	}
}	


