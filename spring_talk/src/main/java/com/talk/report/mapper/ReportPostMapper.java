package com.talk.report.mapper;

import java.util.List;

import com.talk.report.domain.ReportPostVO;

public interface ReportPostMapper {
	
	public List<ReportPostVO> AllList(long report_post_num);
	
	public void insert(ReportPostVO vo);
	
	public void delete(long report_post_num);
	
}
