package com.meiri.jsp.product.model.vo;

import java.io.Serializable;

public class ProductView implements Serializable{
	
	private static final long esralVersionUID = 77777L;

	private int pcode;
	private String pname;
	private String ptitle;
	private String changename;
	
	public ProductView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductView(int pcode, String pname, String ptitle, String changename) {
		super();
		this.pcode = pcode;
		this.pname = pname;
		this.ptitle = ptitle;
		this.changename = changename;
	}

	@Override
	public String toString() {
		return "ProductView [pcode=" + pcode + ", pname=" + pname + ", ptitle=" + ptitle + ", changename=" + changename
				+ "]";
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}
	
	
	
	
	

}
