package com.meiri.jsp.admin.inquiry.model.dao;

import static com.meiri.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meiri.jsp.admin.inquiry.model.vo.Inquiry;

public class InquiryDAO {
	
	private Properties prop;
	
	public InquiryDAO() {
		prop = new Properties();
		
		String filePath = InquiryDAO.class
								  .getResource("/config/inquiry-sql.properties")
				                  .getPath(); // DB 완성 후 작성
		
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
		
		// 이거 DB 완성 후 작성
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

	public ArrayList<Inquiry> selectList(Connection con, int currentPage, int limit) {
		ArrayList<Inquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 이거 DB 완성 후 작성
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
				
				Inquiry inq = new Inquiry();
				
				inq.setInqno(      rset.getInt("CCODE"));
				inq.setInqwriter(  rset.getString("USERNAME"));
				inq.setInqanswer(  rset.getString("ADMINID"));
				inq.setInqtitle(   rset.getString("CTITLE"));
				inq.setInqcontent( rset.getString("CCONTENT"));
				
				list.add(inq);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}

	public Inquiry selectOne(Connection con, int inqno) {
		
		Inquiry inq = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 이거 DB 완성 후 작성
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, inqno);
			
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				inq = new Inquiry();
				
				inq.setInqno(      rset.getInt("CCODE"));
				inq.setInqwriter(  rset.getString("USERNAME"));
				inq.setInqanswer(  rset.getString("ADMINID"));
				inq.setInqtitle(   rset.getString("CTITLE"));
				inq.setInqcontent( rset.getString("CCONTENT"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return inq;
	}
	
	
}
