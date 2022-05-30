package com.talk.report.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportReplyVO {
	private long report_rnum;
	private Date report_reply_date;
	private long report_reply_num;
	private String report_id;
	private String report_reason;

}
