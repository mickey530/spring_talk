package com.talk.security.controller;

import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/secu/user/*")
@Controller
public class SecurityController {

	@GetMapping("/all")
	public void doAll() {
		log.info("doAll");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("doMember");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("doAdmin");
	}
}
