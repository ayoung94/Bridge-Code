package com.yedam.bridgecode.chat;


import java.util.HashSet;
import java.util.Set;
import javax.annotation.Resource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class SocketHandler extends TextWebSocketHandler implements InitializingBean {
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	@Resource(name = "chatService")
    private ChatService chatService;

	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//OnClose
		super.afterConnectionClosed(session, status);
		sessionSet.remove(session);
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//OnOpen
		super.afterConnectionEstablished(session);
		sessionSet.add(session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		//OnMessage
		super.handleMessage(session, message);
		System.out.println(message.getPayload());
		String msg = (String)message.getPayload();
		String[] ar = msg.split(",");
		
		ChatVO vo = new ChatVO();
		vo.setChat_from_id(ar[0]);
		vo.setChat_to_id(ar[1]);
		vo.setChat_content(ar[2]);
		chatService.insertChat(vo);
		
		sendMessage(msg);

	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exceiption) throws Exception {
		
	}
	
	@Override
	public boolean supportsPartialMessages() {
		return super.supportsPartialMessages();
	}
	
	@Override
    public void afterPropertiesSet() throws Exception {

          Thread thread = new Thread(){
                 @Override
                 public void run() {
                        while (true){

                              try {
	          					/*SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          						String time = fm.format(new Date());
          						ObjectMapper mapper = new ObjectMapper();
          						
          						HashMap<String,Object> map = new HashMap<String,Object>();
          						map.put("cmdS", "timeS");
          						map.put("timeS", time);
          						time = mapper.writeValueAsString(map);
          						
          						idList();
          						
          						sendMessage(time);
                                Thread.sleep(1000);*/
                              } catch (Exception e) {
                                     e.printStackTrace();
                                     break;
                              }
                        }
                 }
          };
          thread.start();
    }
	
	public void sendMessage(String message) {
		synchronized (sessionSet) {
			for(WebSocketSession session: this.sessionSet) {
				if(session.isOpen()) {
					try {
						session.sendMessage(new TextMessage(message));
					} catch(Exception ignored) {
					}
				}
			}
		}
	}
	
	/*public void idList() throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String,Object> map2 = new HashMap<String,Object>();
		List<String> list = new ArrayList<String>();
		
		for(WebSocketSession session: this.sessionSet) {
			if(session.isOpen()) {
				try {
					map = session.getAttributes();
					CompanyVO companyvo = (CompanyVO) map.get("companyvo");
					PlansVO planvo = (PlansVO) map.get("planvo");
					BigDecimal planNo = planvo.getPlanNo();
					map2.put("planNo", planNo);
					String mberName = companyvo.getMberName();
					list.add("#  "+mberName+"<br>");
				} catch(Exception ignored) {
				}
			}
		}
		map2.put("cmdS", "listS");
		map2.put("listS", list);
		sendMessage(mapper.writeValueAsString(map2));
	}*/
}
