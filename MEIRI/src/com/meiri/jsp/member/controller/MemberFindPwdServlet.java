package com.meiri.jsp.member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meiri.jsp.common.exception.MemberException;
import com.meiri.jsp.member.model.service.MemberService;
import com.meiri.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPwdServlet
 */
@WebServlet("/findPwd.me")
public class MemberFindPwdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      String userName = request.getParameter("userName");
      String email =request.getParameter("email1") + "@" 
                  + request.getParameter("email2");
      String userId = request.getParameter("userId");

      try {
         
         Member m = new MemberService().findPwd(userName, email, userId);
         
         
         RequestDispatcher view = request.getRequestDispatcher("/pwdUpdate.me"); 
      
         HttpSession session = request.getSession(); 
         
         System.out.println("findPwd servlet");
      
         session.setAttribute("usersFindId", m);
         view.forward(request, response);
      
      } catch (MemberException e) {
         request.setAttribute("msg", "비밀번호 찾기 실패");
         request.setAttribute("exception", e);
         request.getRequestDispatcher("views/errorPage.jsp")
             .forward(request, response);
      }
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }
   
  public  static String getSHA512(String pwd) {
      
      try {
         MessageDigest md = MessageDigest.getInstance("SHA-512");
         byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
         md.update(bytes);
         
         return Base64.getEncoder().encodeToString(md.digest());
         
      } catch (NoSuchAlgorithmException e) {
         
         System.out.println("암호화 에러 발생!");
         e.printStackTrace();
         
         return null;
      }
   }
   


   }
