package com.talk.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

import com.talk.file.domain.ImageFileVO;
import com.talk.file.service.FileService;
import com.talk.post.domain.AdVO;
import com.talk.post.domain.Criteria;
import com.talk.post.domain.FollowCriteria;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;
import com.talk.post.mapper.AdMapper;
import com.talk.post.mapper.PostLikeMapper;
import com.talk.post.mapper.PostMapper;
import com.talk.reply.mapper.ReplyMapper;

@Service
public class AdServiceImpl implements AdService{

	@Autowired
	private AdMapper mapper;

	@Override
	public AdVO select(int ad_num) {
		return mapper.select(ad_num);
	}
	
}
