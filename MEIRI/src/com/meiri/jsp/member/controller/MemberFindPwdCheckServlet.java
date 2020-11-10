package com.meiri.jsp.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

//		response.setContentType("application/json; charset=UTF-8");
		
		
		
		
		
		    Properties props = System.getProperties();
	        props.put("mail.smtp.user", "meirihost@gmail.com"); // 서버 아이디만 쓰기
			props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
	           
	        Authenticator auth = new MyAuthentication();
	         
	       // session 생성 및  MimeMessage생성
	        Session session = Session.getInstance(props, auth);
	        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress("meirihost@gmail.com") ;             

            // 이메일 발신자
            msg.setFrom(from);           
             
            // 이메일 수신자
            String email = request.getParameter("email"); //사용자가 입력한 이메일 받아오기
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
            
             
            // 이메일 제목
            msg.setSubject("MEIRI 임시 비밀번호입니다.", "UTF-8");
             
            // 이메일 내용 
            String code = "MEIRI 임시 비밀번호입니다.  [" + request.getParameter("checkCode") + "]" ; //인증번호 값 받기
            System.out.println(code);
            request.setAttribute("code", code);
            msg.setText(code, "UTF-8");
             
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기
            javax.mail.Transport.send(msg);
            System.out.println("임시 비밀번호가 발송되었습니다.");
            System.out.println(email);
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/meiri/views/member/memberLoginForm.jsp");
        rd.forward(request, response);
    
		
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
	