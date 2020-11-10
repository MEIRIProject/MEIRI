package com.meiri.jsp.admin.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.product.model.service.ProductService;
import com.meiri.jsp.common.MyRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductDelete
 */
@WebServlet("/pDelete.pr")
public class ProductDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		String root = request.getServletContext().getRealPath("/resources");
		String savePath = root + "/productUploadFiles/";
		
		
		MultipartRequest mre = new MultipartRequest(
				                   request, savePath, maxSize, "UTF-8",
				                   new MyRenamePolicy() );
		
		
		int pno = Integer.parseInt(mre.getParameter("pno"));
		
		String aid = mre.getParameter("aid");
		String content = mre.getParameter("content");
		
		ProductService ts = new ProductService(); 
		
		int result = ts.deleteProduct(pno, savePath, aid, content);
		
		if(result > 0) {
			response.sendRedirect("productList.pr");
		} else {
			request.setAttribute("exception", new Exception("게시글 삭제 오류"));
			request.setAttribute("error-msg", "사진 게시글 삭제 오류 발생");
			
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
