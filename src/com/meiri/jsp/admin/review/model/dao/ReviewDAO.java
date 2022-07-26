package com.meiri.jsp.admin.review.model.dao;

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

import com.meiri.jsp.review.model.vo.ReviewView;
import com.meiri.jsp.review.model.vo.reviewFile;

public class ReviewDAO {
	private Properties prop;
	
	public ReviewDAO() {
		prop = new Properties();
		
		String filePath = ReviewDAO.class
								  .getResource("/config/review-sql.properties")
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

	public ArrayList<ReviewView> selectList(int currentPage, int limit, Connection con) {
		
		ArrayList<ReviewView> rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 이거 DB 완성 후 작성
		String sql = prop.getProperty("selectReviewList");
		
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
				
				ReviewView r = new ReviewView();
				
				r.setRcode(		rset.getInt("rcode")		);
				r.setUserid(	rset.getString("username")	);
				r.setRcontent(	rset.getString("rcontent")	);
				r.setRdate(		rset.getDate("rdate")		);
				r.setPcode(		rset.getInt("pcode")		);
				r.setChangename(rset.getString("changename"));
				
				rlist.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		return rlist;
	}


	public int deleteReview(int rno, Connection con) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public reviewFile selectReviewFile(int rno, Connection con) {
		
		reviewFile rf = new reviewFile();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				rf.setChangename( rset.getString("changename"));
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rf;
	}

	public int deleteReviewFile(int rno, Connection con) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReviewFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			System.out.println("rno = " + rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
