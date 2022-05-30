package com.talk.report.mapper;

import java.util.List;

import com.talk.report.domain.ReportPostVO;

public interface ReportPostMapper {
	
	public List<ReportPostVO> allList(long report_post_date);
	
	public void insert(ReportPostVO vo);
	
	public void delete(long report_pnum);
	
	public ReportPostVO select(long report_pnum);
	
}
