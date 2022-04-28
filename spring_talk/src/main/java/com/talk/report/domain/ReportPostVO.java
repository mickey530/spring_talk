package com.talk.report.domain;

import lombok.Data;

@Data
public class ReportPostVO {
	private long reportNum;
	private long reportpostNum;
	private String reportId;
	private String reason;
	
	public void setReport(Long reportpostNum2) {
		// TODO Auto-generated method stub
		
	}
}
