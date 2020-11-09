package com.meiri.jsp.inquiry.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meiri.jsp.inquiry.model.vo.inquiry;

import static com.meiri.jsp.common.JDBCTemplate.*; 

public class inquiryDAO {

	private Properties prop;
	
	public inquiryDAO() {
		prop = new Properties();
		
		String filePath = inquiryDAO.class
								  .getResource("/config/inquiry-sql.properties")
				                  .getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int getListCount(Connection con) {
		int result = 0; 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<inquiry> selectList(Connection con, int currentPage, int limit) {
		ArrayList<inquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				inquiry b = new inquiry();
				
				b.setcCode(     rset.getInt("cCode"));
				b.setUserId(    rset.getString("userId"));
				b.setAdminId(   rset.getString("adminId"));
				b.setcTitle( 	rset.getString("cTitle"));
				b.setcContent(  rset.getString("cContent"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}

	public int insertBoard(Connection con, inquiry b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, b.getcCode());
			pstmt.setString(2, b.getUserId());
			pstmt.setString(3, b.getAdminId());
			pstmt.setString(4, b.getcTitle());
			pstmt.setString(5, b.getcContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public inquiry selectOne(Connection con, int bno) {
		inquiry b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				b = new inquiry();
				
				b.setcCode(rset.getInt("cCode"));
				b.setUserId(rset.getString("userId"));
				b.setAdminId(rset.getString("adminId"));
				b.setcTitle(rset.getString("cTitle"));
				b.setcContent(rset.getString("cContent"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return b;
	}

	public int updateBoard(Connection con, inquiry b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,  b.getcTitle());
			pstmt.setString(2,  b.getcContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int deleteBoard(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
				
		return result;
	}
	
}



