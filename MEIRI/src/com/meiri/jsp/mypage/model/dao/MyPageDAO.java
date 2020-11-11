package com.meiri.jsp.mypage.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meiri.jsp.member.model.dao.MemberDAO;
import com.meiri.jsp.review.model.vo.Review;
import com.meiri.jsp.review.model.vo.ReviewView;

import static com.meiri.jsp.common.JDBCTemplate.*;



public class MyPageDAO {

	private Properties prop;
	
	public MyPageDAO() {
		prop = new Properties();

		String filePath = MemberDAO.class
								   .getResource("/config/mypage-sql.properties")
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
	
	public ArrayList<ReviewView> mypageSelectReview(Connection con, String userid) {
		ArrayList<ReviewView> rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReviewView r = new ReviewView();
				
				r.setRcode(rset.getInt("rcode"));
				r.setRcontent(rset.getString("rcontent"));
				r.setRdate(rset.getDate("rdate"));
				r.setUserid(userid);
				r.setPcode(rset.getInt("pcode"));
				r.setChangename(rset.getString("changename"));
				
				rlist.add(r);
			}
			
			System.out.println("rlist :" + rlist);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}

}
