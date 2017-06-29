package com.yedam.bridgecode.chat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;

@MapperScan
public interface ChatMapper {
	public void insertWarning(Map<String,Object> map);	
	public void insertChat(ChatVO vo);
	public List<Map<String,Object>> getCoupleChatList(MemberVO vo);
	public List<Map<String,Object>> getAjaxCoupleChatList(Map<String,Object> map);
}
