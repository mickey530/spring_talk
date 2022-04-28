package com.talk.report.mapper;

import java.util.List;

import com.talk.report.domain.ReportReplyVO;

public interface ReportReplyMapper {

	public List<ReportReplyVO> AllList(long reportreplyNum);
	
	public void insert(ReportReplyVO vo);
	
	public void update(ReportReplyVO vo);
	
	public void delete(long reportreplyNum);

}
