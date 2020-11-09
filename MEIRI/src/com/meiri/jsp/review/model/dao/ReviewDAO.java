package com.meiri.jsp.review.model.dao;

import static com.meiri.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meiri.jsp.review.model.vo.Review;

public class ReviewDAO {
	
	private Properties prop = null;
	
	public ReviewDAO() {
		prop = new Properties();
		
		String filePath = ReviewDAO.class
									  .getResource("config/review-sql.properties")
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
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
				
		return result;
	}

	public ArrayList<Review> selectList(Connection con, int pcode) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pcode);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				
				
				r.setRcode(rset.getInt("rcode"));
				r.setRcontent(rset.getString("rcontent"));
				r.setRdate(rset.getDate("rdate"));
				r.setUserid(rset.getString("userId"));
				r.setPcode(rset.getInt("pcode"));
				r.setFcode(rset.getInt("fcode"));
				
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

	

}
