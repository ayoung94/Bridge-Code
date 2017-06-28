package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.member.MemberVO;

@Service("MatchingService")
public class MatchingServiceImpl implements MatchingService{

	// DAO호출 하는 부분
	
	@Autowired
	private MatchingMapper MatchingDAO; 
	
	//관심사 리스트 출력
	@Override
	public List<Map<String, Object>> getCodeList(CodeVO vo) {
		return MatchingDAO.getCodeList(vo);
	}
	//서브 프로필 사진추가
	@Override
	public void profileUpdate(MemberVO vo) {
		MatchingDAO.profileUpdate(vo);
		
	}
	//자기 소개글 수정
	@Override
	public void introductionUpdate(MemberVO vo) {
		MatchingDAO.introductionUpdate(vo);
	}
	
	//매칭 리스트(페이지 로딩후 기본 검색조건)
	@Override
	public List<Map<String, Object>> getMemberList(Map<String, Object> map) {
		return MatchingDAO.getMemberList(map);
	}
	
	//실시간 조건 검색 리스트(ajax)
	@Override
	public List<Map<String, Object>> realMatchingList(Map<String, Object> map) {
		return MatchingDAO.realMatchingList(map);
	}

	//이성 멤버 리스트
	public List<Map<String,Object>> searchGenderList(MemberVO vo){
		return MatchingDAO.searchGenderList(vo);
	}
		
	//전체 멤버 리스트
	public List<Map<String,Object>> allmemberList(MemberVO vo){
		return MatchingDAO.allmemberList(vo);
	}
	//전체 멤버 리스트(ajax)
	@Override
	public List<Map<String, Object>> ajaxallmemberList(MemberVO vo) {
		return MatchingDAO.ajaxallmemberList(vo);
	}
	//이성 멤버 리스트(ajax)
	@Override
	public List<Map<String, Object>> ajaxsearchGenderList(MemberVO vo) {
		return MatchingDAO.ajaxsearchGenderList(vo);
	}
	
}
