<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<title>아이디 찾기</title>
</head>
<body>
<%-- 코드 완전 다름 나중에 수정할 것 --%>
  <!--  ================Home Banner Area =================-->
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
							<img class="img-fluid" src="/cosme/resources/img/login_3.png" alt="">
							<div class="hover">
								<h4>아이디를 찾으십니까?</h4>
								<p>회원가입 시 등록한 이름과 이메일을 정확히 입력해주세요.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="login_form_inner">
							<h3 style="margin-bottom: 20px;">아이디 찾기</h3>
							<form class="row login_form" action="/meiri/findId.me" method="post" id="contactForm" novalidate="novalidate"
								onsubmit="return validate()">
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" id="name" name="userName" placeholder="이름을 입력하세요.">
								</div>
								<div class="col-md-12 form-group">
									<input type="text" class="form-control" id="name" name="email" placeholder="이메일을 입력하세요.">
								</div>
								<div class="col-md-12 form-group">
									<button class="btn submit_btn" onclick='findId()'>아이디 찾기</button>
									<a href="/meiri/views/member/memberFindPwd.jsp">비밀번호 찾기</a>
								</div>
							</form>
						</div>
					</div>
				</div>
        	</div>
        </section>
        
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
	

		</script>
		<script type="text/javascript">
		/* function validate() { */
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
	    	
	    /* } */ 
		</script>
		
		


</body>
</html>