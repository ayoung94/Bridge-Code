package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface MatchingMapper {
	public List<Map<String, Object>> getCodeList(CodeVO vo);
}
