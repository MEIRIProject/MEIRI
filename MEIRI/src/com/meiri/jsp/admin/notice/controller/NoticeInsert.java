package com.meiri.jsp.admin.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.notice.model.service.NoticeService;
import com.meiri.jsp.admin.notice.model.vo.Notice;

/**
 * Servlet implementation class QuestionInsert
 */
@WebServlet("/insert.no")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작성자, 제목, 내용
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notice n = new Notice(writer, title, content);
		
		int result = new NoticeService().insertNotice(n);
		
		if (result > 0) {
			response.sendRedirect("noticeList.no");
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
