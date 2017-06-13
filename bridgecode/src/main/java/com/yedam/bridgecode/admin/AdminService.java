package com.yedam.bridgecode.admin;

import java.util.List;

import com.yedam.bridgecode.member.MemberVO;

public interface AdminService {
	public List<MemberVO> getUserList(MemberVO vo);
}
