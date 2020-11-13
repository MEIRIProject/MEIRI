package com.meiri.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.meiri.jsp.common.exception.MemberException;
import com.meiri.jsp.member.model.service.MemberService;
import com.meiri.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindId
 */
@WebServlet("/findId.me")
public class MemberFindIdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public MemberFindIdServlet() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      Map<String, Object> resultData = new HashMap<>();
      Gson gson = new Gson();
      response.setContentType("application/json;charset=UTF-8");// json문자열로 응답하기위해 response contentType을 json으로 설정.
      PrintWriter out = response.getWriter();

      request.setCharacterEncoding("UTF-8");

      String userName = request.getParameter("userName");
      String email = request.getParameter("email");

      MemberService ms = new MemberService();

      try {
         Member m = new Member();
         m.setUserName(userName);
         m.setEmail(email);

         System.out.println("servlet: " + m);

         m = ms.findId(m);

         System.out.println("아이디 찾기 성공");


         resultData.put("ok", true);
         resultData.put("userId", m.getUserId());
         out.print(gson.toJson(resultData));
         out.flush();

      } catch (MemberException e) {
         e.printStackTrace();
         resultData.put("ok", false);
         resultData.put("message", e.getMessage());
         out.print(gson.toJson(resultData));
         out.flush();
      }

   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}