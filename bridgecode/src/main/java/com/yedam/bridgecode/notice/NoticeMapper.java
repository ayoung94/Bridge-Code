package com.yedam.bridgecode.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

@Repository	//DAO 빈 등록
@MapperScan("noticeDAO")
public interface NoticeMapper {
	public void insertNotice(NoticeVO vo);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(NoticeVO vo);
	public NoticeVO getNotice(NoticeVO vo);
	//public List<NoticeVO> getNoticeList(NoticeVO vo);
	public List<NoticeVO> getNoticeList();
	//부서별 인원수 차트에 뿌릴 때 사용
	//public List<Map<String, Object>> getNoticeCount();
	
}
