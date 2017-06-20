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
	
	//전체 매칭리스트
	@Override
	public List<Map<String, Object>> getMemberList(MemberVO vo) {
		return MatchingDAO.getMemberList(vo);
	}

}
