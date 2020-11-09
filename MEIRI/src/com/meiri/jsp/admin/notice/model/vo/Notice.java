package com.meiri.jsp.admin.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int nno;		// NCODE
	String adminid;
	String ntitle;
	Date ndate;
	String ncontent;
	
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Notice(int nno, String adminid, String ntitle, Date ndate, String ncontent) {
		super();
		this.nno = nno;
		this.adminid = adminid;
		this.ntitle = ntitle;
		this.ndate = ndate;
		this.ncontent = ncontent;
	}


	public Notice(String adminid, String ntitle, String ncontent) {
		super();
		this.adminid = adminid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
	}


	public int getNno() {
		return nno;
	}


	public void setNno(int nno) {
		this.nno = nno;
	}


	public String getAdminid() {
		return adminid;
	}


	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}


	public String getNtitle() {
		return ntitle;
	}


	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}


	public Date getNdate() {
		return ndate;
	}


	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}


	public String getNcontent() {
		return ncontent;
	}


	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
}
