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
 * Servlet implementation class MemberFindPwdServlet
 */
@WebServlet("/findPwd.me")
public class MemberFindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email") + "@"
				    + request.getParameter("email2");
		String userId = request.getParameter("userId");
		
		try {
			
			Member m = new MemberService().findPwd(email, userId);
			
			RequestDispatcher view 
			        = request.getRequestDispatcher("view/member/memberLoginForm.jsp");
			
			HttpSession session = request.getSession(); 
			
			System.out.println("findPwd servlet");
			
			session.setAttribute("userFindId", m);
			view.forward(request, response);
			
		} catch (MemberException e) {
			
			request.setAttribute("msg", "비밀번호 찾기 실패");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/users/common/errorPage.jsp")
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
