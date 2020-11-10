package com.meiri.jsp.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.product.model.service.ProductService;
import com.meiri.jsp.product.model.vo.Product;

/**
 * Servlet implementation class productDetailBuy
 */
@WebServlet("/Detailbuy.pd")
public class productDetailBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetailBuy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pcode = Integer.parseInt(request.getParameter("pcode"));
		String pname = request.getParameter("pname");
		String ptitle = request.getParameter("ptitle");
		int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		
		
		ProductService ps = new ProductService();
		Product p = new Product();
		p = ps.selectOne(pcode);
		
		/* System.out.println("p : " + p); */
		
		String page = "";
		
		
		if(p != null) {
		request.setAttribute("productQuantity", productQuantity);
		request.setAttribute("product", p);
		
		page = "views/product/productDetailbuy.jsp";
		
		request.getRequestDispatcher(page).forward(request, response);
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
