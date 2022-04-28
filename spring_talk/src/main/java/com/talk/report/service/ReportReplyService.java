package com.talk.report.service;

import java.util.List;

import com.talk.report.domain.ReportReplyVO;

public interface ReportReplyService {
	
public List<ReportReplyVO> listReport(long reportreplyNum);
	
	public void addReport(ReportReplyVO vo);
	
	public void modifyReport(ReportReplyVO vo);
	
	public void removeReport(long reportreplyNum);
}
	

