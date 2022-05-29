package com.talk.gall.domain;



import java.sql.Date;

import lombok.Data;

@Data
public class GallDogReplyVO {
	private Long reply_num;
	private Long board_num;
	private Long parent_num;
	private String reply_content;
	private String writer;
	private String nameless; //보류
	private Date w_date;
	private Date m_date;
	
	private String gall_name;
	

}
