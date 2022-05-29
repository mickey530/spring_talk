package com.talk.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.report.domain.ReportReplyVO;
import com.talk.report.mapper.ReportReplyMapper;

@Service
public class ReportReplyServiceImpl implements ReportReplyService{
	
	@Autowired
	private ReportReplyMapper mapper;

	@Override
	public List<ReportReplyVO> listReport(long report_rnum) {
		// TODO Auto-generated method stub
		return mapper.allList(report_rnum);
	}

	@Override
	public void addReport(ReportReplyVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public void removeReport(long report_rnum) {		
		mapper.delete(report_rnum);	

	}

	@Override
	public ReportReplyVO select(long report_rnum) {
		// TODO Auto-generated method stub
		return mapper.select(report_rnum);
	}	
}
