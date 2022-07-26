package com.meiri.jsp.admin.member.model.dao;

import static com.meiri.jsp.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.meiri.jsp.admin.member.model.vo.Member;


public class MemberDAO {
	
	private Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		String filePath = MemberDAO.class
								  .getResource("/config/member-sql.properties")
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

	public ArrayList<Member> selectList(int currentPage, int limit, Connection con) {
		
		ArrayList<Member> rlist = new ArrayList<>();
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
				
				Member m = new Member();
							
				m.setUserid(	rset.getString("userid")	);
				m.setPassword(	rset.getString("password")	);
				m.setName(		rset.getString("username")	);
				m.setAddress(	rset.getString("address")	);
				m.setEmail(		rset.getString("email")		);
				m.setBirth(		rset.getInt("birth")		);
				m.setPhone(		rset.getString("phone")		);
				
				rlist.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(pstmt);
		}
		return rlist;
	}

	public Member selectOne(String userid, Connection con) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				m = new Member();
				
				m.setUserid(	rset.getString("userid")	);
				m.setPassword(	rset.getString("password")	);
				m.setName(		rset.getString("username")	);
				m.setAddress(	rset.getString("address")	);
				m.setEmail(		rset.getString("email")		);
				m.setBirth(		rset.getInt("birth")		);
				m.setPhone(		rset.getString("phone")		);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int deleteMember(String userid, Connection con, String aid, String umc) {
		System.out.println("DAO 들어옴");
		int result = 0;
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertUmanage");
		
		System.out.println("userid = " + userid);
		System.out.println("aid = " + aid);
		System.out.println("content = " + umc);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, aid);
			pstmt.setString(3, umc);

			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			rollback(con);
		}
		
		int result2 = 0;
		
		if(result1 > 0) {
			sql = prop.getProperty("deleteMember");
			
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				result2 = pstmt.executeUpdate();
				
			} catch (SQLException e) {

				e.printStackTrace();
				rollback(con);
			} finally {
				close(pstmt);
			}
		}
		
		result = result1 * result2;
		
		return result;
	}
}
