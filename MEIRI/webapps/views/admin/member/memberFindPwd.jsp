<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.member.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<title>비밀번호 찾기</title>
</head>
<body>
<%-- 여기도 마찬가지 수정 중 --%>
<!--================Home Banner Area =================-->
        <section class="banner_area">
            <div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>Login/Register</h2>
						<div class="page_link">
							<a href="#">Home</a>
							<a href="#">FindPwd</a>
						</div>
					</div>
				</div>
            </div>
        </section>
        
         <!--================Login Box Area =================-->
        <section class="login_box_area p_120">
        	<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="login_box_img">
							<img class="img-fluid" src="" alt="">
							<div class="hover">
								<h4>비밀번호를 찾으십니까?</h4>
								<p>회원가입 시 이메일과 아이디를 정확히 <br>
								입력해주세요.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="login_form_inner" style=" padding-top: 55px;">
							<h3 style="margin-bottom: 20px;">비밀번호 찾기</h3>
							<form class="row login_form" action="/meiri/findPwd.me" method="post" id="contactForm" novalidate="novalidate">
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" id="name" name="userId" placeholder="아이디를 입력하세요.">
								</div>
								<!-- <div class="col-md-12 form-group">
									<input type="text" class="form-control" id="name" name="u_email" placeholder="이메일을 입력하세요.">
								</div> -->
								
								<div class="form-group">
                           <div class="col-md-12 row form-group" style="padding-right: 0px;">
                              <div class="col-5" style="max-width: 100%;">
                                 <input type="text" name="email1" id="email1"
                                    placeholder="E-mail" class="form-control"  style= "font-size:13px; margin-right: 0px; max-width: 100%;">
                              </div>
                              @
                              <div class="col-3" style="padding-right: 3px; padding-left: 5px;">
                                 <input type="text" name="email2" id="email2"
                                    placeholder="naver.com" class="form-control" readonly="true" style= "font-size:13px;">
                              </div>
                              <div class="col-3" style="padding-right: 0px; padding-left: 0px; width: 95%; margin-top: 10px">
                                 <select name="email3" id="email3" class="form-control" onclick= "e_display();" style= "font-size:13px;">
                                   <option value="" selected>----</option>
                                   <option value="naver.com" selected>naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="yahoo.com">yahoo.com</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="nate.com">nate.com</option>
                                    <option value="1" >-직접 입력-</option>
                                  
                                 </select>
                              </div>
                              <div class="col-3"  id = "e_check">
                              
                              </div>                
                           </div>                        
                        </div>								
								<div class="col-md-12 form-group">
									<button class="btn submit_btn" onclick="findPwd();">비밀번호 찾기</button>
									<a href="/meiri/views/member/memberFindId.jsp">아이디 찾기</a>
								</div>
							</form>
						</div>
					</div>
				</div>
        	</div>
        </section>
        <script>
		function findPwd(){
			$('#loginForm').submit();
		}
		
		function e_display(){
			   
		    
		    $('#u_email3').change(function(){ $("#u_email3 option:selected").each(function () 
		          { if($(this).val()== '1'){ 
		       //직접입력일 경우
		        $("#u_email2").val('');
		      //값 초기화 
		        $("#u_email2").attr("readonly",false); 
		       
		          }else{ //직접입력이 아닐경우 
		             $("#u_email2").val($(this).text());
		             $("#u_email2").attr("readonly",true);  
		             } 
		          }); 
		    });
		          
		       //활성화
		       //선택값 입력 

		    
		 
		}
		
		/* 수정 중
		
		function check(){
			
			var id = document.getElementById("userId");
			var email = document.getElementById("email");
			
		
			var v1 = $("userId").val();
			var v2 = $("email").val();
			
			if{(v1 == "userId" && v2 == "email") 
			  return '비밀번호 발송'
			  }  else {
				  return '아이디 혹은 이메일이 일치하지 않습니다.'
			  } else{
				  return '등록된 회원정보 없음'
			  };
			  };
		*/

		$('#check_give').click(function(){
		   
		   var email1 = $('#u_email1').val();
		   var email2 = $('#u_email2:last').val();
		   var checkCode = $('#hide_check').val();
		   
		   
		   var email = email1+'@'+email2;
		   
		   console.log(email);
		   
		   
		   $.ajax({
		      url : "/meiri/emailCheck.me",
		      type : "post",
		      data : { email : email , password : password},
		      complete : function(data) {
		         alert("비밀번호가 이메일로 발송되었습니다.");
		      } ,
		      success : function(data) {

		         

		      }

		   });

		});
		</script>
        <!--================End Login Box Area =================-->

</body>
</html>