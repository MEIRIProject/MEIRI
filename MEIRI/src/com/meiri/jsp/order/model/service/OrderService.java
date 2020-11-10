package com.meiri.jsp.order.model.service;

import static com.meiri.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.meiri.jsp.order.model.dao.OrderDAO;
import com.meiri.jsp.order.model.vo.Order;

public class OrderService {
	private Connection con;
	private OrderDAO oDAO = new OrderDAO();
	
	public int insertOrder(Order order) {
		con = getConnection();
		
		int result = new OrderDAO().insertOrder(con, order);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	
}
