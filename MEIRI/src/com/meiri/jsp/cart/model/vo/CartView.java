package com.meiri.jsp.cart.model.vo;

import java.io.Serializable;

public class CartView implements Serializable {
	   
	private static final long serialVersionUID = 1004L;
	
	private int pcode;
	private int cartcode;
	private String changename;
	private String pname;
	private String ptitle;
	private int pprice;
	private int quantity;
	
	
	public CartView() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartView(int pcode, int cartcode, String changename, String pname, String ptitle, int pprice, int quantity) {
		super();
		this.pcode = pcode;
		this.cartcode = cartcode;
		this.changename = changename;
		this.pname = pname;
		this.ptitle = ptitle;
		this.pprice = pprice;
		this.quantity = quantity;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getCartcode() {
		return cartcode;
	}

	public void setCartcode(int cartcode) {
		this.cartcode = cartcode;
	}

	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	
	
	
}
