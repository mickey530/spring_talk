package com.talk.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.talk.post.service.PostAtService;
import com.talk.post.service.PostLikeService;
import com.talk.post.service.PostService;
import com.talk.post.service.PostTagService;
import com.talk.post.service.TagService;
import com.talk.user.service.BanServiceImpl;
import com.talk.user.service.FollowServiceImpl;
import com.talk.user.service.UserService;
import com.talk.user.service.UserServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private BanServiceImpl banService;
	
	@Autowired
	private FollowServiceImpl followService;
	
	
	@Autowired
	private TagService tag;
	
	@GetMapping(value="/userInfo")
	public String userInfo() {
		return "user/userInfo";
	}
		
}
