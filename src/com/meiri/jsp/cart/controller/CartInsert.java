package com.meiri.jsp.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.cart.model.service.CartService;
import com.meiri.jsp.cart.model.vo.Cart;

/**
 * Servlet implementation class CartInsert
 */
@WebServlet("/cartInsert.ca")
public class CartInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");

        String userid = request.getParameter("userid");
        int pcode = Integer.parseInt(request.getParameter("pcode"));
        int fcode = Integer.parseInt(request.getParameter("fcode"));
        int quantity = Integer.parseInt(request.getParameter("Quantity"));

        Cart ca = new Cart();

        ca.setUserid(userid);
        ca.setFcode(fcode);
        ca.setPcode(pcode);
        ca.setQuantity(quantity);

        String yes = new CartService().InsertCart(ca);

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
