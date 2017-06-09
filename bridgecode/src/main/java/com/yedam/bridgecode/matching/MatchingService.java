package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

public interface MatchingService {

	public List<Map<String,Object>> getCodeList(CodeVO vo);
}
