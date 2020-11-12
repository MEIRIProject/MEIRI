package com.meiri.jsp.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meiri.jsp.member.model.vo.Member;
import com.meiri.jsp.order.model.service.OrderService;
import com.meiri.jsp.order.model.vo.Order;


/**
 * Servlet implementation class CartPayment
 */
@WebServlet("/cartPay.ca")
public class CartPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartPayment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  HttpSession session = request.getSession(false);
	      Member m = (Member)session.getAttribute("member");
	      
		  
	      String[] p_name=request.getParameterValues("p_name3");
	      String p2_name = request.getParameter("p_name3");
	      String[] p_price=request.getParameterValues("p_price3"); //수량*제품가격
	      String[] p_amount = request.getParameterValues("p_count3");   
	      int all_price=Integer.parseInt(request.getParameter("totalPrice"));
	      int pcode = Integer.parseInt(request.getParameter("p_no"));
	      
	      
	      String userid2 = m.getUserId();
	      String usermail = m.getEmail();
	      String useraddress = m.getAddress();
	      String userphone = m.getPhone();
	      
	      int pno = p_name.length;
	      String pname = "";
	      if(pno == 1) {
	    	  pname = p_name[0];
	      } else {
	    	  pname = p2_name + " 외 " + (pno - 1) + "개 제품";
	      }
	      
	      String productPrice = p_price[0];
	      int productQuantity = Integer.parseInt(p_amount[0]);
	      int totalPrice = all_price;

	      
	      Order order = new Order(pcode, productQuantity, userid2);
		  int result = new OrderService().insertOrder(order);

		  String page = "";
		  
		  if(result > 0) {
			  pname = "임의의 이름";
			  System.out.println("pname = " + pname);
			  
			  request.setAttribute("pname", pname);
			  request.setAttribute("ptitle", pname);
			  request.setAttribute("productPrice", productPrice);
			  request.setAttribute("userid", userid2);
			  request.setAttribute("useremail", usermail);
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
