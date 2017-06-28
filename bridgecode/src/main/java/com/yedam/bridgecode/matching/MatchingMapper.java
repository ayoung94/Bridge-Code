package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;

@MapperScan
public interface MatchingMapper {
	public List<Map<String, Object>> getCodeList(CodeVO vo);
	
	//서브 프로필 사진추가
	public void profileUpdate(MemberVO vo);
	
	//자기 소개 수정
	public void introductionUpdate(MemberVO vo);
	
	//매칭 리스트(페이지 로딩후 기본 검색조건)
	public List<Map<String, Object>> getMemberList(Map<String, Object> map);
	
	// 실시간 ajax 조건검색  
	public List<Map<String, Object>> realMatchingList(Map<String,Object> map);
	
	//이성 멤버 리스트
	public List<Map<String,Object>> searchGenderList(MemberVO vo);
	
	//이성 멤버 리스트(ajax)
	public List<Map<String,Object>> ajaxsearchGenderList(MemberVO vo);
	
	//전체 멤버 리스트
	public List<Map<String,Object>> allmemberList(MemberVO vo);
	
	//전체 멤버 리스트
	public List<Map<String,Object>> ajaxallmemberList(MemberVO vo);
	
}
