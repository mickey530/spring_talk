package com.talk.gall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.gall.domain.SearchCriteria;
import com.talk.gall.domain.GallDogVO;

public interface GallDogMapper {

	public void insert(GallDogVO vo);
	
	public GallDogVO select(long board_num);
	
	public void delete(long board_num);
	
	public void update(GallDogVO vo);
	
	public List<GallDogVO> allList(long board_num);
	
	public void updateReplyCount(@Param("board_num") Long board_num,
			@Param("amount") int amount);

	public void updateLikeCount(@Param("board_num") Long board_num,
			@Param("amount") int amount);
	
	public int countPageNum(SearchCriteria cri);
	// 조회수
		public void upHit(long board_num);
}

// PostMapper.java 참조