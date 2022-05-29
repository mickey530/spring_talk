package com.talk.gall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.gall.domain.SearchCriteria;
import com.talk.gall.domain.GallDogVO;
import com.talk.gall.domain.GallListVO;

public interface GallDogMapper {
	
	// 조회수
    public void upHit(GallDogVO vo);


    public List<GallListVO> gallList();

    public void insert(GallDogVO vo);
	
	public GallDogVO select(GallDogVO vo);
	
	public void delete(GallDogVO vo);
	
	public GallDogVO update(GallDogVO vo);
	
	public List<GallDogVO> allList(String gall_name);
	
	public void updateReplyCount(@Param("gall_name") String gall_name, @Param("board_num") Long board_num,
			@Param("amount") int amount);

	public void updateLikeCount(@Param("board_num") Long board_num,
			@Param("amount") int amount);
	
	public int countPageNum(SearchCriteria cri);	
}

// PostMapper.java 참조