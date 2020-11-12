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
import com.meiri.jsp.review.model.service.ReviewService;
import com.meiri.jsp.review.model.vo.ReviewView;

/**
 * Servlet implementation class productSelectOne
 */
@WebServlet("/pSelect.pd")
public class productSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pcode = Integer.parseInt(request.getParameter("pcode"));
		
		
		Product p = new ProductService().selectOne(pcode);
		System.out.println(p);
		ProductFilesList pf1 = new ProductService().productDetailImageList1(pcode);
		ArrayList<ProductFilesList> pflist2 = new ProductService().productDetailImageList2(pcode);
		ProductFilesList pf3 = new ProductService().productDetailImageList3(pcode);
		
		ArrayList<ReviewView> rvlist = new ReviewService().selectList(pcode);
		System.out.println("rlist = " + rvlist);
		String page = "";
		
		//System.out.println("pf1 :" + pf1 );
		//System.out.println("pflist2" + pflist2);
		//System.out.println("pf3 :" + pf3 );
		//System.out.println("pflist2 :" + pflist2 );
		//System.out.println("pflist3 :" + pflist3 );
		
		
		if(p != null) {
			request.setAttribute("product", p);
			request.setAttribute("rvlist", rvlist);
			request.setAttribute("pf1", pf1);
			request.setAttribute("pflist2", pflist2);
			request.setAttribute("pf3", pf3);
			
			
			page = "views/product/productDetail.jsp";
		}else {
			request.setAttribute("error-msg", "게시글 상세 조회 실패 !");
			
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
