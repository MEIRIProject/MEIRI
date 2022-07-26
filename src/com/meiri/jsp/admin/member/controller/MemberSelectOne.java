package com.meiri.jsp.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.member.model.service.MemberService;
import com.meiri.jsp.admin.member.model.vo.Member;

/**
 * Servlet implementation class MemberSelectOne
 */
@WebServlet("/memberOne.me")
public class MemberSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
		Member m = new MemberService().selectOne(userid);
		
		String page = "";
		
		if( m != null ) {
			request.setAttribute("member", m);
			
			page = "views/admin/member/memberDetail.jsp";
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
