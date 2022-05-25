package com.talk.file.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.talk.file.domain.ImageFileVO;

public interface FileService {

	//불러오기
	//넣기
	//지우기
	//업데이트

	public List<ImageFileVO> select(long post_num);
	
	public void update(List<ImageFileVO> vos);

	public void insert(List<ImageFileVO> vos);
	
	public void insertBLOB(List<ImageFileVO> vos);
	
	public void delete(String post_num);
	
	public void deleteAll(@Param("post_num")long post_num);
}
