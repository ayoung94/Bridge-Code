package com.yedam.bridgecode.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	//DAO
	@Autowired
	private NoticeMapper noticeDAO;

	public void insertNotice(NoticeVO vo){
		noticeDAO.insertNotice(vo);
	}
	public void updateNotice(NoticeVO vo){
		noticeDAO.updateNotice(vo);
	}
	public void deleteNotice(NoticeVO vo){
		noticeDAO.deleteNotice(vo);
	}
	public NoticeVO getNotice(NoticeVO vo){
		return noticeDAO.getNotice(vo);
	}
	/*public List<Map<String, Object>>getNoticeList(NoticeVO vo){
		return noticeDAO.getNoticeList(vo);
	}*/
	public List<NoticeVO> getNoticeList(NoticeVO vo){
		return noticeDAO.getNoticeList();
	}
	public void updateCnt(NoticeVO vo){
		noticeDAO.updateCnt(vo);
	}









}
