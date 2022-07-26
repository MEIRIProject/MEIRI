package com.meiri.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.meiri.jsp.common.tool.Token;
import com.meiri.jsp.member.model.service.MemberService;
import com.meiri.jsp.member.model.vo.Member;

/*import com.google.gson.Gson;
import com.kh.semi.admin.product.model.service.ProductService;
import com.kh.semi.admin.product.model.vo.SecondCategory;*/

/**
 * Servlet implementation class UsersEmailCheckServlet
 */
@WebServlet("/pwdCheck.me")
public class MemberFindPwdCheckServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   @Override
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Map<String, Object> resultData = new HashMap<>();
      Gson gson = new Gson();
      response.setContentType("application/json;charset=UTF-8");// json문자열로 응답하기위해 response contentType을 json으로 설정.
      PrintWriter out = response.getWriter(); 
   //  response.setContentType("application/json; charset=UTF-8");

      Properties props = System.getProperties();
      props.put("mail.smtp.user", "meirihost@gmail.com"); // 서버 아이디만 쓰기
      props.put("mail.smtp.host", "smtp.gmail.com");      // 구글 SMTP
      props.put("mail.smtp.port", "465");                 // 경로
      props.put("mail.smtp.starttls.enable", "true");     // 
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.socketFactory.port", "465");
      props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      props.put("mail.smtp.socketFactory.fallback", "false");   // 답장 X

      Authenticator auth = new MyAuthentication();

      // session 생성 및 MimeMessage생성
      Session session = Session.getInstance(props, auth);
      MimeMessage msg = new MimeMessage(session);

      try {
         // 편지보낸시간
         msg.setSentDate(new Date());

         InternetAddress from = new InternetAddress("meirihost@gmail.com");

         // 이메일 발신자
         msg.setFrom(from);

         String userName = request.getParameter("userName");
         String userId = request.getParameter("userId");
         // 이메일 수신자
         String email = request.getParameter("email1") + "@" + request.getParameter("email2"); // 사용자가 입력한 이메일 받아오기
         String newPassword = Token.random(10);
         String hashedPassword = MemberFindPwdServlet.getSHA512(newPassword);

         Member m = new Member();
         m.setUserName(userName);
         m.setEmail(email);
         m.setUserId(userId);
         m.setPassWord(hashedPassword);
         MemberService ms = new MemberService();
         ms.updatePwd(m);//새로운 비밀번호(Hash) DB 업데이트

         InternetAddress to = new InternetAddress(email);
         msg.setRecipient(Message.RecipientType.TO, to);

         // 이메일 제목
         msg.setSubject("MEIRI 임시 비밀번호입니다.", "UTF-8");

         // 이메일 내용
         // String code = "MEIRI 임시 비밀번호입니다. [" + request.getParameter("checkCode") + "]"
         // ; //인증번호 값 받기
         String code = "MEIRI 임시 비밀번호입니다.  [" + newPassword + "]"; // 인증번호 값 받기
         System.out.println(code);
         
         request.setAttribute("code", code);
         msg.setText(code, "UTF-8");

         // 이메일 헤더
         msg.setHeader("content-Type", "text/html");

         // 메일보내기
         javax.mail.Transport.send(msg);
         System.out.println("임시 비밀번호가 발송되었습니다.");
         System.out.println(email);

         // ajax응답(성공)
         resultData.put("ok", true);
         resultData.put("message", "임시 비밀번호가 발송되었습니다.\n로그인 페이지로 이동합니다.");
         
         System.out.println("@@@@@@@@@@@@@@@@@@@  "+gson.toJson(resultData));
         out.print(gson.toJson(resultData));
         out.flush();

      } catch (Exception e) {
         e.printStackTrace();
         // ajax응답(exception)
         resultData.put("ok", false);
         out.print(gson.toJson(resultData));
         out.flush();
      }

   }

   // 암호화를 위한 SHA-512 로직 작성
   private static String getSHA512(String pwd) {

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

class MyAuthentication extends Authenticator {

   PasswordAuthentication pa;

   public MyAuthentication() {

      String id = "meirihost@gmail.com"; // 구글 ID
      String pw = "a123456789!"; // 구글 비밀번호

      // ID와 비밀번호를 입력한다.
      pa = new PasswordAuthentication(id, pw);

   }

// 
//    // 시스템에서 사용하는 인증정보
   public PasswordAuthentication getPasswordAuthentication() {
      return pa;
   }

}