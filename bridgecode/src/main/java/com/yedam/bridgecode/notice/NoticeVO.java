package com.yedam.bridgecode.notice;

import java.sql.Date;

public class NoticeVO {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeTime;
	
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeTime() {
		return noticeTime;
	}
	public void setNoticeTime(Date noticeTime) {
		this.noticeTime = noticeTime;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeId=" + noticeId + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + "]";
	}
	
	
}