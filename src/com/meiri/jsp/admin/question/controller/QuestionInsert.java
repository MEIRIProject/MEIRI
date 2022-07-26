package com.meiri.jsp.admin.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.question.model.service.QuestionService;
import com.meiri.jsp.admin.question.model.vo.Question;

/**
 * Servlet implementation class QuestionInsert
 */
@WebServlet("/insert.qu")
public class QuestionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작성자, 제목, 내용
		String writer = request.getParameter("aid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Question q = new Question(writer, title, content);
		
		int result = new QuestionService().insertQuestion(q);
		
		if (result > 0) {
			response.sendRedirect("questionList.qu");
		} else {
			request.setAttribute("error-msg", "게시글 작성 실패!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp")
			       .forward(request, response);
		
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
