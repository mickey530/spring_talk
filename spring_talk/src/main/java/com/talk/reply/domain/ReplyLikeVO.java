package com.talk.reply.domain;

import lombok.Data;

@Data
public class ReplyLikeVO {
	private Long reply_num;
	private String login_id;
	private long like_count;


}