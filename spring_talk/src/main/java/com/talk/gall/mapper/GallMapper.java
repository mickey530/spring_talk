package com.talk.gall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.gall.domain.SearchCriteria;
import com.talk.gall.domain.GallVO;

public interface GallMapper {
	
	// 조회수
    public void upHit(GallVO vo);


	public void insert(GallVO vo);
	
	public GallVO select(GallVO vo);
	
	public void delete(GallVO vo);
	
	public GallVO update(GallVO vo);
	
	public List<GallVO> allList(String gall_name);
	
	public void updateReplyCount(@Param("gall_name") String gall_name, @Param("board_num") Long board_num,
			@Param("amount") int amount);

	public void updateLikeCount(@Param("board_num") Long board_num,
			@Param("amount") int amount);
	
	public int countPageNum(SearchCriteria cri);
	
}

// PostMapper.java 참조