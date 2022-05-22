package com.talk.gall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.domain.GallDogReplyVO;
import com.talk.gall.mapper.GallDogMapper;
import com.talk.gall.mapper.GallDogReplyMapper;

@Service
public class GallDogReplyServiceImpl implements GallDogReplyService {
	
	@Autowired
	private GallDogReplyMapper replymapper;
	
	@Autowired
	private GallDogMapper boardmapper;

	@Override
	public List<GallDogReplyVO> listReply(GallDogReplyVO vo) {
		return replymapper.getList(vo);
	}

	@Override
	public void addReply(GallDogReplyVO vo) {
		replymapper.create(vo);
		boardmapper.updateReplyCount(vo.getGall_name(), vo.getBoard_num(), 1);
		
	}

	@Override
	public void modifyReply(GallDogReplyVO vo) {
		replymapper.update(vo);
		
	}

	@Override
	public void removeReply(GallDogReplyVO vo) {
		replymapper.delete(vo);
//		boardmapper.updateReplyCount(vo.getGall_name(), vo.getBoard_num(), -1);

	}
	
	
	
	

}
