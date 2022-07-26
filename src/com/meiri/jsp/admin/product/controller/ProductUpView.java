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
 * Servlet implementation class ProductUpView
 */
@WebServlet("/pUpView.pr")
public class ProductUpView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("pno = " + pno);
		
		HashMap<String, Object> hmap = new ProductService().getUpdateView(pno);
		
		String page = "";
		
		if(hmap != null && hmap.get("product") != null) {
			request.setAttribute("product", hmap.get("product"));
			request.setAttribute("fileList", hmap.get("productfile"));
			page = "views/admin/product/productUpdate.jsp";
		} else {
			request.setAttribute("error-msg", "제품 수정화면 조회 실패");
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
