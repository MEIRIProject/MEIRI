package com.meiri.jsp.admin.question.model.dao;

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

import com.meiri.jsp.admin.question.model.vo.Question;

public class QuestionDAO {
	private Properties prop;
	
	public QuestionDAO() {
		prop = new Properties();
		
		String filePath = QuestionDAO.class
								  .getResource("/config/question-sql.properties")
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

	public ArrayList<Question> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Question> list = new ArrayList<>();
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
				
				Question q = new Question();
				
				q.setQno(      rset.getInt("qcode"));
				q.setQwriter(  rset.getString("adminid"));
				q.setQtitle(   rset.getString("qname"));
				q.setQanswer(  rset.getString("qcontent"));
				
				list.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}

	public Question selectOne(Connection con, int qno) {
		
		Question q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 이거 DB 완성 후 작성
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				q = new Question();
				
				q.setQno(      rset.getInt("qcode"));
				q.setQwriter(  rset.getString("adminid"));
				q.setQtitle(   rset.getString("qname"));
				q.setQanswer(  rset.getString("qcontent"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return q;
	}

	public int insertQuestion(Connection con, Question q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQuestion");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, q.getQwriter());
			pstmt.setString(2, q.getQtitle());
			pstmt.setString(3, q.getQanswer());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateQuestion(Connection con, Question q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQuestion");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, q.getQtitle());
			pstmt.setString(2, q.getQanswer());
			pstmt.setInt(	3, q.getQno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteQuestion(Connection con, int qno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQuestion");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
