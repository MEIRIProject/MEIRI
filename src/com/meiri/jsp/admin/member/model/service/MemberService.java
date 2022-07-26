package com.meiri.jsp.admin.member.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.admin.member.model.dao.MemberDAO;
import com.meiri.jsp.admin.member.model.vo.Member;

public class MemberService {

	private Connection con;
	private MemberDAO mdao = new MemberDAO();
	
public int getListCount() {
		
		con = getConnection();
		
		int result = mdao.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Member> selectList(int currentPage, int limit) {
		
		con = getConnection();
		
		ArrayList<Member> m = mdao.selectList(currentPage, limit, con);
		
		close(con);
		
		return m;
	}

	public Member selectOne(String userid) {

		con = getConnection();
		
		Member m = mdao.selectOne(userid, con);
		
		close(con);
		
		return m;
	}

	public int deleteMember(String userid, String aid, String umc) {
		
		con = getConnection();
		System.out.println("DAO 들어가기 직전");
		int result = mdao.deleteMember(userid, con, aid, umc);
		
		close(con);
		
		return result;
	}
}
