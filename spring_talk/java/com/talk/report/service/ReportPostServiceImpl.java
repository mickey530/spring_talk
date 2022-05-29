package com.talk.report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.talk.report.domain.ReportPostVO;
import com.talk.report.mapper.ReportPostMapper;

@Service
public class ReportPostServiceImpl implements ReportPostService{

	@Autowired
	private ReportPostMapper mapper;
	
	@Override
	public List<ReportPostVO> listReport(long report_pnum) {
		// TODO Auto-generated method stub
		return mapper.allList(report_pnum);
	}

	@Override
	public void addReport(ReportPostVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public void removeReport(long report_pnum) {
		mapper.delete(report_pnum);
		
	}

	@Override
	public ReportPostVO select(long report_pnum) {
		// TODO Auto-generated method stub
		return mapper.select(report_pnum);
	}
}
