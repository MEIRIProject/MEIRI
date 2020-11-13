<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

	<style>
		body{
	 	text-align: center; 
	 	overflow-x:hidden;
		}
		
		#btn1{ width:200px; height:160px; } 
		#btn8{ width:200px; height:160px; } 
		#btn3{ width:200px; height:160px; } 
		#btn4{ width:200px; height:160px; } 
		#btn_group button{ border: 1px solid skyblue; background-color: rgba(0,0,0,0); color: 1f76bc; padding: 5px; margin:auto;} 
		#btn_group button:hover{ color:white; background-color: skyblue; }
	
	body, html{width:100%;height: 100%;}
	
    .header{
        width: 100%;
        height: 50px;
        background: #f79521;
        
    }
    .menu_btn{
        text-align: right;
        padding: 10px;
    }
    .menu_bg{
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.7);
        position: absolute;
        top:0;
        display: none;
    }
    .sidebar_menu{
        width: 10%;
        height: 100%;
        background:#1f76bc;
        position: fixed;
        top:10%;
        right: -50%;
        
    }
  
    .close_btn{
        width: 25px;
        height: 25px;
        margin:10px;
    }
    .close_btn > a{
        display: block;
        width: 100%;
        height: 100%;
    }
    .menu_wrap{
        list-style: none;
        padding: 20px 20px;   
       
    }
    .menu_wrap li a{
        color: #fff;
        text-decoration: none;
    }
	
	#a{
	cursor:pointer;
	}
	</style>
	
	

</head>


<body>

	<%@ include file="../common/header.jsp" %>
	

    <div class="header">
        <div class="menu_btn"><a href="#">       
        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjQgNmgtMjR2LTRoMjR2NHptMCA0aC0yNHY0aDI0di00em0wIDhoLTI0djRoMjR2LTR6Ii8+PC9zdmc+">
        </a>
        </div>
	</div>
	<div class="menu_bg"></div>
	<div class="sidebar_menu">
	     <div class="close_btn"><a href="#">       
	         <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjMuOTU0IDIxLjAzbC05LjE4NC05LjA5NSA5LjA5Mi05LjE3NC0yLjgzMi0yLjgwNy05LjA5IDkuMTc5LTkuMTc2LTkuMDg4LTIuODEgMi44MSA5LjE4NiA5LjEwNS05LjA5NSA5LjE4NCAyLjgxIDIuODEgOS4xMTItOS4xOTIgOS4xOCA5LjF6Ii8+PC9zdmc+">
	         </a>
	     </div>
	     <ul class="menu_wrap">
	          <li><a href="<%=request.getContextPath()%>/mypagemyreview.my">작성한 리뷰 확인</a></li>
	          <br />
	          <li><a href="#">작성한 댓글 확인</a></li>
	          <br />
	          <li><a href="#">문의 내용 확인</a></li>
	          <br />
	          <li><a id="a" onclick="basketShopping()">장바구니</a></li>
	          <br />
	          <li><a href="#">주문조회</a></li>
	     </ul>
	</div>
	
	<script>
		function basketShopping() {
			
			var userid = 'user01';
            location.href = "<%= request.getContextPath() %>/selectCart.ca?userid=" + userid;
		}
	</script>
	
	<br />
	<br />
	<br />
	<div id="btn_group">	
		<button id="btn1" onclick="">F&A<br><span>자주묻는질문</span></button> 
		<button id="btn8" onclick="">Q&A<br><span>질문과 답변</span></button>
		<button id="btn3" onclick="">NOTICE<br><span>공지사항</span></button> 
		<button id="btn4" onclick="location.href='views/member/memberUpdateForm.jsp'">MYPAGE<br><span>내 정보</span></button>  
	</div>
	
	<script>
    $(document).ready(function(){
 
        $('.menu_btn>a').on('click', function(){
            $('.menu_bg').show(); 
            $('.sidebar_menu').animate({
                right:0
            });  
        });
        $('.close_btn>a').on('click', function(){
            $('.menu_bg').hide(); 
            $('.sidebar_menu').animate({
                right: '-' + 50 + '%'
                        });  
        });
 
    });
    
    
	</script>
	<br />
	<br />
	<br />
	
	<%@ include file="/views/common/footer.jsp" %> 
	
</body>
</html>
    
