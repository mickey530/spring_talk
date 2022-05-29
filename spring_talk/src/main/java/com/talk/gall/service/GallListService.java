package com.talk.gall.service;

import com.talk.gall.domain.GallListVO;

public interface GallListService {

	public void create(GallListVO vo);

	public String getGallName(String table_name);

}
