package com.meiri.jsp.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.cart.model.service.CartService;

/**
 * Servlet implementation class CartDelete
 */
@WebServlet("/deleteCart.ca")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		String userid = request.getParameter("userid");
		int cartcode = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("userid = " + userid);
		System.out.println("cartcode = " + cartcode);
		
		String yes = "";
		
		yes = new CartService().deleteCart(cartcode);
		
		response.getWriter().print(yes);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
