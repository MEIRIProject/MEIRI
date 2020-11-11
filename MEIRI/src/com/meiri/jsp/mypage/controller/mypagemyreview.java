package com.meiri.jsp.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meiri.jsp.member.model.vo.Member;
import com.meiri.jsp.mypage.model.service.MyPageService;
import com.meiri.jsp.review.model.vo.Review;
import com.meiri.jsp.review.model.vo.ReviewView;

/**
 * Servlet implementation class mypagemyreview
 */
@WebServlet("/mypagemyreview.my")
public class mypagemyreview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypagemyreview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginUserId = (Member)session.getAttribute("member");
		String userid = loginUserId.getUserId();
		
		System.out.println("userid :" + userid);
		Member m = new Member(userid);
		MyPageService mps = new MyPageService();
		
		
		ArrayList<ReviewView> rlist = mps.mypageSelectReview(userid);
		
		String page = "";
		
		if(rlist != null) {
			
			request.setAttribute("rlist", rlist);
			
			page = "views/mypage/mypageMyReview.jsp";
			
		}else {
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
