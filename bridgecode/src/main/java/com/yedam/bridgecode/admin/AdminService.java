package com.yedam.bridgecode.admin;

import java.util.List;

import com.yedam.bridgecode.member.MemberVO;

public interface AdminService {
	public MemberVO getUserSel(MemberVO vo);
	public void updateUserApplication(MemberVO vo);
	public void updateUserReject(MemberVO vo);
	public int countUserApplication(MemberVO vo);
}
