package com.yedam.bridgecode.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.member.MemberVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{

	//DAO를 호출하는 부분
	@Autowired
	private AdminMapper AdminDAO;

	@Override
	public List<MemberVO> getUserList(MemberVO vo) {
		return null;
	}

}
