package com.meiri.jsp.admin.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.admin.product.model.service.ProductService;

/**
 * Servlet implementation class ProductSelectOne
 */
@WebServlet("/productOne.pr")
public class ProductSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		HashMap<String, Object> product 
		   = new ProductService().selectOne(pno);
		
		
		String page = "";
		
		if(product != null && product.get("product") != null) {
			request.setAttribute("product", product.get("product"));
			request.setAttribute("fileList", product.get("productfile"));
			
			page = "views/admin/product/productDetail.jsp";
		} else {
			request.setAttribute("exception", new Exception("게시글 상세 조회 실패"));
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
