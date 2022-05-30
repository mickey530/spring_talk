package com.talk.report.mapper;

import java.util.List;

import com.talk.report.domain.ReportReplyVO;

public interface ReportReplyMapper {

	public List<ReportReplyVO> allList(long report_reply_num);
	
	public void insert(ReportReplyVO vo);
	
	public void delete(long report_rnum);
	
	public ReportReplyVO select(long report_rnum);

}
