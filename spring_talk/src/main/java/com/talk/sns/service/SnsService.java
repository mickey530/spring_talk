package com.talk.sns.service;

import java.util.List;

import com.talk.sns.domain.SnsVO;

public interface SnsService {

	public List<SnsVO> getAllData(String addr);
}
