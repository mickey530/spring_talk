package com.talk.follow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/follow")
public class BanController {
	
	@GetMapping(value="/followList")
	public String userInfo() {
		return "ban/followList";
	}
	
}
