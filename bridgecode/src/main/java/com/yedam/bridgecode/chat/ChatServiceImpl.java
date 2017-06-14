package com.yedam.bridgecode.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.member.MemberVO;


@Service("chatService") 
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatMapper chatDAO;


	@Override
	public void insertChat(ChatVO vo) {
		chatDAO.insertChat(vo);
	}

	@Override
	public void insertWarning(MemberVO vo,String content) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("vo",vo);
		map.put("reason",content);

		chatDAO.insertWarning(map);
	}

	@Override
	public List<Map<String, Object>> getCoupleChatList(MemberVO vo) {
		return chatDAO.getCoupleChatList(vo);
	}


	
	
}
