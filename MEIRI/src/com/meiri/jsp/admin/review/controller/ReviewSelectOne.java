package com.meiri.jsp.admin.review.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewSelectOne
 */
@WebServlet("/reviewOne.re")
public class ReviewSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		
		HashMap<String, Object> review 
		   = new ReviewService().selectOne(rno);
		
		String page = "";
		
		if(review != null && review.get("review") != null) {
			request.setAttribute("review", review.get("review"));
			request.setAttribute("fileList", review.get("attachment"));
			
			page = "views/admin/review/reviewDetail.jsp";
		} else {
			request.setAttribute("exception", new Exception("리뷰 상세 조회 실패"));
			request.setAttribute("error-msg", "게시글 상세 조회 실패!!");
			
			page = "views/common/errorPage.jsp";
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
