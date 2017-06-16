package com.yedam.bridgecode.notice;

import java.util.List;

public interface NoticeService {
	public void insertNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public NoticeVO getNotice(NoticeVO vo);
	//public List<Map<String, Object>>getNoticeList(NoticeVO vo);
	public List<NoticeVO> getNoticeList(NoticeVO vo);
	public void updateCnt(NoticeVO vo);
}