<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.member.model.vo.*"%>
 <%
   Member member = (Member)session.getAttribute("usersFindId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<title>아이디 찾기 성공</title>
</head>
<body>

<section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
            <div class="container">
               <div class="banner_content text-center">
                  <h2>Login/Register</h2>
                  <div class="page_link">
                     <a href="#">Home</a>
                     <a href="#">FindId</a>
                  </div>
               </div>
            </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->
        
        <!--================Login Box Area =================-->
        <section class="login_box_area p_120">
           <div class="container">
            <div class="row">
               <div class="col-lg-6">
                  <div class="login_box_img">
                     <div class="hover">
                        <h4>성공적으로 아이디를 찾았습니다!</h4>
                        <p>로그인을 통해 더 많은 사이트 혜택을 누려보세요.</p>
                     </div>
                  </div>
               </div>
               <div class="col-lg-6">
                  <div class="login_form_inner">
                     <h3>아이디 찾기 성공</h3>
                     <form class="row login_form" action="/meiri/findId.me" method="post" id="contactForm" novalidate="novalidate">
                        <div class="col-md-12 form-group">
                        <h4 style="text-align: center;"><%= member.getUserName() %> 님의 회원 아이디는 <br>
                           <%= member.getUserId() %> 입니다.</h4> <br><br>
                        </div>
                           <button class="btn submit_btn nav-link" onclick='login()'>로그인 하기</button>
                           <a href="/meiri/views/member/memberFindPwd.jsp">비밀번호 찾기</a>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
           </div>
        </section>
         <script>
      function login(){
         $('.login_form').attr("action","/meiri/views/member/memberLoginForm.jsp");
      }
      </script>
        
</body>
</html>