package com.yedam.bridgecode.matching;

public class CodeVO {

	private String code_id;
	private String code_name;
	private String code_category;
	
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getCode_category() {
		return code_category;
	}
	public void setCode_category(String code_categori) {
		this.code_category = code_categori;
	}
	@Override
	public String toString() {
		return "CodeVO [code_id=" + code_id + ", code_name=" + code_name
				+ ", code_category=" + code_category + "]";
	}
	
	
}
