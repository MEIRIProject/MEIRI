package com.meiri.jsp.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable{
	
	private static final long serialVersionUID = 7776L;

	
	private int ordercode;
	private int pcode;
	private Date orderdate;
	private int quantity;
	private String userid;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int ordercode, int pcode, Date orderdate, int quantity, String userid) {
		super();
		this.ordercode = ordercode;
		this.pcode = pcode;
		this.orderdate = orderdate;
		this.quantity = quantity;
		this.userid = userid;
	}


	public Order(int pcode, int quantity ,String userid) {
		super();
		this.pcode = pcode;
		this.quantity = quantity;
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Order [ordercode=" + ordercode + ", pcode=" + pcode + ", orderdate=" + orderdate + ", quantity="
				+ quantity + ", userid=" + userid + "]";
	}

	public int getOrdercode() {
		return ordercode;
	}

	public void setOrdercode(int ordercode) {
		this.ordercode = ordercode;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
	
	
}
