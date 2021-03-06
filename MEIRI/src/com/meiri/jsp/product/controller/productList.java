package com.meiri.jsp.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.product.model.service.ProductService;
import com.meiri.jsp.product.model.vo.Product;
import com.meiri.jsp.product.model.vo.ProductFilesList;
import com.meiri.jsp.product.model.vo.ProductView;

/**
 * Servlet implementation class productList
 */
@WebServlet("/index.pl")
public class productList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<ProductView> pvlist = new ArrayList<>();
		ProductService ps = new ProductService();
		
		
		pvlist = ps.productSelectList();
		
		System.out.println(pvlist);
		request.setAttribute("pvlist", pvlist);
		
		
		String page = "";
		page = "index.jsp";
		
		
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
