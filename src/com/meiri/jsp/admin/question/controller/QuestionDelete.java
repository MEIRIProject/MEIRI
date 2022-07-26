package com.meiri.jsp.admin.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.question.model.service.QuestionService;

/**
 * Servlet implementation class QuestionDelete
 */
@WebServlet("/qDelete.qu")
public class QuestionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		int result = new QuestionService().deleteQuestion(qno);
		
		if( result > 0) {
			response.sendRedirect("questionList.qu");
		} else {
			request.setAttribute("error-msg", "자주 묻는 질문 삭제 실패!");
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
