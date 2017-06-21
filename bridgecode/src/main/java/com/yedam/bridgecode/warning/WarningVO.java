package com.yedam.bridgecode.warning;

import java.sql.Date;

public class WarningVO {

	private String warningId;
	private String warningToId;
	private String warningReturn;
	private String warningReason;
	private Date warningTime;
	private String warningFromId;
	private String warningStatus;
	private String memberWarning;
	private String chatContent;
	private String chatFromId;
	private String chatToId;
	private String chatTime;


	public String getMemberWarning() {
		return memberWarning;
	}
	public void setMemberWarning(String memberWarning) {
		this.memberWarning = memberWarning;
	}
	public String getWarningId() {
		return warningId;
	}
	public void setWarningId(String warningId) {
		this.warningId = warningId;
	}
	public String getWarningToId() {
		return warningToId;
	}
	public void setWarningToId(String warningToId) {
		this.warningToId = warningToId;
	}
	public String getWarningReturn() {
		return warningReturn;
	}
	public void setWarningReturn(String warningReturn) {
		this.warningReturn = warningReturn;
	}
	public String getWarningReason() {
		return warningReason;
	}
	public void setWarningReason(String warningReason) {
		this.warningReason = warningReason;
	}
	public Date getWarningTime() {
		return warningTime;
	}
	public void setWarningTime(Date warningTime) {
		this.warningTime = warningTime;
	}
	public String getWarningFromId() {
		return warningFromId;
	}
	public void setWarningFromId(String warningFromId) {
		this.warningFromId = warningFromId;
	}
	public String getWarningStatus() {
		return warningStatus;
	}
	public void setWarningStatus(String warningStatus) {
		this.warningStatus = warningStatus;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatFromId() {
		return chatFromId;
	}
	public void setChatFromId(String chatFromId) {
		this.chatFromId = chatFromId;
	}
	public String getChatToId() {
		return chatToId;
	}
	public void setChatToId(String chatToId) {
		this.chatToId = chatToId;
	}
	public String getChatTime() {
		return chatTime;
	}
	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}
	@Override
	public String toString() {
		return "WarningVO [warningId=" + warningId + ", warningToId="
				+ warningToId + ", warningReturn=" + warningReturn
				+ ", warningReason=" + warningReason + ", warningTime="
				+ warningTime + ", warningFromId=" + warningFromId
				+ ", warningStatus=" + warningStatus + ", memberWarning="
				+ memberWarning + ", chatContent=" + chatContent
				+ ", chatFromId=" + chatFromId + ", chatToId=" + chatToId
				+ ", chatTime=" + chatTime + "]";
	}
}