package com.talk.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.reply.domain.ReplyCriteria;
import com.talk.reply.domain.ReplyVO;

public interface ReplyMapper {


	public List<ReplyVO> getList(ReplyCriteria cri); // 불러오기
	
	public void create(ReplyVO vo); // 작성하기
	
	public void update(ReplyVO vo); // 수정하기
	
	public void delete(Long reply_num); // 지우기

	public void deleteAll(Long reply_num); // 지우기

	public Long getPost_num(Long reply_num); // 댓글 번호를 통해 글 번호유추하기
	
	public ReplyVO select(long reply_num);
	
	public void deleteAllReplies(Long post_num);
	
	public long getReplySequence();
	
	public List<ReplyVO> replyPreview(Long post_num); // 좋아요 개수 상위 2개 불러오기
	
	public void updateLikeCount(@Param("reply_num") Long reply_num,
								@Param("amount") int amount);
}