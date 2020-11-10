package com.meiri.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.meiri.jsp.common.exception.MemberException;
import com.meiri.jsp.member.model.service.MemberService;
import com.meiri.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindId
 */
@WebServlet("/findId.me")
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
		MemberService ms = new MemberService();
		
		try {
			Member m = new Member();
			m.setUserName(userName);
			m.setEmail(email);
			
			 System.out.println("servlet: " + m);
			
			  m = ms.findId(m);
			
			System.out.println("아이디 찾기 성공");
			
			RequestDispatcher view 
				= request.getRequestDispatcher("views/member/findIdSuccess.jsp");
			
			HttpSession session = request.getSession(); 
			
			session.setAttribute("usersFindId", m);
			view.forward(request, response);
			
		} catch (MemberException e) {
			request.setAttribute("error-msg", "아이디 찾기 실패");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/errorPage.jsp")
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
