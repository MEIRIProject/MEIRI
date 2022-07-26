package com.meiri.jsp.admin.product.model.vo;

import java.io.Serializable;

public class ProductFile implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int fcode;
	private int pcode;
	private String originname;
	private String changename;
	private String filepath;
	private int flevel;
	
	
	public ProductFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductFile(int fcode, int pcode, String originname, String changename, String filepath, int flevel) {
		super();
		this.fcode = fcode;
		this.pcode = pcode;
		this.originname = originname;
		this.changename = changename;
		this.filepath = filepath;
		this.flevel = flevel;
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

	public int getFlevel() {
		return flevel;
	}

	public void setFlevel(int flevel) {
		this.flevel = flevel;
	}
	
	
}
