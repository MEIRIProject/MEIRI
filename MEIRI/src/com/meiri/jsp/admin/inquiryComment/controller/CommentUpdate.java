package com.meiri.jsp.admin.inquiryComment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.inquiryComment.model.service.InquiryCommentService;
import com.meiri.jsp.admin.inquiryComment.model.vo.InquiryComment;


/**
 * Servlet implementation class CommentUpdate
 */
@WebServlet("/updateComment.in")
public class CommentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int inqno = Integer.parseInt(request.getParameter("inqno"));
		String content = request.getParameter("content");
		
		InquiryComment inqco = new InquiryComment();
		inqco.setCno(cno);
		inqco.setCcontent(content);
		
		int result = new InquiryCommentService().updateComment(inqco);
		
		if( result > 0 ) {
			response.sendRedirect("inquiryOne.in?inqno="+ inqno);
		} else {
			// 에러 페이지 전달
			request.setAttribute("error-msg", "댓글 수정 실패!");
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
