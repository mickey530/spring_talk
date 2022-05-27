package com.talk.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.talk.post.domain.Criteria;
import com.talk.post.domain.PostVO;
import com.talk.user.domain.UserVO;
import com.talk.user.service.UserService;

import oracle.net.aso.m;


@Controller
@RequestMapping("/test/")
public class TestController{
	@Autowired
	UserService service;

	@ResponseBody
	@GetMapping(value="userProfile/{user_id}", produces= {
//			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<UserVO>list(@PathVariable("user_id")String user_id){
	
	ResponseEntity<UserVO> entity= null;
	System.out.println("getProfile : " + user_id);
	try {
		UserVO user  = service.selectById(user_id);
		if(user==null) {
			System.out.println("user is null");
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		entity = new ResponseEntity<>(service.selectById(user_id),HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
		return entity;
	}
	
	
}