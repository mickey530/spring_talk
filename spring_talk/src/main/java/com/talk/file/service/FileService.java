package com.talk.file.service;

import java.util.List;

import com.talk.file.domain.ImageFileVO;

public interface FileService {

	//불러오기
	//넣기
	//지우기
	//업데이트

	public List<ImageFileVO> select(long post_num);
	
	public void update(List<ImageFileVO> vos);
	
	public void insert(List<ImageFileVO> vos);
	
	public void deleteAll(long post_num);
}
