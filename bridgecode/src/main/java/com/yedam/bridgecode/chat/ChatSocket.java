package com.yedam.bridgecode.chat;
import java.io.IOException; 
import java.util.Collections; 
import java.util.HashSet; 
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose; 
import javax.websocket.OnMessage; 
import javax.websocket.OnOpen; 
import javax.websocket.Session; 
import javax.websocket.server.ServerEndpoint;
import org.springframework.beans.factory.annotation.Autowired;

@ServerEndpoint(value="/coupleChat",configurator = GetHttpSessionConfigurator.class) 
public class ChatSocket{
	

	@Autowired
	ChatService chatService;

	
	private static Set<Session> clients = Collections.synchronizedSet(new 
			HashSet<Session>());
	@OnMessage
	public void onMessage(String message, Session session,ChatVO vo) throws IOException { 
		
		String[] ar = message.split(",");
		
		vo.setChat_content(ar[0]);
		vo.setChat_from_id(ar[1]);
		
		chatService.insertChat(vo);
		
		
		System.out.println(message); 
		
		
		synchronized (clients) { 
			// Iterate over the connected sessions 
			// and broadcast the received message 
			for (Session client : clients) { 
				if (!client.equals(session)) { 
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnOpen 
	public void onOpen(Session session,EndpointConfig config) { 

		// Add session to the connected sessions set
		HttpSession httpSession = (HttpSession)config.getUserProperties().get(HttpSession.class.getName());
		clients.add(session);
		session.getUserProperties().put("httpSession", httpSession);

		System.out.println(session); 
	}
	@OnClose 
	public void onClose(Session session) { 
		// Remove session from the connected sessions set 
		clients.remove(session);
	}
}