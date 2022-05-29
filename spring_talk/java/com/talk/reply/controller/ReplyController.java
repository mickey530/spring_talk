package com.talk.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.talk.post.domain.Criteria;
import com.talk.post.domain.PostLikeVO;
import com.talk.reply.domain.ReplyCriteria;
import com.talk.reply.domain.ReplyLikeVO;
import com.talk.reply.domain.ReplyVO;
import com.talk.reply.service.ReplyAtService;
import com.talk.reply.service.ReplyLikeService;
import com.talk.reply.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	@Autowired
	private ReplyAtService atService;
	
	@Autowired
	private ReplyLikeService likeService;
	
	
	
	// insert
	@PostMapping(value="", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity <String> register(@RequestBody ReplyVO vo){
		System.out.print("================"+vo+"===========");
//		int n = 225;
//		long m = n;
//		vo.setParent_num(m);
		ResponseEntity<String> entity= null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// select
	@GetMapping(value="/all/{post_num}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<ReplyVO>>list(@PathVariable("post_num")Long post_num, ReplyCriteria cri){
		
		ResponseEntity<List<ReplyVO>> entity= null;
		
		try {
			entity = new ResponseEntity<>(service.listReply(cri),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
}
	// select
	@GetMapping(value="/preview/{post_num}",produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<ReplyVO>>preview(@PathVariable("post_num")Long post_num){
		
		ResponseEntity<List<ReplyVO>> entity= null;
		
		try {
			entity = new ResponseEntity<>(service.replyPreview(post_num),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
}
	
	//delete
	@DeleteMapping(value="/{reply_num}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("reply_num")Long reply_num){
		ResponseEntity<String> entity = null;
		
		try {
			service.removeReply(reply_num);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	
	}
	
	// update수정로직
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
							 value="/{reply_num}",
							 consumes = "application/json",
							 produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String>modify(@RequestBody ReplyVO vo, @PathVariable("reply_num")Long reply_num){
		ResponseEntity<String> entity = null;
		try {
			log.info("rno 세팅 전 vo : " + vo);
			vo.setReply_num(reply_num);
			log.info("rno 세팅 후 vo : " + vo);
			service.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	
}
	// 댓글 시퀀스 가져오는 로직
	@GetMapping(value="/sequence",produces= {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})

	public ResponseEntity<Long> getReplySequence(){
	
	ResponseEntity<Long> entity= null;
	
	try {
	entity = new ResponseEntity<>(service.getReplySequence(),HttpStatus.OK);
	}catch(Exception e) {
	e.printStackTrace();
	entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	return entity;
	}
	
	// 좋아요 확인
	@PostMapping(value="/islike", consumes="application/json", produces= {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> islike(@RequestBody ReplyLikeVO vo){
		ResponseEntity<String> entity= null;
		try {
			entity = new ResponseEntity<>(likeService.islike(vo), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 좋아요
	@PostMapping(value="/like", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity <String> like(@RequestBody ReplyLikeVO vo){
		ResponseEntity<String> entity= null;
		try {
			likeService.like(vo);
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	
	// 좋아요 누른사람 리싀트
//	@GetMapping(value="/all/{post_num}",produces = {MediaType.APPLICATION_XML_VALUE,
//													MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<List<ReplyVO>> replyLikeList(@PathVariable("reply_num")Long reply_num){
//		
//		ResponseEntity<List<ReplyVO>> entity = null;
//		
//		try {
//			entity = new ResponseEntity<>(LikeService.ReplyList(reply_num), HttpStatus.OK);
//		}catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	
//	}
	
	
	
	
	
	
	
	
	
	
	
}
