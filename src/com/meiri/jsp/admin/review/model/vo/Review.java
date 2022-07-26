package com.meiri.jsp.admin.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int rno;
	private String rcontent;
	private Date rdate;
	private int rstar;
	private String userid;
	private int pno;
	private int fno;
	
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int rno, String rcontent, Date rdate, int rstar, String userid, int pno, int fno) {
		super();
		this.rno = rno;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rstar = rstar;
		this.userid = userid;
		this.pno = pno;
		this.fno = fno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getRstar() {
		return rstar;
	}

	public void setRstar(int rstar) {
		this.rstar = rstar;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	
}
