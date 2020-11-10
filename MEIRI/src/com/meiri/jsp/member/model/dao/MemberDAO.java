package com.meiri.jsp.member.model.dao;

import static com.meiri.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.meiri.jsp.common.exception.MemberException;
import com.meiri.jsp.member.model.vo.Member;

public class MemberDAO {
	// SQL을 별도로 보관하는 Properties 파일 사용하기
	private Properties prop;

	public MemberDAO() {
		prop = new Properties();

		String filePath = MemberDAO.class.getResource("/config/member-sql.properties").getPath();

		try {
			prop.load(new FileReader(filePath));

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}

	}

	// 회원 조회 (아이디, 비밀번호)
	public Member selectMember(Connection con, Member m) {
		// 1. SQL 실행에 사용할 변수 선언
		Member result = null; // 결과를 담을 객체
		PreparedStatement pstmt = null; // SQL 정보를 담을 객체
		ResultSet rset = null; // select 한 결과를 받아올 객체

		String sql = prop.getProperty("selectMember");

		// 쿼리 확인용
		System.out.println(sql);

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getPassWord());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				// 데이터베이스에서 머릿글부터 가져오기 때문에
				// 무조건 next()로 비교하고 시작한다.
				result = new Member();

				result.setUserId(m.getUserId());
				result.setPassWord(m.getPassWord());
				result.setUserName(rset.getString("username")); // 대소문자 상관 X
				result.setAddress(rset.getString("address"));
				result.setEmail(rset.getString("email"));
				result.setBirth(rset.getInt("birth"));
				result.setPhone(rset.getString("phone"));

			}

			System.out.println("조회 결과 확인 : " + result);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int insertMember(Connection con, Member joinMember) throws MemberException {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMember");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, joinMember.getUserId());
			pstmt.setString(2, joinMember.getPassWord());
			pstmt.setString(3, joinMember.getUserName());
			pstmt.setString(4, joinMember.getAddress());
			pstmt.setString(5, joinMember.getEmail());
			pstmt.setInt(6, joinMember.getBirth());
			pstmt.setString(7, joinMember.getPhone());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());

		} finally {

			close(pstmt);
		}

		return result;
	}

	public int updateMember(Connection con, Member m) throws MemberException {

		int result = 0;
		PreparedStatement pstmt = null;

		// 비밀번호, 성별, 나이, 닉네임, 이메일, 연락처, 주소
		String sql = prop.getProperty("updateMember");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getPassWord());
			pstmt.setInt(2, m.getBirth());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());

		} finally {

			close(pstmt);
		}

		return result;
	}

	public int deleteMember(Connection con, String userId) throws MemberException {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteMember");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());

		} finally {

			close(pstmt);
		}

		return result;
	}

	public int idDupCheck(Connection con, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("idDupCheck");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

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

	public Member findId(Connection con, Member m) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findId");

		System.out.println("sql = " + sql);
		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getEmail());

			System.out.println("rset = " + rset);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = new Member();

				result.setUserName(m.getUserName());
				result.setEmail(m.getEmail());

				result.setUserId(rset.getString("userId"));

				System.out.println("udao : " + result);
			}

		} catch (Exception e) {
			throw new MemberException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public Member findPwd(Connection con, String userName, String email, String userId) throws MemberException {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findPwd");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt = setString(1, userName);
			pstmt = setString(2, email);
			pstmt = setString(3, userId);

			rset = pstmt.executeQuery();

			System.out.println("mdao findPwd");

			if (rset.next()) {
				m = new Member();

				m.setUserName(userName);
				m.setEmail(email);
				m.setUserId(userId);

				m.setPassWord(rset.getNString("PassWord"));

				System.out.println("mdao findpwd : " + m);
			}

		} catch (SQLException e) {
			throw new MemberException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}

		return m;
	}

	private PreparedStatement setString(int i, String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	public int emailDupCheck(Connection con, String email) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("emailDupCheck");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

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

	public int updatePwd(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updatePwd");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getPassWord());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new MemberException(e.getMessage());
		} finally {
			close(pstmt);
		}

		return result;
	}

}