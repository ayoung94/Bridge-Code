package com.yedam.bridgecode.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("chatService") 
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatMapper ChatDAO;


	@Override
	public void insertChat(ChatVO vo) {
		ChatDAO.insertChat(vo);
	}
	
}
