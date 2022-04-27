package com.talk.report.domain;

import lombok.Data;

@Data
public class ReportReplyVO {
	private long reportNum;
	private long reportreplyNum;
	private String reportId;
	private String reportedId;
	private String reason;
}
