package com.talk.gall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.gall.domain.GallReplyVO;
import com.talk.gall.mapper.GallMapper;
import com.talk.gall.mapper.GallReplyMapper;

@Service
public class GallReplyServiceImpl implements GallReplyService {
	
	@Autowired
	private GallReplyMapper replymapper;
	
	@Autowired
	private GallMapper boardmapper;

	@Override
	public List<GallReplyVO> listReply(GallReplyVO vo) {
		return replymapper.getList(vo);
	}

	@Override
	public void addReply(GallReplyVO vo) {
		replymapper.create(vo);
		boardmapper.updateReplyCount(vo.getGall_name(), vo.getBoard_num(), 1);
		
	}

	@Override
	public void modifyReply(GallReplyVO vo) {
		replymapper.update(vo);
		
	}

	@Override
	public void removeReply(GallReplyVO vo) {
		replymapper.delete(vo);
//		boardmapper.updateReplyCount(vo.getGall_name(), vo.getBoard_num(), -1);

	}
	
	
	
	

}
