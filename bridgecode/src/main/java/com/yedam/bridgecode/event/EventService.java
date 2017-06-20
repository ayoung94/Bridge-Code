package com.yedam.bridgecode.event;

import java.util.List;

public interface EventService {
	public void insertEvent(EventVO vo);
	public void updateEvent(EventVO vo);
	public void deleteEvent(EventVO vo);
	public EventVO getEvent(EventVO vo);
	//public List<Map<String, Object>>getEventList(EventVO vo);
	public List<EventVO> getEventList(EventVO vo);
	public void updateCnt(EventVO vo);
}