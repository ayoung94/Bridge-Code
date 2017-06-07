package com.yedam.bridgecode.heart;

public class HeartVO {

	private String heart_to;
	private String heart_from_id;
	private String heart_status;
	private String heart_from_time;
	private String heart_confirm_time;
	private String heart_to_id;
	public String getHeart_to() {
		return heart_to;
	}
	@Override
	public String toString() {
		return "HeartVO [heart_to=" + heart_to + ", heart_from_id="
				+ heart_from_id + ", heart_status=" + heart_status
				+ ", heart_from_time=" + heart_from_time
				+ ", heart_confirm_time=" + heart_confirm_time
				+ ", heart_to_id=" + heart_to_id + "]";
	}
	public void setHeart_to(String heart_to) {
		this.heart_to = heart_to;
	}
	public String getHeart_from_id() {
		return heart_from_id;
	}
	public void setHeart_from_id(String heart_from_id) {
		this.heart_from_id = heart_from_id;
	}
	public String getHeart_status() {
		return heart_status;
	}
	public void setHeart_status(String heart_status) {
		this.heart_status = heart_status;
	}
	public String getHeart_from_time() {
		return heart_from_time;
	}
	public void setHeart_from_time(String heart_from_time) {
		this.heart_from_time = heart_from_time;
	}
	public String getHeart_confirm_time() {
		return heart_confirm_time;
	}
	public void setHeart_confirm_time(String heart_confirm_time) {
		this.heart_confirm_time = heart_confirm_time;
	}
	public String getHeart_to_id() {
		return heart_to_id;
	}
	public void setHeart_to_id(String heart_to_id) {
		this.heart_to_id = heart_to_id;
	}
	
	
	
}
