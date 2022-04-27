package com.talk.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.talk.report.service.ReportPostService;
import com.talk.report.service.ReportReplyService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportPostService reportPostService;
	
	@Autowired
	private ReportReplyService reportReplyService;
}
