package com.talk.report.domain;

import lombok.Data;

@Data
public class ReportPostVO {
	private long reportNum;
	private long reportpostNum;
	private String reportId;
	private String reportedId;
	private String reason;
}
