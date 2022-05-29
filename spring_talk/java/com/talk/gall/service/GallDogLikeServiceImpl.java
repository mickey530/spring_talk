package com.talk.gall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.gall.domain.GallDogLikeVO;
import com.talk.gall.mapper.GallDogLikeMapper;
import com.talk.gall.mapper.GallDogMapper;

@Service
public class GallDogLikeServiceImpl implements GallDogLikeService{

	@Autowired
	private GallDogLikeMapper galldogLikeMapper;
	
	@Autowired
	private GallDogMapper galldogMapper;
	
	@Transactional
	@Override
	public void like(GallDogLikeVO vo) {
		String check = galldogLikeMapper.islike(vo);
		long board_num = vo.getBoard_num();
		if(check == null) {
			galldogLikeMapper.like(vo);
			galldogMapper.updateLikeCount(board_num, 1);
		} else {
			galldogLikeMapper.unlike(vo);
			galldogMapper.updateLikeCount(board_num, -1);
		}
	}

	@Override
	public String islike(GallDogLikeVO vo) {
		// TODO Auto-generated method stub
		return galldogLikeMapper.islike(vo);
	}

	@Override
	public long likeCount(long board_num) {
		// TODO Auto-generated method stub
		return galldogLikeMapper.likeCount(board_num);
	}

}
