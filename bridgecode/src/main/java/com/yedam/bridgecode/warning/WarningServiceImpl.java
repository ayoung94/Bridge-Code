package com.yedam.bridgecode.warning;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.bridgecode.member.MemberVO;

@Service("warningService")
public class WarningServiceImpl implements WarningService{

	//DAO를 호출하는 부분
	@Autowired
	private WarningMapper warningDAO;
	
	@Override
	public WarningVO getWarningSel(WarningVO vo) {
		return warningDAO.getWarningSel(vo);
	}

	@Override
	public void updateWarningApplicationMember(MemberVO vo) {
		warningDAO.updateWarningApplicationMember(vo);
	}

	@Override
	public void updateWarningReject(WarningVO vo) {
		warningDAO.updateWarningReject(vo);
	}

	@Override
	public void updateWarningApplicationWarning(WarningVO vo) {
		warningDAO.updateWarningApplicationWarning(vo);
		
	}

}
