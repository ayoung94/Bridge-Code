package com.yedam.bridgecode.warning;

import java.util.List;

import com.yedam.bridgecode.member.MemberVO;

public interface WarningService {
	public WarningVO getWarningSel(WarningVO vo);
	public void updateWarningApplication(WarningVO vo);
	public void updateWarningReject(WarningVO vo);
	public int countWarning(WarningVO vo);
	public List<WarningVO> selChatContext(WarningVO vo);
}
