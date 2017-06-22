package com.yedam.bridgecode.home;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;

@MapperScan
public interface HomeMapper {
	public List<Map<String,Object>> bestMemberList(MemberVO vo);
}
