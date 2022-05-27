package com.talk.post.service;

import java.util.List;

import com.talk.file.domain.ImageFileVO;
import com.talk.post.domain.AdVO;
import com.talk.post.domain.Criteria;
import com.talk.post.domain.FollowCriteria;
import com.talk.post.domain.PostVO;
import com.talk.post.domain.UserCriteria;

public interface AdService {
	public AdVO select(int ad_num);
}
