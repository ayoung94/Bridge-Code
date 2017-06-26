package com.yedam.bridgecode.chart;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yedam.bridgecode.member.MemberVO;

@Repository
public interface ChartMapper {
	public List<Map<String, Object>> sexRatio(MemberVO vo);
	public List<Map<String, Object>> countryRatio(MemberVO vo);
}
