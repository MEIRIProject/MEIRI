package com.meiri.jsp.admin.review.model.vo;

import java.io.Serializable;

public class Attachment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int fcode;
	private int pcode;
	private String originname;
	private String changename;
	private String filepath;
	
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Attachment(int fcode, int pcode, String originname, String changename, String filepath) {
		super();
		this.fcode = fcode;
		this.pcode = pcode;
		this.originname = originname;
		this.changename = changename;
		this.filepath = filepath;
	}


	public Attachment(String originname, String changename, String filepath) {
		super();
		this.originname = originname;
		this.changename = changename;
		this.filepath = filepath;
	}


	public int getFcode() {
		return fcode;
	}


	public void setFcode(int fcode) {
		this.fcode = fcode;
	}


	public int getPcode() {
		return pcode;
	}


	public void setPcode(int pcode) {
		this.pcode = pcode;
	}


	public String getOriginname() {
		return originname;
	}


	public void setOriginname(String originname) {
		this.originname = originname;
	}


	public String getChangename() {
		return changename;
	}


	public void setChangename(String changename) {
		this.changename = changename;
	}


	public String getFilepath() {
		return filepath;
	}


	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	
}
