package com.talk.gall.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class GallDogVO {
	
	private String gall_name;
	
	private long board_num;
	private String board_title;
	private String board_content;
	private String writer;
	private Date w_date;
	private Date m_date;
	private int replycount;
	private long like_count;
	private int hit; // 보류
}
