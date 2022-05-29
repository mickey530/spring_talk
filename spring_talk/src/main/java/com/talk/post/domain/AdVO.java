package com.talk.post.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class AdVO {
	private int ad_num;
	private String title;
	private String content;
	private String link;
	private String company;
}
