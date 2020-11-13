<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
<link href="/meiri/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/fonts/webfonts/NotoKR-all/stylesheet.css" rel="stylesheet" type="text/css">
<style>
#title{
    font-size: 40px;
    font-weight: bold;
    color: #2c3e50;
}


</style>
<link href="/meiri/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/fonts/webfonts/NotoKR-all/stylesheet.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
  <!--  ================Home Banner Area =================-->
        <section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
            <div class="container">
               <div class="banner_content text-center">
                  <div id="title" align="center">아이디 찾기 </div>
                  <div class="page_link">
                     
                  </div>
               </div>
            </div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->
        
        <!--================Login Box Area =================-->
       
           <div style="margin:0 0 50px 0" >
            <div class="row">            
               <div class="">
                  <div class="login_form_inner">
                     <div style="text-align: center;margin-bottom: 15px;">등록한 이름과 이메일을 정확히 입력해주세요.</div>
                     <div style="display: flex;justify-content: center;">
                        <div style="width: 243px;">
                           <form class="row login_form" action="/meiri/findId.me" method="post" id="contactForm" novalidate="novalidate"
                           onsubmit="return validate()">
                              <div class="col-md-12 form-group">
                                 <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요.">
                              </div>
                              <div class="col-md-12 form-group">
                                 <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
                              </div>
                              <div class="col-md-12 form-group">
                                 <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-info" onclick='findId()'>아이디 찾기</button>
                                 
                                    <button style="margin-left:25px" type="button" class="btn btn-info" onclick='findPwd()'>비밀번호 찾기</button>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                     
                  </div>
               </div>
            </div>
           </div>
    
        
        <script src="/meiri/index.jsp"></script>
   
   <script>
        /* function validate() {
      var u_name = document.getElementById("u_name");
      var u_email = document.getElementById("u_email");
      
      if(u_name.value=="") {
            alert("이름을 입력해 주세요");
            u_name.focus();
            return false;
        } 
      if(u_email.value=="") {
            alert("이메일을 입력해 주세요");
            u_email.focus();
            return false;
        } 
       
    }  */
   function findId(){
      $('#contactForm').submit();
      event.preventDefault();
      <%-- location.href="<%=request.getContextPath()%>/findId.me"; --%>
   }
    
    function findPwd(){
       location.href="/meiri/views/member/memberFindPwd.jsp";
    }
   

      </script>
      <script type="text/javascript">
      function validate() {
         var name = document.getElementById("userName");
         var email = document.getElementById("email");
         
         if(name.value=="") {
               alert("이름을 입력해 주세요");
               name.focus();
               return false;
           } 
         if(email.value=="") {
               alert("이메일을 입력해 주세요");
               email.focus();
               return false;
           }
          
      }
      </script>
      
        <%@ include file="/views/common/footer.jsp" %>    


</body>
</html>