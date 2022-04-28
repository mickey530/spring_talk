package com.talk.report.mapper;

import java.util.List;

import com.talk.report.domain.ReportPostVO;

public interface ReportPostMapper {
	
	public List<ReportPostVO> AllList(long reportpostNum);
	
	public void insert(ReportPostVO vo);
	
	public void update(ReportPostVO vo);
	
	public void delete(long reportpostNum);
	
}
