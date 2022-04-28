package com.talk.reply.mapper;

import java.util.List;

import com.talk.reply.domain.ReplyVO;

public interface ReplyMapper {


	public List<ReplyVO> getList(Long board_num); // 불러오기
	
	public void create(ReplyVO vo); // 작성하기
	
	public void update(ReplyVO vo); // 수정하기
	
	public void delete(Long reply_num); // 지우기

}
	
	
	
