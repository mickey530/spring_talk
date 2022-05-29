package com.talk.reply.domain;

import com.talk.post.domain.Criteria;
import com.talk.post.domain.UserCriteria;

import lombok.Data;

@Data
public class ReplyCriteria extends Criteria {
	private long post_num;

}
