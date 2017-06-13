package com.yedam.bridgecode.chat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;

@MapperScan
public interface ChatMapper {
	public void insertChat(ChatVO vo);
	public List<Map<String,Object>> getCoupleChatList(MemberVO vo);
}
