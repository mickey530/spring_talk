package com.talk.gall.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class GallDogReplyVO {
	
	private long reply_num;
	private long board_num;
	private long parent_num;
	private String reply_content;
	private String Writer;
	private Date w_date;
	private Date m_date;

}
