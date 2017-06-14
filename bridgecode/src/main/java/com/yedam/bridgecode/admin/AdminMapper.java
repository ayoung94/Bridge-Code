package com.yedam.bridgecode.admin;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;

@MapperScan
public interface AdminMapper {
	public List<MemberVO> getUserList();
	public MemberVO getUserSel(MemberVO vo);
}
