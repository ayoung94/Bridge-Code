package com.yedam.bridgecode.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("eventService")
public class EventServiceImpl implements EventService{

	//DAO
	@Autowired
	private EventMapper eventDAO;

	public void insertEvent(EventVO vo){
		eventDAO.insertEvent(vo);
	}
	public void updateEvent(EventVO vo){
		eventDAO.updateEvent(vo);
	}
	public void deleteEvent(EventVO vo){
		eventDAO.deleteEvent(vo);
	}
	public EventVO getEvent(EventVO vo){
		return eventDAO.getEvent(vo);
	}
	/*public List<Map<String, Object>>getEventList(EventVO vo){
		return eventDAO.getEventList(vo);
	}*/
	public List<EventVO> getEventList(EventVO vo){
		return eventDAO.getEventList();
	}
	public void updateCnt(EventVO vo){
		eventDAO.updateCnt(vo);
	}









}
