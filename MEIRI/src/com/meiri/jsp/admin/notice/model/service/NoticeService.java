package com.meiri.jsp.admin.notice.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.admin.notice.model.dao.NoticeDAO;
import com.meiri.jsp.admin.notice.model.vo.Notice;

public class NoticeService {
	
	private Connection con;
	private NoticeDAO nDAO = new NoticeDAO();
	
	
	public int getListCount() {
		
		con = getConnection();
		
		int result = nDAO.getListCount(con);
		
		close(con);
		
		return result;
	}


	public ArrayList<Notice> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<Notice> list = nDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public Notice selectOne(int nno) {
		con = getConnection();
		
		Notice n = nDAO.selectOne(con, nno);
		
		close(con);
		
		return n;
	}


	public int insertNotice(Notice n) {
		
		con = getConnection();
		
		int result = nDAO.insertNotice(con, n);
		
		close(con);
		
		return result;
	}


	public int updateNotice(Notice n) {
		
		con = getConnection();
		
		int result = nDAO.updateNotice(con, n);
		
		close(con);
		
		return result;
	}


	public int deleteNotice(int nno) {
		con = getConnection();
		
		int result = nDAO.deleteNotice(con, nno);
		
		close(con);
		
		return result;
	}

}

