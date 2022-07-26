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
 * Servlet implementation class CommentInsert
 */
@WebServlet("/insertComment.in")
public class CommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작성자, 게시글 번호, 댓글 내용
		String writer = request.getParameter("writer");
		int inqno = Integer.parseInt(request.getParameter("inqno"));
		String content = request.getParameter("replyContent");
		
		InquiryComment comment = new InquiryComment(inqno, content, writer);
		
		int result = new InquiryCommentService().insertComment(comment);
		
		if( result > 0 ) {
			response.sendRedirect("inquiryOne.in?inqno="+ inqno);
		} else {
			// 에러 페이지 작성 . . . 생략
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
