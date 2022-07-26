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
 * Servlet implementation class QuestionUpdate
 */
@WebServlet("/update.qu")
public class QuestionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 질문 코드, 변경할 제목과 내용
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		QuestionService qs = new QuestionService();
		
		Question q = qs.selectOne(qno);
		
		q.setQtitle(title);
		q.setQanswer(content);
		
		int result = qs.updateQuestion(q);
		
		if( result > 0) {
			response.sendRedirect("questionList.qu");
		} else {
			request.setAttribute("error-msg", "자주 묻는 질문 수정 실패!");
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
