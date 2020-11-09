package com.meiri.jsp.admin.inquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.inquiry.model.service.InquiryService;
import com.meiri.jsp.admin.inquiry.model.vo.Inquiry;
import com.meiri.jsp.admin.inquiryComment.model.service.InquiryCommentService;
import com.meiri.jsp.admin.inquiryComment.model.vo.InquiryComment;

/**
 * Servlet implementation class InquirySelectOne
 */
@WebServlet("/inquiryOne.in")
public class InquirySelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquirySelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int inqno = Integer.parseInt(request.getParameter("inqno"));
		
		Inquiry inq = new InquiryService().selectOne(inqno);
		ArrayList<InquiryComment> clist = new InquiryCommentService().selectList(inqno);
		
		
		String page = "";
		
		if( inq != null ) {
			request.setAttribute("inquiry", inq);
			request.setAttribute("clist", clist);
			
			page = "views/admin/inquiry/inquiryDetail.jsp";
		} else {
			
			request.setAttribute("error-msg", "게시글 상세조회 실패!");
			
			page = "views/common/errorPage.jsp";
			
		}
		
		request.getRequestDispatcher(page)
		       .forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
