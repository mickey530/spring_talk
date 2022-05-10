package com.talk.report.service;

import java.util.List;

import com.talk.report.domain.ReportPostVO;

public interface ReportPostService {

	public List<ReportPostVO> listReport(long report_post_num);
	
	public void addReport(ReportPostVO vo);
	
	public void removeReport(long report_post_num);
	
	public ReportPostVO select(long report_post_num);
}
  