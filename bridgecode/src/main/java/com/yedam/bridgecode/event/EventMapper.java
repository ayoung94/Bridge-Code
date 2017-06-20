package com.yedam.bridgecode.event;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

@Repository	//DAO 빈 등록
@MapperScan("eventDAO")
public interface EventMapper {
	public void insertEvent(EventVO vo);
	public void updateEvent(EventVO vo);
	public void deleteEvent(EventVO vo);
	public EventVO getEvent(EventVO vo);
	//public List<EventVO> getEventList(EventVO vo);
	public List<EventVO> getEventList();
	//부서별 인원수 차트에 뿌릴 때 사용
	//public List<Map<String, Object>> getEventCount();
	public void updateCnt(EventVO vo);
	
}
