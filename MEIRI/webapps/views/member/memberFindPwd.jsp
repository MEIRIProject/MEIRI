<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<title>비밀번호 찾기</title>
<link href="/meiri/resources/css/common.css" rel="stylesheet"
   type="text/css">
<link href="/meiri/resources/css/main.css" rel="stylesheet"
   type="text/css">
<link href="/meiri/resources/fonts/webfonts/NotoKR-all/stylesheet.css"
   rel="stylesheet" type="text/css">
<style>
#title {
   font-size: 40px;
   font-weight: bold;
   color: #2c3e50;
}
</style>

</head>
<body>
   <%@ include file="/views/common/header.jsp"%>
   <!--================Home Banner Area =================-->
   <section class="banner_area" style="padding: 30px;">
      <div class="banner_inner d-flex align-items-center">
         <div class="container">
            <div class="banner_content text-center">
               <h2 id="title">비밀번호 찾기</h2>
            </div>
         </div>
      </div>
   </section>

   <!--================Login Box Area =================-->
   <div style="display: flex; justify-content: center;">
      <div>
         
               <div>
                  <div style="text-align: center; margin-bottom: 15px;">등록한 이름과 이메일 그리고 아이디를 정확히 입력해주세요.</div>
               </div>
               <div>
                  <div class="login_form_inner" style="padding-top: 55px; width:400px;">
                     <form class="row login_form" action="/meiri/findPwd.me"   method="post" id="contactForm" novalidate="novalidate">
                        <div class="form-group">
                           <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요.">
                        </div>
                        <div class="form-group">
                           <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요.">
                        </div>

                        <div style="display: flex;align-items: center;">
                           
                              <div style="width: 45%;">
                                 <input type="text" name="email1" id="email1" placeholder="이메일을 입력하세요" class="form-control" style="font-size: 13px; margin-right: 0px; max-width: 100%;">
                              </div>
                              <div style="width: 10%; text-align: center;">@</div>
                              <!-- 
                              <div>
                                 <input type="text" name="email2" id="email2" placeholder="naver.com" class="form-control" readonly="true" style="font-size: 13px;">
                              </div>
                               -->
                              <div style="width: 45%;">
                                 <select name="email3" id="email3" class="form-control"
                                    onclick="e_display();" style="font-size: 13px;">
                                    <option value="" selected>----</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="yahoo.com">yahoo.com</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                 </select>
                              </div>
                        
                        </div>
                        <div style="display: flex; justify-content: center; margin: 45px 0 85px 0;">
                           <button type="button" class="btn btn-info" id="check_give" style="font-size: 12px; font-weight: bold;">임시 비밀번호 발송</button>
                           <button type="button" class="btn btn-info" onclick="findId()" style="font-size: 12px; font-weight: bold; margin-left:10px">아이디 찾기</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>

   <script>
      function findPwd() {
         $('#loginForm').submit();
      }

      function findId() {
         location.href = "/meiri/views/member/memberFindId.jsp";
      }

      function e_display() {

         $('#u_email3').change(function() {
            $("#u_email3 option:selected").each(function() {
               if ($(this).val() == '1') {
                  //직접입력일 경우
                  $("#u_email2").val('');
                  //값 초기화 
                  $("#u_email2").attr("readonly", false);

               } else { //직접입력이 아닐경우 
                  $("#u_email2").val($(this).text());
                  $("#u_email2").attr("readonly", true);
               }
            });
         });

         //활성화 
         //선택값 입력 

      }

      function checkCode() {
         var v1 = $("#email_check2").val();
         var v2 = $("#hide_check").val();
         if (v1 != v2) {
            /*  document.getElementById("hide_msg").style.color = "red";
             document.getElementById("hide_msg").innerHTML = "잘못된인증번호"; */
            alert("잘못된 비밀번호입니다.");

         } else {
            /* document.getElementById("hide_msg").style.color = "blue";
            document.getElementById("hide_msg").innerHTML = "인증되었습니다.";  */
            alert("비밀번호가 확인되었습니다.");

            $("#reg_ok").attr("disabled", false);
            $("#check_take").attr("disabled", true).text('입력 완료!').css({
               border : "gray",
               background : "gray",
               color : "white"
            });

            $("#check_give").attr("disabled", true).css({
               border : "gray",
               background : "gray",
               color : "white"
            });
            ;

         }
      }
   <%!public int getRandom() {
      int random = 0;
      random = (int) Math.floor((Math.random() * (999999 - 100000 + 1))) + 100000;
      return random;
   }%>
      $('#check_give').click(function() {
         showLoading();

         var userName = $('#userName').val();
         var userId = $('#userId').val();
         var email1 = $('#email1').val();
         var email2 = $('#email3').val();

         $.ajax({
            url : "/meiri/pwdCheck.me",
            type : "post",
            //data : { email : email , checkCode : checkCode},
            data : {
               'userName' : userName,
               'userId' : userId,
               'email1' : email1,
               'email2' : email2
            },
            complete : function(data) {

            },
            success : function(data) {
               if (data.ok) {
                  alert(data.message);
               } else {
                  alert('error');
               }
               hideLoading();
            },
            error: function(){
               hideLoading();
            }

         });

      });
   </script>
   <!--================End Login Box Area =================-->
   <%@ include file="/views/common/footer.jsp"%>

</body>
</html>