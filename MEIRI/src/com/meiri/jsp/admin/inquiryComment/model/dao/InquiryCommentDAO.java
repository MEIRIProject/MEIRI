package com.meiri.jsp.admin.inquiryComment.model.dao;

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

import com.meiri.jsp.admin.inquiryComment.model.vo.InquiryComment;

public class InquiryCommentDAO {
	private Properties prop;
	
	public InquiryCommentDAO() {
		prop = new Properties();
		
		String filePath = InquiryCommentDAO.class
				          .getResource("/config/comment-sql.properties")
				          .getPath(); // DB 완성 후 만들기
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		
	}

	public int insertComment(Connection con, InquiryComment comment) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		// DB 완성 후 작성
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, comment.getUserId());
			pstmt.setInt(	2, comment.getInqno());
			pstmt.setString(3, comment.getCcontent());

			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<InquiryComment> selectList(Connection con, int inqno) {
		ArrayList<InquiryComment> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, inqno);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				InquiryComment inqco = new InquiryComment();
				
				inqco.setCno(     rset.getInt("acode") 		);
				inqco.setUserId(  rset.getString("adminid")	);
				inqco.setInqno(   rset.getInt("ccode") 		);
				inqco.setCcontent(rset.getString("acontent"));
				inqco.setCdate(   rset.getDate("ndate")		);
				
				clist.add(inqco);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return clist;
	}

	public int updateComment(Connection con, InquiryComment inqco) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, inqco.getCcontent());
			pstmt.setInt(	2, inqco.getCno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public int deleteComment(Connection con, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
				
		return result;
	}

}


