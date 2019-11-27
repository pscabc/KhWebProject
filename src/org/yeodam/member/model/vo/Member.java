package org.yeodam.member.model.vo;

import java.sql.Date;

public class Member {
	private int rnum;
	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberAge;
	private String phone;
	private String email;
	private Date enrollDate;
	private String filename;
	private String filepath;
	private String gender;
	private String intro;


	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int rnum, String memberId, String memberPw, String memberName, int memberAge, String phone,
			String email, Date enrollDate, String filename, String filepath, String gender, String intro) {
		super();
		this.rnum = rnum;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAge = memberAge;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.filename = filename;
		this.filepath = filepath;
		this.gender = gender;
		this.intro = intro;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getMemberAge() {
		return memberAge;
	}
	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
}