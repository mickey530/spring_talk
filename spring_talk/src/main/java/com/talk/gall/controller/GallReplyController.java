package com.talk.gall.controller;

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
import org.springframework.web.bind.annotation.RestController;

import com.talk.gall.domain.GallDogReplyVO;
import com.talk.gall.service.GallDogReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/gellreplies")	
public class GallReplyController {
	
	@Autowired
	private GallDogReplyService service;
	
	
	// insert
	@PostMapping(value="", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody GallDogReplyVO vo){
		ResponseEntity<String>entity = null;
		
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// select
	@GetMapping(value="/all/{board_num}", produces = {MediaType.APPLICATION_XML_VALUE,
													  MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<GallDogReplyVO>> list(@PathVariable("board_num")Long board_num){
		ResponseEntity<List<GallDogReplyVO>>entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listReply(board_num),HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// delete
		@DeleteMapping(value="/{reply_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String>remove(@PathVariable("reply_num")Long reply_num){ 
			ResponseEntity<String> entity = null;
		try {
			service.removeReply(reply_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
		
		//update
		
		@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
				value="/{reply_num}",
				consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String>modify(@RequestBody GallDogReplyVO vo,@PathVariable("reply_num") Long reply_num){
			
			ResponseEntity<String> entity = null;
			try {
				vo.setReply_num(reply_num);
				
				service.modifyReply(vo);
				
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
				
}


