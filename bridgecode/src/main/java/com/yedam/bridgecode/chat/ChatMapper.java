package com.yedam.bridgecode.chat;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ChatMapper {
	public void insertChat(ChatVO vo);
}
