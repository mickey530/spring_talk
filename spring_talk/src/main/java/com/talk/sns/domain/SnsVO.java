package com.talk.sns.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SnsVO {
	private String addr;
	private Date inspect_date;
	private int positive;
	private int negative;
	private int neutral;
}