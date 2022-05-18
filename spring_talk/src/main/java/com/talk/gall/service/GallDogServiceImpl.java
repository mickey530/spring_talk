package com.talk.gall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.gall.domain.GallDogVO;
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
	public void insert(GallDogVO vo) {
		gallDogMapper.insert(vo);
	}

	@Override
	public GallDogVO select(long board_num) {
		return gallDogMapper.select(board_num);
	}

	@Transactional
	@Override
	public void delete(long board_num) {
		gallDogMapper.delete(board_num);
		gallDogReplyMapper.delete(board_num);
	}

	@Override
	public void update(GallDogVO vo) {
		gallDogMapper.update(vo);
		
	}

	@Override
	public List<GallDogVO> allList() {
		return gallDogMapper.allList();
	}

	@Override
	public void upHit(long board_num) {
		gallDogMapper.upHit(board_num);
		
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return gallDogMapper.countPageNum(cri);
	}
}	


