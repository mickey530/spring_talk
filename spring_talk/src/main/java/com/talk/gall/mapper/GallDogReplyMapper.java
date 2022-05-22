package com.talk.gall.mapper;

import java.util.List;

import com.talk.gall.domain.GallDogReplyVO;

public interface GallDogReplyMapper {
	
	public List<GallDogReplyVO> getList(GallDogReplyVO vo); // 불러오기
	
	public void create(GallDogReplyVO vo); // 작성하기
	
	public void update(GallDogReplyVO vo); // 수정하기
	
	public void delete(GallDogReplyVO vo); // 지우기
	
	// 댓글 번호를 통해 글 번호 유추
	public Long getBoard_num(Long reply_num);
	
	// board_num 댓글을 다 삭제하는 쿼리문
	public void deleteAllReplies(Long board_num);
	
	public void updateLikeCount(GallDogReplyVO vo);

}
