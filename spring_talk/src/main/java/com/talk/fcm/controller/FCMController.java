package com.talk.fcm.controller;

import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/fcm")
@Controller
public class FCMController {

	@GetMapping("/")
	public void doAll() {
		System.out.println("asdf");
	}
}
