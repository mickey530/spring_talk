package com.talk.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoteVO {

	private long note_num;
	private String note_content;
	private String note_sender;
	private String note_recipient;
	private Date regdate;
	private long pageNum;
}
