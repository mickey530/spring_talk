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
		System.out.println("doAll");
	}
	
	@GetMapping("/member")
	public void doMember() {
		System.out.println("doMember");
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		System.out.println("doAdmin");
	}

	@GetMapping("/login")
	public void login() {
		System.out.println("login");
	}


	@GetMapping("/logout")
	public void logout() {
		System.out.println("logout");
	}
	
}
