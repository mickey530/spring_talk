package com.talk.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.talk.report.domain.ReportPostVO;
import com.talk.report.domain.ReportReplyVO;
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
	
	
	// 게시글 신고하기 
	@PostMapping(value="", consumes="application/json",	
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register (@RequestBody ReportPostVO vo){
		ResponseEntity<String> entity = null;
		try {
			reportPostService.addReport(vo);	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);			
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 댓글 신고하기
	@PostMapping(value="", consumes="application/json",	
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register2 (@RequestBody ReportReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			reportReplyService.addReport(vo);	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);			
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	// 신고게시글 목록
	@GetMapping(value="/all/{reportNum}",
	produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReportPostVO>> list (@PathVariable("reportpostNum") Long reportpostNum){
		ResponseEntity<List<ReportPostVO>> entity = null;		
		try {
			entity = new ResponseEntity<>(
					reportPostService.listReport(reportpostNum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	return entity;
	}
	// 신고댓글 목록
	@GetMapping(value="/all/{reportreplyNum}",
	produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReportReplyVO>> list2 (@PathVariable("reportreplyNum") Long reportreplyNum){
		ResponseEntity<List<ReportReplyVO>> entity = null;		
		try {
			entity = new ResponseEntity<>(
					reportReplyService.listReport(reportreplyNum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	return entity;
	}
	
	
	
	// 게시글 신고 중 삭제
	@DeleteMapping(value="/{reportpostNum}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove1 (@PathVariable("reportpostNum") Long reportpostNum){
	ResponseEntity<String> entity = null;	
	try {
		reportPostService.removeReport(reportpostNum);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	} catch(Exception e) {
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
		return entity;
	}	
	// 댓글 신고 중 삭제
	@DeleteMapping(value="/{reportreplyNum}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove2 (@PathVariable("reportreplyNum") Long reportreplyNum){
	ResponseEntity<String> entity = null;	
	try {
		reportReplyService.removeReport(reportreplyNum);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	} catch(Exception e) {
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	
	
	// 게시글 신고내용 및 아이디 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{reportpostNum}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify1 (@RequestBody ReportPostVO vo,@PathVariable("reportNum") Long reportpostNum){
	ResponseEntity<String> entity = null;
	try {
		vo.setReport(reportpostNum);
		reportPostService.modifyReport(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	return entity;
	}
	// 댓글 신고내용 및 아이디 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{reportreplyNum}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify2 (@RequestBody ReportReplyVO vo,@PathVariable("reportreplyNum") Long reportreplyNum){
	ResponseEntity<String> entity = null;
	try {
		vo.setReport(reportreplyNum);
		reportReplyService.modifyReport(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	return entity;
	}
}