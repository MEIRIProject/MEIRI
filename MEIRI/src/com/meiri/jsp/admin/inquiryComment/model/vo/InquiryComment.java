package com.meiri.jsp.admin.inquiryComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class InquiryComment implements Serializable {

	private static final long serialVersionUID = 1001L;

	private int cno;		// ACODE
	private String userId;  // ADMINID
	private int inqno;		// CCODE
	private String ccontent;// ACONTENT
	private Date cdate;		// NDATE
	
	public InquiryComment() {
		super();
	}


	public InquiryComment(int cno, String userId, int inqno, String ccontent, Date cdate) {
		super();
		this.cno = cno;
		this.userId = userId;
		this.inqno = inqno;
		this.ccontent = ccontent;
		this.cdate = cdate;
	}




	public InquiryComment(int inqno, String ccontent, String userId) {
		super();
		this.inqno = inqno;
		this.ccontent = ccontent;
		this.userId = userId;
	}

	
	@Override
	public String toString() {
		return "InquiryComment [inqno=" + inqno + ", userId=" + userId + ", cno=" + cno + ", ccontent=" + ccontent
				+ ", cdate=" + cdate + "]";
	}

	public int getInqno() {
		return inqno;
	}
	public void setInqno(int inqno) {
		this.inqno = inqno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	
}
