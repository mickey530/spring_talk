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
	public List<ReportReplyVO> listReport(long reportreplyNum) {
		// TODO Auto-generated method stub
		return mapper.AllList(reportreplyNum);
	}

	@Override
	public void addReport(ReportReplyVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public void modifyReport(ReportReplyVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void removeReport(long reportreplyNum) {		
		mapper.delete(reportreplyNum);	

	}	
}
