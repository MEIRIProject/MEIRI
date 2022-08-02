package com.meiri.jsp.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.cart.model.service.CartService;
import com.meiri.jsp.cart.model.vo.CartView;

/**
 * Servlet implementation class CartSelectList
 */
@WebServlet("/selectCart.ca")
public class CartSelectList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userid = request.getParameter("userid");

        System.out.println("userid = " + userid);

        ArrayList<CartView> cav = new CartService().selectCartList(userid);

        String page = "";

        if (cav != null) {
            request.setAttribute("cartlist", cav);

            page = "views/basket/basketShopping.jsp";
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
