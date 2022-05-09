package com.talk.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.post.mapper.PostMapper;
import com.talk.reply.domain.ReplyVO;
import com.talk.reply.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private PostMapper postmapper;

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
	
	@Transactional
	@Override
	public void removeReply(Long reply_num) {
		Long post_num = mapper.getPost_num(reply_num);
		mapper.delete(reply_num);
		postmapper.updateReplyCount(post_num, -1);
		
	}

	@Override
	public void removeAllReply(Long post_num) {
		mapper.deleteAll(post_num);
	}
	
	
	
	

}