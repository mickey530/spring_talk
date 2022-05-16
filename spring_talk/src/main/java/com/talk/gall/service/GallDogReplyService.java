package com.talk.gall.service;

import com.talk.gall.domain.GallDogReplyVO;
	
	public interface GallDogReplyService {

		public void insert(GallDogReplyVO vo);
		
		public GallDogReplyVO select(long board_num);

		public void update(GallDogReplyVO vo);
		
		public void delete(long board_num);
		}
