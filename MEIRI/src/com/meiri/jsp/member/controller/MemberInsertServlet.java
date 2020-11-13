package com.meiri.jsp.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meiri.jsp.common.exception.MemberException;
import com.meiri.jsp.member.model.service.MemberService;
import com.meiri.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/mInsert.me")
public class MemberInsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String userId = request.getParameter("userId");
      String passWord = request.getParameter("password");
      String userName = request.getParameter("userName");
      String address = request.getParameter("zipCode") + ", "
            + request.getParameter("address1") + ", "
            + request.getParameter("address2");
      String email = request.getParameter("email1") + "@" 
                   + request.getParameter("email2"); 
      int birth = Integer.parseInt(request.getParameter("birth"));
       String phone = request.getParameter("tel1") + "-"
                 + request.getParameter("tel2") + "-"
                 + request.getParameter("tel3");
      
      
      Member joinMember = new Member(userId,  MemberFindPwdServlet.getSHA512(passWord), userName, address, 
                           email, birth, phone); 
      // ..?
      
      System.out.println("가입 정보 확인 : " + joinMember);
      
      // 회원 가입 실행
      MemberService ms = new MemberService();
         
      try {
         ms.insertMember(joinMember);
         
         System.out.println("회원 가입 성공");
         response.sendRedirect("index.jsp");
         
      } catch(MemberException e) {
      
         System.out.println("회원 가입 실패");
         RequestDispatcher view
            = request.getRequestDispatcher("views/common/errorPage.jsp");
         
         request.setAttribute("error-msg", "회원 가입 실패");
         request.setAttribute("exception", e);
         
         view.forward(request, response);
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
