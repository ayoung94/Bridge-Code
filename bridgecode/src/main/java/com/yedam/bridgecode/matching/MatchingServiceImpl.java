package com.yedam.bridgecode.matching;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MatchingService")
public class MatchingServiceImpl implements MatchingService{

	// DAO호출 하는 부분
	
	@Autowired
	private MatchingMapper MatchingDAO; 
	
	@Override
	public List<Map<String, Object>> getCodeList(CodeVO vo) {
		return MatchingDAO.getCodeList(vo);
	}

}
