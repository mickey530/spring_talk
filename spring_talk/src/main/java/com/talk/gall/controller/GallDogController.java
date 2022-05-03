package com.talk.gall.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.talk.gall.service.GallDogService;
import com.talk.reply.service.ReplyAtService;
import com.talk.reply.service.ReplyLikeService;
import com.talk.reply.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/galldog")
public class GallDogController {
	@Autowired
	GallDogService service;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String galldog( Model model) {

		return "galldog";
	
}
}