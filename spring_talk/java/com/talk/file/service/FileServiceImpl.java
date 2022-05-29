package com.talk.file.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.file.domain.ImageFileVO;
import com.talk.file.mapper.ImageFileMapper;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	ImageFileMapper ifMapper;

	@Override
	public void insert(List<ImageFileVO> ifvos) {
		// TODO Auto-generated method stub
		try {
			
			if(ifvos == null) {
				System.out.println("포스트 번호 없음");
				return;
			}
			System.out.println();

			System.out.println("FileServiceImpl insert");
			


			for(ImageFileVO ifvo : ifvos) {
				if(ifvo.getPost_num() == 0) {
					System.out.println("file insert 게시물 버튼 없음");
					continue;
				}
				ifMapper.insert(ifvo);
			}
			
		}catch(Exception e) {
			System.out.println("error : " + e);
		}
		
	}

	@Override
	public void update(List<ImageFileVO> vos) {
		// TODO Auto-generated method stub
		
		
		
	}
	
	@Override
	public void deleteAll(long post_num) {
		
		for(ImageFileVO file : select(post_num)) {

			File destFile = new File(file.getFile_name());
			if(destFile.exists()) {
				destFile.delete();
			}
		}
		ifMapper.deleteAll(post_num);
	}

	@Override
	public List<ImageFileVO> select(long post_num) {
		// TODO Auto-generated method stub

		return ifMapper.select(post_num);
	}
}
