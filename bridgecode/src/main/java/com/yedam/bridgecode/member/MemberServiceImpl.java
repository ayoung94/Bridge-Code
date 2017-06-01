package com.yedam.bridgecode.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	
	//DAO를 호출하는 부분
	@Autowired
	private MemberMapper MemberDAO;

	@Override
	public void insertMember(MemberVO vo) {
		MemberDAO.insertMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		MemberDAO.updateMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		MemberDAO.deleteMember(vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return MemberDAO.getMember(vo);
	}

	@Override
	public List<Map<String, Object>> getMemberList(MemberVO vo) {
		return MemberDAO.getMemberList(vo);
	}

	@Override
	public List<MemberVO> getMemberListVO(MemberVO vo) {
		return MemberDAO.getMemberListVO(vo);
	}

}
