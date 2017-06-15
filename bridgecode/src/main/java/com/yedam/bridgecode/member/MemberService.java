package com.yedam.bridgecode.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public void insertMember(MemberVO vo);
	public void updateMember(MemberVO vo);
	public void updateRejectMember(MemberVO vo);
	public void updateLastConnection(MemberVO vo);
	public void deleteMember(MemberVO vo);
	public MemberVO getMember(MemberVO vo);
	public MemberVO login(MemberVO vo); 
	public List<Map<String,Object>> getMemberList();
	public List<Map<String,Object>> getNewMemberList(); 
	public List<Map<String,Object>> getBestMemberList(MemberVO vo);
	public List<MemberVO> getMemberListVO(MemberVO vo);
	//user-mapper.xml의 내용 확인해서 return값, 클래스 이름 같게하기.
}
