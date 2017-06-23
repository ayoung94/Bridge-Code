package com.yedam.bridgecode.home;

import java.util.List;
import java.util.Map;

import com.yedam.bridgecode.member.MemberVO;

public interface HomeService {
	public List<Map<String,Object>> bestMemberMonthList(MemberVO vo);
	public List<Map<String,Object>> bestMemberWeekList(MemberVO vo);
	public List<Map<String,Object>> bestMemberAllList(MemberVO vo);
}
