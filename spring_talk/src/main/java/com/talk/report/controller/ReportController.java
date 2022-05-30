package com.talk.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.talk.post.domain.PostVO;
import com.talk.post.service.PostService;
import com.talk.reply.domain.ReplyVO;
import com.talk.reply.service.ReplyService;
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
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private ReplyService replyService;
	
	/*
	// 게시글 신고하기 
	@PostMapping(value="/insert/{report_post_num}", consumes="application/json",	
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register1 (@RequestBody ReportPostVO vo){
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
	@PostMapping(value="/insert/{report_reply_num}", consumes="application/json",	
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
	*/
	
	// 게시글 신고하기 
	@GetMapping("/post/{post_num}")
	public String postForm(@PathVariable Long post_num, Model model) {
		model.addAttribute("post_num", post_num);
		return "report/reportPostForm";
	}
	@PostMapping("/post")
	public String postForm(ReportPostVO vo, int eu) {
	    System.out.println(eu);
	    
	    
	    switch (eu) {
		case 1:
			vo.setReport_reason("스팸홍보/도배글입니다.");
			break;
		case 2:
			vo.setReport_reason("음란물입니다.");
			break;
		case 3:
			vo.setReport_reason("불법정보를 포함하고 있습니다.");
			break;
		case 4:
			vo.setReport_reason("청소년에게 유해한 내용입니다.");
			break;
		case 5:
			vo.setReport_reason("욕설/생명경시/혐오/차별적 표현입니다.");
			break;
		case 6:
			vo.setReport_reason("개인정보 노출 게시물입니다.");
			break;
		case 7:
			vo.setReport_reason("불쾌한 표현이 있습니다.");
			break;

		default:
			break;
		}
	    reportPostService.addReport(vo);
	    
		return "redirect:/report/reportPostList";		
	}
	// 댓글 신고하기
	@GetMapping("/reply/{reply_num}")
	public String replyForm(@PathVariable Long reply_num, Model model) {
		model.addAttribute("reply_num", reply_num);
		return "report/reportReplyForm";
	}
	@PostMapping("/reply")
	public String replyForm(ReportReplyVO vo, int eu) {
		
		System.out.println("eu : " +eu);
	    
		  switch (eu) {
			case 1:
				vo.setReport_reason("스팸홍보/도배글입니다.");
				break;
			case 2:
				vo.setReport_reason("음란물입니다.");
				break;
			case 3:
				vo.setReport_reason("불법정보를 포함하고 있습니다.");
				break;
			case 4:
				vo.setReport_reason("청소년에게 유해한 내용입니다.");
				break;
			case 5:
				vo.setReport_reason("욕설/생명경시/혐오/차별적 표현입니다.");
				break;
			case 6:
				vo.setReport_reason("개인정보 노출 게시물입니다.");
				break;
			case 7:
				vo.setReport_reason("불쾌한 표현이 있습니다.");
				break;

			default:
				break;
			}
		reportReplyService.addReport(vo);
		return "redirect:/report/reportReplyList";		
	}
	
	
	
	
	
	/*
	// 신고게시글 목록
	@GetMapping(value="/all/{report_post_num}",
	produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReportPostVO>> list1 (@PathVariable("report_post_num") Long report_post_num){
		ResponseEntity<List<ReportPostVO>> entity = null;		
		try {
			entity = new ResponseEntity<>(
					reportPostService.listReport(report_post_num), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	return entity;
	}
	// 신고댓글 목록
	@GetMapping(value="/all/{report_reply_num}",
	produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReportReplyVO>> list2 (@PathVariable("report_reply_num") Long report_reply_num){
		ResponseEntity<List<ReportReplyVO>> entity = null;		
		try {
			entity = new ResponseEntity<>(
					reportReplyService.listReport(report_reply_num), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	return entity;
	}
	*/
	
	// 신고게시글 목록
	@GetMapping("/reportPostList")
	public String postList(Model model){
		List<ReportPostVO> postList = reportPostService.listReport(0);
		model.addAttribute("postList", postList);
		return "report/reportPostList";
	}	
	// 신고댓글 목록
	@GetMapping("/reportReplyList")
	public String replyList(Model model){
		List<ReportReplyVO> replyList = reportReplyService.listReport(0);
		model.addAttribute("replyList", replyList);
		return "report/reportReplyList";
	}
	
	
	
	
	/*
	// 게시글 신고 중 삭제
	@DeleteMapping(value="/deletepost/{report_post_num}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove1 (@PathVariable("report_post_num") Long report_post_num){
	ResponseEntity<String> entity = null;	
	try {
		reportPostService.removeReport(report_post_num);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	} catch(Exception e) {
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	// 댓글 신고 중 삭제
	@DeleteMapping(value="/deletereply/{report_reply_num}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove2 (@PathVariable("report_reply_num") Long report_reply_num){
	ResponseEntity<String> entity = null;
	try {
		reportReplyService.removeReport(report_reply_num);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	} catch(Exception e) {
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	*/
	
	// 게시글 신고 목록 중 삭제
	@GetMapping("/reportPostDelete/{report_pnum}")
	public String postDelete(@PathVariable long report_pnum) {
		reportPostService.removeReport(report_pnum);
		return "redirect:/report/reportPostList";
	}
	
	// 댓글 신고 목록 중 삭제
	@GetMapping("/reportReplyDelete/{report_rnum}")
	public String replyDelete(@PathVariable long report_rnum) {
		reportReplyService.removeReport(report_rnum);
		return "redirect:/report/reportReplyList";
	}

	
	
	
	
	// 신고 게시글 상세
	@GetMapping("/reportPostDetail/{report_pnum}")
	public String reportPostDetail(@PathVariable Long report_pnum, Model model) {
		ReportPostVO post = reportPostService.select(report_pnum);
		model.addAttribute("post", post);
		
		Long report_post_num = post.getReport_post_num();
		
		PostVO postvo = postService.select(report_post_num);
		model.addAttribute("postvo", postvo);
		
		return "report/reportPostDetail";
	} 

	
	// 신고 댓글 상세
	@GetMapping("/reportReplyDetail/{report_rnum}")
	public String reportReplyDetail(@PathVariable Long report_rnum, Model model) {
		ReportReplyVO reply = reportReplyService.select(report_rnum);
		model.addAttribute("reply", reply);

		Long report_reply_num = reply.getReport_reply_num();
		
		ReplyVO replyvo = replyService.getselect(report_reply_num);
		model.addAttribute("replyvo", replyvo);
		
		return "report/reportReplyDetail";
	}
}