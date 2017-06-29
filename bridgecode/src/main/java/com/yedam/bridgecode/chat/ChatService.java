package com.yedam.bridgecode.chat;

import java.util.List;
import java.util.Map;

import com.yedam.bridgecode.member.MemberVO;

public interface ChatService {
	public List<Map<String,Object>> getCoupleChatList(MemberVO vo);
	public void insertChat(ChatVO vo);
	public void insertWarning(MemberVO vo,String content);
	public List<Map<String,Object>> getAjaxCoupleChatList(MemberVO vo,String start,String end);
}
