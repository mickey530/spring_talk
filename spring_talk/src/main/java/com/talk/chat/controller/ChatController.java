package com.talk.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import oracle.net.aso.m;


@Controller
@RequestMapping("/chatting")
public class ChatController{
	
	@GetMapping("/chat/{gall_name}")
	public String chat(@PathVariable("gall_name") String gall_name) {
		return "chatting/chat";
	}
	
}