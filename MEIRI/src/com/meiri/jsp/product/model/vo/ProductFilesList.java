package com.meiri.jsp.product.model.vo;

import java.io.Serializable;

public class ProductFilesList implements Serializable {

	private static final long esralVersionUID = 7777L;
	
	private int fcode;
	private int pcode;
	private String filepath;
	private String originname;
	private String changename;
	private int flevel;
	
	public ProductFilesList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductFilesList(int fcode, int pcode, String filepath, String originname, String changename, int flevel) {
		super();
		this.fcode = fcode;
		this.pcode = pcode;
		this.filepath = filepath;
		this.originname = originname;
		this.changename = changename;
		this.flevel = flevel;
	}

	@Override
	public String toString() {
		return "ProductFilesList [fcode=" + fcode + ", pcode=" + pcode + ", filepath=" + filepath + ", originname="
				+ originname + ", changename=" + changename + ", flevel=" + flevel + "]";
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

	public int getFlevel() {
		return flevel;
	}

	public void setFlevel(int flevel) {
		this.flevel = flevel;
	}
	
	
	
	
	
}
