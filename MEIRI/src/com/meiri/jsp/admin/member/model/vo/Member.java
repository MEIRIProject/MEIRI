package com.meiri.jsp.admin.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String userid;
	private String password;
	private String name;		// USERNAME
	private String address;
	private String email;
	private int birth;
	private String phone;
	
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Member(String userid, String password, String name, String address, String email, int birth, String phone) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.address = address;
		this.email = email;
		this.birth = birth;
		this.phone = phone;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getBirth() {
		return birth;
	}


	public void setBirth(int birth) {
		this.birth = birth;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
}
