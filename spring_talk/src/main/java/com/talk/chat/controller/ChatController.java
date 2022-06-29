package com.talk.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.talk.gall.service.GallListService;

import oracle.net.aso.m;


@Controller
@RequestMapping("/chatting")
public class ChatController{
	
	@Autowired
	GallListService listService;
	
	@GetMapping("/chat/{gall_name}")
	public String chat(@PathVariable("gall_name") String gall_name, Model model) {
		String gall_title = listService.getGallName(gall_name);
		model.addAttribute("gall_title", gall_title);
		return "chatting/chat";
	}
	
}