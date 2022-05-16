package com.talk.post.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PostVO {
	private long post_num;
	private String title;
	private String content;
	private String writer;
	private Date w_date;
	private Date m_date;
	private int replycount;
	private long like_count;
}
