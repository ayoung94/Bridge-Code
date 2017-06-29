package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

import com.yedam.bridgecode.member.MemberVO;

public interface MatchingService {

	//관심사 리스트 출력
	public List<Map<String,Object>> getCodeList(CodeVO vo);
	
	//매칭 리스트(페이지 로딩후 기본 검색조건)
	public List<Map<String,Object>> getMemberList(Map<String,Object> map);
	
	//서브 프로필 사진 추가 
	public void profileUpdate(MemberVO vo);
	
	//자기 소개 수정
	public void introductionUpdate(MemberVO vo);
	
	// 실시간 ajax 조건검색 
	public List<Map<String,Object>> realMatchingList(Map<String,Object> map);
	
	// 이성멤버 검색
	public List<Map<String,Object>> searchGenderList(MemberVO vo);
	
	//이성 멤버 리스트
	public List<Map<String,Object>> ajaxsearchGenderList(MemberVO vo);
	
	// 전체회원 검색
	public List<Map<String,Object>> allmemberList(MemberVO vo);
	
	// 전체회원 검색
	public List<Map<String,Object>> ajaxallmemberList(MemberVO vo);
	
	//직접 회원 검색하기
	public List<Map<String,Object>> searchMember(Map<String, Object> map);
}