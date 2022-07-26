package com.meiri.jsp.admin.product.model.vo;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int pno;
	private String pname;
	private String ptitle;
	private int pprice;
	private String ptypea;
	private String ptypeb;
	private String ptypec;
	private String pcolor;
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Product(int pno, String pname, String ptitle, int pprice, String ptypea, String ptypeb, String ptypec,
			String pcolor) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.ptitle = ptitle;
		this.pprice = pprice;
		this.ptypea = ptypea;
		this.ptypeb = ptypeb;
		this.ptypec = ptypec;
		this.pcolor = pcolor;
	}


	public int getPno() {
		return pno;
	}


	public void setPno(int pno) {
		this.pno = pno;
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


	public int getPprice() {
		return pprice;
	}


	public void setPprice(int pprice) {
		this.pprice = pprice;
	}


	public String getPtypea() {
		return ptypea;
	}


	public void setPtypea(String ptypea) {
		this.ptypea = ptypea;
	}


	public String getPtypeb() {
		return ptypeb;
	}


	public void setPtypeb(String ptypeb) {
		this.ptypeb = ptypeb;
	}


	public String getPtypec() {
		return ptypec;
	}


	public void setPtypec(String ptypec) {
		this.ptypec = ptypec;
	}


	public String getPcolor() {
		return pcolor;
	}


	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	
	
	
}
