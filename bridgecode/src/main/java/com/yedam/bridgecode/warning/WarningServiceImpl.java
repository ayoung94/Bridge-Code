package com.yedam.bridgecode.warning;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
	public void updateWarningApplicationMember(WarningVO vo) {
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

	@Override
	public int countWarning(WarningVO vo) {
		int count = 0;
		count = warningDAO.countWarning(vo);
		return count;
	}

	@Override
	public List<WarningVO> selChatContext(WarningVO vo) {
		return warningDAO.selChatContext(vo);
	}

}
