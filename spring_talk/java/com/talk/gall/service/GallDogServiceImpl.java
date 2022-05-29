package com.talk.gall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;
import com.talk.gall.domain.SearchCriteria;
import com.talk.gall.mapper.GallDogMapper;
import com.talk.gall.mapper.GallDogReplyMapper;

@Service
public class GallDogServiceImpl implements GallDogService {

	@Autowired
	private GallDogMapper gallDogMapper;
	
	@Autowired
	private GallDogReplyMapper gallDogReplyMapper;

	@Override
	public List<GallListVO> gallList() {
		return gallDogMapper.gallList();
	}
	
	@Override
	public void insert(GallDogVO vo) {
		gallDogMapper.insert(vo);
	}

	@Override
	public GallDogVO select(GallDogVO vo) {
		return gallDogMapper.select(vo);
	}

	@Transactional
	@Override
	public void delete(GallDogVO vo) {
		gallDogMapper.delete(vo);
		
	}
	@Override
	public GallDogVO update(GallDogVO vo) {
		return gallDogMapper.update(vo);		
	}

	@Override
	public List<GallDogVO> allList(String gall_name) {
		return gallDogMapper.allList(gall_name);
	}

	@Override
	public void upHit(GallDogVO vo) {
		gallDogMapper.upHit(vo);
		
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return gallDogMapper.countPageNum(cri);
	}
}	


