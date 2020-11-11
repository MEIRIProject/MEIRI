package com.meiri.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meiri.jsp.member.model.service.MemberService;
import com.meiri.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/login.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String passWord = request.getParameter("password");
		
		Member m = new Member(userId, passWord);
		
		MemberService ms = new MemberService();
		
		m = ms.selectMember(m);
		System.out.println(m);
		if(m != null) {
			HttpSession session = request.getSession();
		
			session.setAttribute("member", m);
			
			response.sendRedirect("index.pl");
			
		} else {
			request.setAttribute("error-msg", "회원 로그인 실패!");
			
			RequestDispatcher view 
			    = request.getRequestDispatcher("views/loginFail.jsp");
			
			view.forward(request, response);
			
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
