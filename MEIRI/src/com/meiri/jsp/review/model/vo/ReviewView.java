package com.meiri.jsp.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReviewView implements Serializable{
	private static final long esralVersionUID = 777777L;
	
	
	private String userid;
	private String rcontent;
	private Date rdate;
	private int pcode;
	private String changename;
	
	public ReviewView() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewView(String userid, String rcontent, Date rdate, int pcode, String changename) {
		super();
		this.userid = userid;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.pcode = pcode;
		this.changename = changename;
	}
	@Override
	public String toString() {
		return "ReviewView [userid=" + userid + ", rcontent=" + rcontent + ", rdate=" + rdate + ", pcode=" + pcode
				+ ", changename=" + changename + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getChangename() {
		return changename;
	}
	public void setChangename(String changename) {
		this.changename = changename;
	}
	
	
	
}
