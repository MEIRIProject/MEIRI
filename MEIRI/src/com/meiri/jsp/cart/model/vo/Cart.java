package com.meiri.jsp.cart.model.vo;

import java.io.Serializable;

public class Cart implements Serializable {
	   
	private static final long serialVersionUID = 1004L;
	
	private int cartcode;
	private String userid;
	private int pcode;
	private int fcode;
	private int quantity;
	
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartcode, String userid, int pcode, int fcode, int quantity) {
		super();
		this.cartcode = cartcode;
		this.userid = userid;
		this.pcode = pcode;
		this.fcode = fcode;
		this.quantity = quantity;
	}
	

	public int getCartcode() {
		return cartcode;
	}

	public void setCartcode(int cartcode) {
		this.cartcode = cartcode;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getFcode() {
		return fcode;
	}

	public void setFcode(int fcode) {
		this.fcode = fcode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
