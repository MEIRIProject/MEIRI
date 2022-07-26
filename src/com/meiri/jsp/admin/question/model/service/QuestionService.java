package com.meiri.jsp.admin.question.model.service;

import static com.meiri.jsp.common.JDBCTemplate.close;
import static com.meiri.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.meiri.jsp.admin.question.model.dao.QuestionDAO;
import com.meiri.jsp.admin.question.model.vo.Question;

public class QuestionService {

	private Connection con;
	private QuestionDAO qDAO = new QuestionDAO();
	
	
	public int getListCount() {
		
		con = getConnection();
		
		int result = qDAO.getListCount(con);
		
		close(con);
		
		return result;
	}


	public ArrayList<Question> selectList(int currentPage, int limit) {
		con = getConnection();
		
		ArrayList<Question> list = qDAO.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public Question selectOne(int qno) {
		con = getConnection();
		
		Question q = qDAO.selectOne(con, qno);
		
		close(con);
		
		return q;
	}


	public int insertQuestion(Question q) {
		
		con = getConnection();
		
		int result = qDAO.insertQuestion(con, q);
		
		close(con);
		
		return result;
	}


	public int updateQuestion(Question q) {
		
		con = getConnection();
		
		int result = qDAO.updateQuestion(con, q);
		
		close(con);
		
		return result;
	}


	public int deleteQuestion(int qno) {
		con = getConnection();
		
		int result = qDAO.deleteQuestion(con, qno);
		
		close(con);
		
		return result;
	}
	
}
