package com.yedam.bridgecode.code;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("CodeService")
public class CodeServiceImpl implements CodeService{

	// DAO호출 하는 부분
	
	@Autowired
	private CodeMapper CodeDAO; 
	
	@Override
	public List<Map<String, Object>> getCodeList(CodeVO vo) {
		return CodeDAO.getCodeList(vo);
	}

}
