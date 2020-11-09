package com.meiri.jsp.inquiry.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.inquiry.model.dao.inquiryDAO;
import com.meiri.jsp.inquiry.model.vo.inquiry;

import static com.meiri.jsp.common.JDBCTemplate.*;

public class inquiryService {

	private Connection con;
	private inquiryDAO bDAO = new inquiryDAO();
	
	public int getListCount() {
		con = getConnection();
		
		int result = bDAO.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<inquiry> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<inquiry> list = bDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertBoard(inquiry b) {
		con = getConnection();
		
		int result = bDAO.insertBoard(con, b);
		
		if( result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public inquiry selectOne(int bno) {
		con = getConnection();
		inquiry b = bDAO.selectOne(con, bno);
		
		close(con);
		
		return b;
	}

	public int updateBoard(inquiry b) {
		con = getConnection();
		int result = bDAO.updateBoard(con, b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteBoard(int bno) {
		con = getConnection();
		
		int result = bDAO.deleteBoard(con, bno);
		
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	

}











