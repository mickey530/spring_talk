package com.talk.reply.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long reply_num;
	private Long parent_num;
	private Long post_num;
	private String reply_id;
	private String reply_content;
	private Date write_date;
	private Date update_date;
	private Long reply_level;
	private long like_count;

}