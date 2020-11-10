package com.meiri.jsp.order.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.meiri.jsp.order.model.vo.Order;
import com.meiri.jsp.product.model.dao.ProductDAO;

import static com.meiri.jsp.common.JDBCTemplate.*;

public class OrderDAO {

	private Properties prop;
		
		public OrderDAO() {
			prop = new Properties();
			String filePath = OrderDAO.class
			  					.getResource("/config/order-sql.properties")
			  					.getPath(); 
	
			try {
				prop.load(new FileReader(filePath));
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  
	}
		
		public int insertOrder(Connection con, Order order) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String sql = prop.getProperty("insertOrder");
			
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1,  order.getPcode());
				pstmt.setInt(2, order.getQuantity());
				pstmt.setString(3, order.getUserid());
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			System.out.println(result);
		
			return result;
	}

}
