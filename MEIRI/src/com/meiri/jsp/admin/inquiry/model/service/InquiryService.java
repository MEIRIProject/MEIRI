package com.meiri.jsp.admin.inquiry.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.admin.inquiry.model.dao.InquiryDAO;
import com.meiri.jsp.admin.inquiry.model.vo.Inquiry;

public class InquiryService {

	private Connection con;
	private InquiryDAO inqDAO = new InquiryDAO();
	
	
	public int getListCount() {
		
		con = getConnection();
		
		int result = inqDAO.getListCount(con);
		
		close(con);
		
		return result;
	}


	public ArrayList<Inquiry> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<Inquiry> list = inqDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public Inquiry selectOne(int inqno) {
		
		con = getConnection();
		
		Inquiry inq = inqDAO.selectOne(con, inqno); 
		
		close(con);
		
		return inq;
	}
	
	
	
}
