package com.meiri.jsp.product.model.vo;

import java.io.Serializable;

public class Product implements Serializable{

	private static final long serialVersionUID = 777L;
	
	private int pcode;
	private String pname;
	private int price;
	private String ptype;
	private String pcolor;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int pcode, String pname, int price, String ptype, String pcolor) {
		super();
		this.pcode = pcode;
		this.pname = pname;
		this.price = price;
		this.ptype = ptype;
		this.pcolor = pcolor;
	}

	@Override
	public String toString() {
		return "Product [pcode=" + pcode + ", pname=" + pname + ", price=" + price + ", ptype=" + ptype + ", pcolor="
				+ pcolor + "]";
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

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	
	
	
	
	
	
}
