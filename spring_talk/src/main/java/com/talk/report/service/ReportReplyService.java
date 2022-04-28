package com.talk.report.service;

import java.util.List;

import com.talk.report.domain.ReportReplyVO;

public interface ReportReplyService {
	
public List<ReportReplyVO> listReport(long reportNum);
	
	public void addReport(ReportReplyVO vo);
	
	public void modifyReport(ReportReplyVO vo);
	
	public void removeReport(long reportNum);
}
	

