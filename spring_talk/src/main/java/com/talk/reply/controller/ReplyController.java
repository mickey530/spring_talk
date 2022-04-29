package com.talk.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	private ReplyAtService AtService;
	
	@Autowired
	private ReplyLikeService LikeService;
}
