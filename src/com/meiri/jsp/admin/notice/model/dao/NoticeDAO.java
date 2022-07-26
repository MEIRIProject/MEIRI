package com.meiri.jsp.admin.notice.model.dao;

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

import com.meiri.jsp.admin.notice.model.vo.Notice;

public class NoticeDAO {
	private Properties prop;
	
	public NoticeDAO() {
		prop = new Properties();
		
		String filePath = NoticeDAO.class
								  .getResource("/config/notice-sql.properties")
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

	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Notice> list = new ArrayList<>();
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
				
				Notice n = new Notice();
				
				n.setNno(      rset.getInt("ncode"));
				n.setAdminid(  rset.getString("adminid"));
				n.setNtitle(   rset.getString("ntitle"));
				n.setNdate(    rset.getDate("ndate"));
				n.setNcontent( rset.getString("ncontent"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}

	public Notice selectOne(Connection con, int nno) {
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 이거 DB 완성 후 작성
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				n = new Notice();
				
				n.setNno(      rset.getInt("ncode"));
				n.setAdminid(  rset.getString("adminid"));
				n.setNtitle(   rset.getString("ntitle"));
				n.setNdate(    rset.getDate("ndate"));
				n.setNcontent( rset.getString("ncontent"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return n;
	}

	public int insertNotice(Connection con, Notice n) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getAdminid());
			pstmt.setString(2, n.getNtitle());
			pstmt.setString(3, n.getNcontent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateNotice(Connection con, Notice n) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNotice");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getNtitle());
			pstmt.setString(2, n.getNcontent());
			pstmt.setInt(	3, n.getNno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNotice(Connection con, int nno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
