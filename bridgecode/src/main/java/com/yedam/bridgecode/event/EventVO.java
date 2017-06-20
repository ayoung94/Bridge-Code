package com.yedam.bridgecode.event;

import java.sql.Date;

public class EventVO {
	private int eventId;
	private String eventTitle;
	private String eventContent;
	private Date eventTime;
	private int eventCnt;
	
	
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public Date getEventTime() {
		return eventTime;
	}
	public void setEventTime(Date eventTime) {
		this.eventTime = eventTime;
	}
	public int getEventCnt() {
		return eventCnt;
	}
	public void setEventCnt(int eventCnt) {
		this.eventCnt = eventCnt;
	}
	@Override
	public String toString() {
		return "EventVO [eventId=" + eventId + ", eventTitle="
				+ eventTitle + ", eventContent=" + eventContent
				+ ", eventTime=" + eventTime + ", eventCnt=" + eventCnt
				+ "]";
	}
}