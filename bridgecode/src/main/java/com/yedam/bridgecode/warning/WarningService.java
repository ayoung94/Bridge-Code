package com.yedam.bridgecode.warning;

import com.yedam.bridgecode.member.MemberVO;

public interface WarningService {
	public WarningVO getWarningSel(WarningVO vo);
	public void updateWarningApplicationMember(MemberVO vo);
	public void updateWarningApplicationWarning(WarningVO vo);
	public void updateWarningReject(WarningVO vo);
}
