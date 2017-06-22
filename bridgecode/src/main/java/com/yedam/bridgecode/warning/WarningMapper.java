package com.yedam.bridgecode.warning;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.yedam.bridgecode.member.MemberVO;

@MapperScan
public interface WarningMapper {
	public  List<WarningVO> getWarningList();
	public WarningVO getWarningSel(WarningVO vo);
	public void updateWarningApplicationMember(WarningVO vo);
	public void updateWarningApplicationWarning(WarningVO vo);
	public void updateWarningReject(WarningVO vo);
	public int countWarning(WarningVO vo);
	public List<WarningVO> selChatContext(WarningVO vo);
}
