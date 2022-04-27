package com.talk.post.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PostLikeVO {
	private int post_num;
	private String user_id;
	private Date w_date;
}
