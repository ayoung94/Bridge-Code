package com.yedam.bridgecode.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.member.MemberVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	//DAO를 호출하는 부분
	@Autowired
	private AdminMapper adminDAO;

	@Override
	public MemberVO getUserSel(MemberVO vo) {
		return adminDAO.getUserSel(vo);
	}

	@Override
	public void updateUserApplication(MemberVO vo) {
		adminDAO.updateUserApplication(vo);
	}

	@Override
	public void updateUserReject(MemberVO vo) {
		adminDAO.updateUserReject(vo);

	}

	@Override
	public int countUserApplication(MemberVO vo) {
		int count = 0;
		count = adminDAO.countUserApplication(vo);
		return count;
	}
}