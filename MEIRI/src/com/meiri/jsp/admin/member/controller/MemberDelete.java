package com.meiri.jsp.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.member.model.service.MemberService;

/**
 * Servlet implementation class MemberDelete
 */
@WebServlet("/delete.me")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		
		String adminid = request.getParameter("aid");
		//!!!!!!! JSP 만들때 경로 뒤에 ?aid=<%=a.getAdminid()%> 로 하기
		//!!!!!!! a 는 Admin 객체, 변경될 수 있음
		
		String umcontent = request.getParameter("content");
		System.out.println("서비스 들어가기 직전");
		int result = new MemberService().deleteMember(userid, adminid, umcontent);
		
		if( result > 0) {
			response.sendRedirect("memberList.me");
		} else {
			request.setAttribute("error-msg", "회원 삭제 실패!");
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
