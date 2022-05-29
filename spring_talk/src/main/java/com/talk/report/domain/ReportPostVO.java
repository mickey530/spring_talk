package com.talk.report.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportPostVO {
	private long report_pnum;
	private Date report_post_date;
	private long report_post_num;
	private String report_id;
	private String report_reason;

}
