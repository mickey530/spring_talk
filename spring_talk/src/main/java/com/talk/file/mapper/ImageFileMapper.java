package com.talk.file.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.file.domain.ImageFileVO;

public interface ImageFileMapper {
	
	public List<ImageFileVO> select(long post_num);

	public void insert(ImageFileVO vo);
	
	public void delete(@Param("file_num")long file_num);

	public void update(@Param("vos") List<ImageFileVO> vos);
	
}