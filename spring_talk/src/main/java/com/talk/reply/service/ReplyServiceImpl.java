package com.talk.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.talk.post.mapper.PostMapper;
import com.talk.reply.domain.ReplyCriteria;
import com.talk.reply.domain.ReplyVO;
import com.talk.reply.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private PostMapper postmapper;

	@Override
	public List<ReplyVO> listReply(ReplyCriteria cri) {		
		return mapper.getList(cri);
	}


	@Override
	public void addReply(ReplyVO vo) {
		mapper.create(vo);
		postmapper.updateReplyCount(vo.getPost_num(), 1);
		
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		mapper.update(vo);
		
	}
	
	@Transactional
	@Override
	public void removeReply(Long reply_num) {
		Long post_num = mapper.getPost_num(reply_num);
		System.out.println(post_num);
		System.out.println(reply_num);
		mapper.delete(reply_num);
		postmapper.updateReplyCount(post_num, -1);
		
	}

	@Override
	public void removeAllReply(Long post_num) {
		mapper.deleteAll(post_num);
	}

	@Override
	public ReplyVO getselect(long reply_num) {
		return mapper.select(reply_num);
	}


	@Override
	public long getReplySequence() {
		return mapper.getReplySequence();
	}


	@Override
	public List<ReplyVO> replyPreview(Long post_num) {
		return mapper.replyPreview(post_num);
	}
	
	
	
	

}