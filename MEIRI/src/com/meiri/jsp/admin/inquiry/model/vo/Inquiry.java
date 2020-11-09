package com.meiri.jsp.admin.inquiry.model.vo;

import java.io.Serializable;

public class Inquiry implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	private int inqno;			// CCODE
	private String inqwriter;	// USERID
	private String inqanswer;	// ADMINID
	private String inqtitle;	// CTITLE
	private String inqcontent;	// CCONTENT
	
	
	public Inquiry() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Inquiry(int inqno, String inqwriter, String inqanswer, String inqtitle, String inqcontent) {
		super();
		this.inqno = inqno;
		this.inqwriter = inqwriter;
		this.inqanswer = inqanswer;
		this.inqtitle = inqtitle;
		this.inqcontent = inqcontent;
	}


	public int getInqno() {
		return inqno;
	}


	public void setInqno(int inqno) {
		this.inqno = inqno;
	}


	public String getInqwriter() {
		return inqwriter;
	}


	public void setInqwriter(String inqwriter) {
		this.inqwriter = inqwriter;
	}


	public String getInqanswer() {
		return inqanswer;
	}


	public void setInqanswer(String inqanswer) {
		this.inqanswer = inqanswer;
	}


	public String getInqtitle() {
		return inqtitle;
	}


	public void setInqtitle(String inqtitle) {
		this.inqtitle = inqtitle;
	}


	public String getInqcontent() {
		return inqcontent;
	}


	public void setInqcontent(String inqcontent) {
		this.inqcontent = inqcontent;
	}
	
	
	
	
	
	

}
