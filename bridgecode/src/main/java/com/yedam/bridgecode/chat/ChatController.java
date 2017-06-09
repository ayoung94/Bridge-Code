package com.yedam.bridgecode.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;

	

}
