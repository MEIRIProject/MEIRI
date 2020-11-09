package com.meiri.jsp.inquiryComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class inquiryComment implements Serializable {

	private static final long serialVersionUID = 1001L;
	
	private int acode;
	private String adminId;
	private int cCode;
	private String aContent;
	private Date date;
	
	public inquiryComment() {
		super();
	}

	@Override
	public String toString() {
		return "inquiryComment [acode=" + acode + ", adminId=" + adminId + ", cCode=" + cCode + ", aContent=" + aContent
				+ ", date=" + date + "]";
	}

	public inquiryComment(int acode, String adminId, int cCode, String aContent, Date date) {
		super();
		this.acode = acode;
		this.adminId = adminId;
		this.cCode = cCode;
		this.aContent = aContent;
		this.date = date;
	}

	public int getAcode() {
		return acode;
	}

	public void setAcode(int acode) {
		this.acode = acode;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
