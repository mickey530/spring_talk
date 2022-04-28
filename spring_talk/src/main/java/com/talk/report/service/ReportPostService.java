package com.talk.report.service;

import java.util.List;

import com.talk.report.domain.ReportPostVO;

public interface ReportPostService {

	public List<ReportPostVO> listReport(long reportpostNum);
	
	public void addReport(ReportPostVO vo);
	
	public void modifyReport(ReportPostVO vo);
	
	public void removeReport(long reportpostNum);
}
  