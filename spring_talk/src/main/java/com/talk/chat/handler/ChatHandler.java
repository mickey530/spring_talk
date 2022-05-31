package com.talk.chat.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;



@Component
public class ChatHandler extends TextWebSocketHandler{
	private List<Map<String,Object>> sessionList = new ArrayList<Map<String,Object>>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		System.out.println("afterConnectionEstablished");

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("session", session);
		sessionList.add(map);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
		System.out.println("handleTextMessage");
		
		ObjectMapper om = new ObjectMapper();

		
		Map<String, String> mapReceive = om.readValue(message.getPayload(), Map.class);

		System.out.println(mapReceive.get("cmd"));
		System.out.println(mapReceive.get("room_id"));
		System.out.println(mapReceive.get("msg"));
		System.out.println(mapReceive.get("user_name"));
		
		switch(mapReceive.get("cmd")) {
		case "CMD_ENTER":
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("room_id", mapReceive.get("room_id"));
			map.put("session", session);
			sessionList.add(map);
			
			for(Map<String,Object> mapSessionList : sessionList) {
				String room_id = (String) mapSessionList.get("room_id");
				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");

				if(mapSessionList.get("room_id")==null && sess.equals(session)) {
					System.out.println("room_id");
				}
				if(room_id.equals(mapReceive.get("room_id"))) {
					Map<String,String> mapToSend = new HashMap<String, String>();
					mapToSend.put("room_id", room_id);
					mapToSend.put("cmd", "CMD_ENTER");
					mapToSend.put("user_name", mapReceive.get("user_name"));
					mapToSend.put("msg", session.getId()+"님 입장");
					
					String json = om.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(json));
					
				}
			}
			break;
		case "CMD_MSG_SEND":
			for(Map<String,Object> mapSessionList : sessionList) {

				WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
				if(mapSessionList.get("room_id")==null && sess.equals(session)) {
					System.out.println("room_id");
					mapSessionList.put("room_id", mapReceive.get("room_id"));
				}
				
				String room_id = (String) mapSessionList.get("room_id");

				if(room_id.equals(mapReceive.get("room_id"))) {
					Map<String,String> mapToSend = new HashMap<String, String>();
					mapToSend.put("room_id", room_id);
					mapToSend.put("cmd", "CMD_MSG_SEND");
					mapToSend.put("user_name", mapReceive.get("user_name"));
					
					mapToSend.put("msg", mapReceive.get("user_name") +" : " + mapReceive.get("msg"));
					
					String json = om.writeValueAsString(mapToSend);
					sess.sendMessage(new TextMessage(json));
					
				}
			}
			break;
		}
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		System.out.println("afterConnectionClosed");

		ObjectMapper om = new ObjectMapper();
		String current_room_id = "";
		
		
		for(Map<String,Object> mapSessionList : sessionList) {
			String room_id = (String) mapSessionList.get("room_id");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
			
			if(session.equals(sess)) {
				current_room_id = room_id;
				sessionList.remove(mapSessionList);
				break;
			}
		}
		
		for(Map<String,Object> mapSessionList : sessionList) {
			String room_id = (String) mapSessionList.get("room_id");
			WebSocketSession sess = (WebSocketSession) mapSessionList.get("session");
			
			if(room_id.equals(current_room_id)) {
				Map<String,String> mapToSend = new HashMap<String, String>();
				mapToSend.put("room_id", room_id);
				mapToSend.put("cmd", "CMD_EXIT");
				mapToSend.put("user_name", (String) mapSessionList.get("user_name"));
				mapToSend.put("msg", (String) mapSessionList.get("user_name")+"님이 퇴장했습니다 ");
				
				String json = om.writeValueAsString(mapToSend);
				sess.sendMessage(new TextMessage(json));
				
			}
		}
		
	}
	
	
	
	
	/*
	 * @Override public void afterConnectionEstablished(WebSocketSession session)
	 * throws Exception { // TODO Auto-generated method stub
	 * 
	 * sessionList.add(session); System.out.println("afterConnectionEstablished : "
	 * + sessionList);
	 * System.out.println("afterConnectionEstablished session Length : " +
	 * sessionList.size());
	 * 
	 * for(WebSocketSession ws : sessionList) { ws.sendMessage(new
	 * TextMessage(session.getId() + "의 입장")); }
	 * 
	 * 
	 * }
	 * 
	 * @Override protected void handleBinaryMessage(WebSocketSession session,
	 * BinaryMessage message) { // TODO Auto-generated method stub
	 * 
	 * System.out.println("handleBinaryMessage message : " + message);
	 * 
	 * for(WebSocketSession ws : sessionList) { try {
	 * System.out.println("handleBinaryMessage : " + ws); ws.sendMessage(new
	 * TextMessage(session.getId() + " : " + message ));
	 * System.out.println("handleBinaryMessage id and message : " + message); }
	 * catch (IOException e) { // TODO Auto-generated catch block
	 * System.out.println("handleBinaryMessage error message : " + e); } } }
	 * 
	 * @Override protected void handleTextMessage(WebSocketSession session,
	 * TextMessage message) throws Exception { // TODO Auto-generated method stub
	 * System.out.println("handleTextMessage message : " + message); String payload
	 * = message.getPayload(); System.out.println("handleTextMessage payload : " +
	 * payload);
	 * 
	 * for(WebSocketSession ws : sessionList) { try {
	 * System.out.println("handleTextMessage : " + ws); ws.sendMessage(new
	 * TextMessage(session.getId() + " : " + payload ));
	 * System.out.println("handleTextMessage id and message : " + message); } catch
	 * (IOException e) { // TODO Auto-generated catch block
	 * System.out.println("handleTextMessage error message : " + e); } } }
	 * 
	 * 
	 * @Override public void afterConnectionClosed(WebSocketSession session,
	 * CloseStatus status) throws Exception { // TODO Auto-generated method stub
	 * sessionList.remove(session);
	 * 
	 * for(WebSocketSession ws : sessionList) { ws.sendMessage(new
	 * TextMessage("afterConnectionClosed : "+session.getId() + "의 퇴장")); }
	 * 
	 * }
	 */
	
}