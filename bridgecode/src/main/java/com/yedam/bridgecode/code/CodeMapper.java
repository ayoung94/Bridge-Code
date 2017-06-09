package com.yedam.bridgecode.code;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface CodeMapper {
	public List<Map<String, Object>> getCodeList(CodeVO vo);
}
