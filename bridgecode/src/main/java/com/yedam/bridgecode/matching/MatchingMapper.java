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
}
