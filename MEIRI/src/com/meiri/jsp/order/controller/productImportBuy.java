package com.meiri.jsp.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.order.model.service.OrderService;
import com.meiri.jsp.order.model.vo.Order;

/**
 * Servlet implementation class productImportBuy
 */
@WebServlet("/importBuy.pd")
public class productImportBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productImportBuy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String useremail = request.getParameter("useremail");
		String useraddress = request.getParameter("useraddress");
		String userphone = request.getParameter("userphone");
		int pcode = Integer.parseInt(request.getParameter("pcode"));
		String pname = request.getParameter("pname");
		String ptitle = request.getParameter("ptitle");
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		String page = "";
		
		
		
		
		Order order = new Order(pcode, productQuantity, userid);
		int result = new OrderService().insertOrder(order);
		
		if(result > 0) {
			
			request.setAttribute("pname", pname);
			request.setAttribute("ptitle", ptitle);
			request.setAttribute("productPrice", productPrice);
			request.setAttribute("userid", userid);
			request.setAttribute("useremail", useremail);
			request.setAttribute("useraddress", useraddress);
			request.setAttribute("userphone", userphone);
		
		
			page = "views/product/productImportBuy.jsp";
			
		}else {
			request.setAttribute("error-msg", "게시글 수정화면 조회 실패 ");
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
