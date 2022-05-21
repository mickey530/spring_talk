package com.talk.chat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



@Component
public class ChatHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		
		sessionList.add(session);
		System.out.println("afterConnectionEstablished : " + sessionList);
		System.out.println("afterConnectionEstablished session Length : " + sessionList.size());

		for(WebSocketSession ws : sessionList) {
			ws.sendMessage(new TextMessage(session.getId() + "의 입장"));
		}
		
		
	}
	
	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// TODO Auto-generated method stub
		
		System.out.println("handleBinaryMessage message : " + message);

		for(WebSocketSession ws : sessionList) {
			try {
				System.out.println("handleBinaryMessage : " + ws);
				ws.sendMessage(new TextMessage(session.getId() + " : " + message ));
				System.out.println("handleBinaryMessage id and message : " + message);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("handleBinaryMessage error message : " + e);
			}
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("handleTextMessage message : " + message);
	       String payload = message.getPayload();
			System.out.println("handleTextMessage payload : " + payload);

		for(WebSocketSession ws : sessionList) {
			try {
				System.out.println("handleTextMessage : " + ws);
				ws.sendMessage(new TextMessage(session.getId() + " : " + payload ));
				System.out.println("handleTextMessage id and message : " + message);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				System.out.println("handleTextMessage error message : " + e);
			}
		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		sessionList.remove(session);

		for(WebSocketSession ws : sessionList) {
			ws.sendMessage(new TextMessage("afterConnectionClosed : "+session.getId() + "의 퇴장"));
		}
		
	}
	
}