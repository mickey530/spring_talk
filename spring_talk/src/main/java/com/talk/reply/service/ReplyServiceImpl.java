package com.talk.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.reply.domain.ReplyVO;
import com.talk.reply.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;

	@Override
	public List<ReplyVO> listReply(Long board_num) {		
		return mapper.getList(board_num);
	}

	@Override
	public void addReply(ReplyVO vo) {
		mapper.create(vo);
		
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void removeReply(Long reply_num) {
		mapper.delete(reply_num);
		
	}
	
	
	
	

}
