package com.yedam.bridgecode.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_password="
				+ member_password + ", member_name=" + member_name + "]";
	}
	private String member_img1;
	private String member_img2;
	private String member_img3;
	private String member_id;
	private String member_password;
	private String member_nickname;
	private String member_name;
	private String member_birth;
	private String member_last_connection;
	private String member_country;
	private String member_interest1;
	private String member_interest2;
	private String member_interest3;
	private MultipartFile member_profile_img;
	private String member_level;
	private String member_warning;
	private String member_sex;
	private String member_partner_id;
	private String member_introduction;
	
	
	public String getMember_img1() {
		return member_img1;
	}
	public void setMember_img1(String member_img1) {
		this.member_img1 = member_img1;
	}
	public String getMember_img2() {
		return member_img2;
	}
	public void setMember_img2(String member_img2) {
		this.member_img2 = member_img2;
	}
	public String getMember_img3() {
		return member_img3;
	}
	public void setMember_img3(String member_img3) {
		this.member_img3 = member_img3;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_last_connection() {
		return member_last_connection;
	}
	public void setMember_last_connection(String member_last_connection) {
		this.member_last_connection = member_last_connection;
	}
	public String getMember_country() {
		return member_country;
	}
	public void setMember_country(String member_country) {
		this.member_country = member_country;
	}
	public String getMember_interest1() {
		return member_interest1;
	}
	public void setMember_interest1(String member_interest1) {
		this.member_interest1 = member_interest1;
	}
	public String getMember_interest2() {
		return member_interest2;
	}
	public void setMember_interest2(String member_interest2) {
		this.member_interest2 = member_interest2;
	}
	public String getMember_interest3() {
		return member_interest3;
	}
	public void setMember_interest3(String member_interest3) {
		this.member_interest3 = member_interest3;
	}

	public MultipartFile getMember_profile_img() {
		return member_profile_img;
	}
	public void setMember_profile_img(MultipartFile member_profile_img) {
		this.member_profile_img = member_profile_img;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	public String getMember_warning() {
		return member_warning;
	}
	public void setMember_warning(String member_warning) {
		this.member_warning = member_warning;
	}
	public String getMember_sex() {
		return member_sex;
	}
	public void setMember_sex(String member_sex) {
		this.member_sex = member_sex;
	}
	public String getMember_partner_id() {
		return member_partner_id;
	}
	public void setMember_partner_id(String member_partner_id) {
		this.member_partner_id = member_partner_id;
	}
	public String getMember_introduction() {
		return member_introduction;
	}
	public void setMember_introduction(String member_introduction) {
		this.member_introduction = member_introduction;
	}

	
	
	
}
