package com.talk.report.domain;

import lombok.Data;

@Data
public class ReportReplyVO {
	private long reportNum;
	private long reportreplyNum;
	private String reportId;
	private String reason;
	
	public void setReport(Long reportreplyNum2) {
		// TODO Auto-generated method stub
		
	}
}
