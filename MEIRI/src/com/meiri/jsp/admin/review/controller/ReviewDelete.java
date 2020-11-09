package com.meiri.jsp.admin.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewDelete
 */
@WebServlet("/delete.re")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		ReviewService ts = new ReviewService();
		
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root + "/reviewUploadFiles/";
		
		int result = ts.deleteReview(rno, savePath);
		
		if( result > 0 ) {
			response.sendRedirect("reviewList.re");
		} else {
			request.setAttribute("exception", new Exception("리뷰 삭제 오류!"));
			request.setAttribute("error-msg", "사진 게시글 삭제 오류 발생!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
