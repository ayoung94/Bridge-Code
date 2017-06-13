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

import com.yedam.bridgecode.member.MemberVO;

@ServerEndpoint(value="/coupleChat",configurator = GetHttpSessionConfigurator.class) 
public class ChatSocket{

	@Autowired
	ChatService chatService;
	
	private static Set<Session> clients = Collections.synchronizedSet(new 
			HashSet<Session>());
	@OnMessage
	public void onMessage(String message, Session session) throws IOException { 
		
		HttpSession httpsession = (HttpSession)session.getUserProperties().get("httpSession");
		
		MemberVO me = (MemberVO)httpsession.getAttribute("login");
		System.out.println("httpsession login의 member_id ="+me.getMember_id());
		System.out.println("message ="+message); 

		
		ChatVO vo = new ChatVO();
		
		try {
			
		vo.setChat_content(message);
		vo.setChat_from_id(me.getMember_id());
		
		
		chatService.insertChat(vo);
		
		} catch(Exception e) {
			System.out.println("오류 발생1");
			e.printStackTrace();
		}

		
		
		
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

		System.out.println("session="+session); 
	}
	@OnClose 
	public void onClose(Session session) { 
		// Remove session from the connected sessions set 
		clients.remove(session);
	}
}