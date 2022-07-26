package com.meiri.jsp.admin.inquiryComment.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.commit;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;
import static com.meiri.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.admin.inquiryComment.model.dao.InquiryCommentDAO;
import com.meiri.jsp.admin.inquiryComment.model.vo.InquiryComment;

public class InquiryCommentService {

	private Connection con;
	
	private InquiryCommentDAO inqcDAO = new InquiryCommentDAO();
	
	public int insertComment(InquiryComment comment) {
		con = getConnection();
		
		int result = inqcDAO.insertComment(con, comment);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<InquiryComment> selectList(int inqno) {
		con = getConnection();
		
		ArrayList<InquiryComment> clist = inqcDAO.selectList(con, inqno);
		
		close(con);
		
		return clist;
	}

	public int updateComment(InquiryComment inqco) {
		con = getConnection();
		
		int result = inqcDAO.updateComment(con, inqco);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteComment(int cno) {
		con = getConnection();
		
		int result = inqcDAO.deleteComment(con, cno);
		
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}

