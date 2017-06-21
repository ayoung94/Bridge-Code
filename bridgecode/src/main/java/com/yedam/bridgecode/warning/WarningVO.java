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
	
	@Override
	public String toString() {
		return "WarningVO [warningId=" + warningId + ", warningToId="
				+ warningToId + ", warningReturn=" + warningReturn
				+ ", warningReason=" + warningReason + ", warningTime="
				+ warningTime + ", warningFromId=" + warningFromId
				+ ", warningStatus=" + warningStatus + "]";
	}
}