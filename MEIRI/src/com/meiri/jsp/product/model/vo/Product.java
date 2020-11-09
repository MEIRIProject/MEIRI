package com.meiri.jsp.product.model.vo;

import java.io.Serializable;

public class Product implements Serializable{

	private static final long serialVersionUID = 777L;
	
	private int pcode;
	private String pname;
	private int price;
	private String ptypea;
	private String ptypeb;
	private String ptypec;
	private String pcolor;
	private String ptitle;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int pcode, String pname, int price, String ptypea, String ptypeb, String ptypec, String pcolor,
			String ptitle) {
		super();
		this.pcode = pcode;
		this.pname = pname;
		this.price = price;
		this.ptypea = ptypea;
		this.ptypeb = ptypeb;
		this.ptypec = ptypec;
		this.pcolor = pcolor;
		this.ptitle = ptitle;
	}

	@Override
	public String toString() {
		return "Product [pcode=" + pcode + ", pname=" + pname + ", price=" + price + ", ptypea=" + ptypea + ", ptypeb="
				+ ptypeb + ", ptypec=" + ptypec + ", pcolor=" + pcolor + ", ptitle=" + ptitle + "]";
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	
	
	
	
	
	
	
	
}
