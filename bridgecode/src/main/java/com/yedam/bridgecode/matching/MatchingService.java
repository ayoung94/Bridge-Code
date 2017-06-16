package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

import com.yedam.bridgecode.member.MemberVO;

public interface MatchingService {

	//관심사 리스트 출력
	public List<Map<String,Object>> getCodeList(CodeVO vo);
	
	//서브 프로필 사진 추가 
	public void profileUpdate(MemberVO vo);
	
	//자기 소개 수정
	public void introductionUpdate(MemberVO vo);
}
