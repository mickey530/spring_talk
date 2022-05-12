package com.talk.security.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@RequestMapping("/secu/*")
@Controller
public class SecurityHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(SecurityHomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping(value = "/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("접근거부 : " + auth);
		model.addAttribute("accessDenied",auth);
	}
	
	@Test
	@PostMapping("/customLogin")
	public void customLoginPost(String error,String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);

		if(error != null) {
			model.addAttribute("error",error);
		}
		if(logout != null) {
			model.addAttribute("logout",logout);
		}
		
		log.info("customLoginPagePost");
	}
	
	@Test
	@GetMapping("/customLogin")
	public String customLoginGet() {
		
		log.info("customLoginPageGet");
		return "/user/loginForm";
	}
	
	@GetMapping("/customLogout")
	public void customLogoutGet() {
		log.info("customLogoutGet");
	}
	
	@PostMapping("/customLogout")
	public void customLogoutPost() {
		log.info("customLogoutPost");
	}
}
