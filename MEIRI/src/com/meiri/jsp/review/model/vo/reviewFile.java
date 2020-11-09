package com.meiri.jsp.review.model.vo;

import java.io.Serializable;

public class reviewFile implements Serializable {

	private static final long serialVersionUID = 777L;
	
	private int fcode;
	private int rcode;
	private String filepath;
	private String originname;
	private String changename;
	
	public reviewFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public reviewFile(int fcode, int rcode, String filepath, String originname, String changename) {
		super();
		this.fcode = fcode;
		this.rcode = rcode;
		this.filepath = filepath;
		this.originname = originname;
		this.changename = changename;
	}

	@Override
	public String toString() {
		return "productFile [fcode=" + fcode + ", rcode=" + rcode + ", filepath=" + filepath + ", originname="
				+ originname + ", changename=" + changename + "]";
	}

	public int getFcode() {
		return fcode;
	}

	public void setFcode(int fcode) {
		this.fcode = fcode;
	}

	public int getRcode() {
		return rcode;
	}

	public void setRcode(int rcode) {
		this.rcode = rcode;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
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
	
	
	
	
}
