package com.yedam.bridgecode.admin;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;

@MapperScan
public interface AdminMapper {
	public List<MemberVO> getUserList(MemberVO vo);
	public MemberVO getUserSel(MemberVO vo);
	public void updateUserApplication(MemberVO vo);
	public void updateUserReject(MemberVO vo);
	public int countUserApplication(MemberVO vo);
}
