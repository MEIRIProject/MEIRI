package com.meiri.jsp.review.model.dao;

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

import com.meiri.jsp.review.model.vo.Review;
import com.meiri.jsp.review.model.vo.ReviewView;
import com.meiri.jsp.review.model.vo.reviewFile;

public class ReviewDAO {
	
	private Properties prop;
	
	public ReviewDAO() {
		prop = new Properties();
		
		String filePath = ReviewDAO.class
									  .getResource("/config/review-sql.properties")
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

	 public int insertReview(Connection con, Review r) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("insertReview");
	      
	      try {
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, r.getRcontent());
	         pstmt.setString(2, r.getUserid());
	         pstmt.setInt(3, r.getPcode());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	            
	            
	      return result;
	   }


	public ArrayList<ReviewView> selectList(Connection con, int pcode) {
		
		ArrayList<ReviewView> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		System.out.println("pcode = " + pcode);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pcode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReviewView r = new ReviewView();
				
				r.setUserid(rset.getString("userid"));
				r.setRcontent(rset.getString("rcontent"));
				r.setRdate(rset.getDate("rdate"));
				r.setPcode(rset.getInt("pcode"));
				r.setChangename(rset.getString("changename"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
		
		
		
	}

	public int getCurrentRcode(Connection con) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("currentRcode");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
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

	public int insertReviewFile(Connection con, reviewFile rF) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReviewFile");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(	1, rF.getRcode());
			pstmt.setString(2, rF.getFilepath());
			pstmt.setString(3, rF.getOriginname());
			pstmt.setString(4, rF.getChangename());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	

}
