	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<title>마이페이지</title>

<style>

	body{
 	text-align: center; 
 	overflow-x:hidden;
	}
	
	#btn1{ width:200px; height:160px; } 
	#btn2{ width:200px; height:160px; } 
	#btn3{ width:200px; height:160px; } 
	#btn4{ width:200px; height:160px; } 
	#btn_group button{ border: 1px solid skyblue; background-color: rgba(0,0,0,0); color: skyblue; padding: 5px; margin:auto;} 
	#btn_group button:hover{ color:white; background-color: skyblue; }
	
	
	<!-- ------------------------------------------------- -->
	
	html,
      body {
        margin: 0;
        padding: 0;
      }
      .blind {
        position: absolute;
        top: 0;
        left: 0;
        width: 1px;
        height: 1px;
        margin: -1px;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
      }

      header {
        border-bottom: 1px solid #000;
      }
      a {
        text-decoration: none;
      }
      .side_toggle_btn::before {
        content: "OPEN";
        width: 50px;
        line-height: 50px;
        font-size: 24px;
        text-align: center;
        border-right: 1px solid #000;
      }

      .side_input:checked + .side_toggle_btn::before {
        content: "CLOSE";
      }

      .side_input:checked ~ .side_list {
        left: 0;
      }

      .side_list {
        position: fixed;
        left: -200px;
        top: 30px;
        bottom: 0;
        border-right: 1px solid #000;
        width: 200px;
        font-size: 24px;
        transition: 0.3s ease-in;
      }

      .side_link {
        display: block;
        text-align: center;
        padding: 40px 0;
        border-bottom: 1px solid #000;
      }
	
	
</style>

</head>

<body>
	
	<!-- header 삽입 -->
	<br />
	<br />
	<br />
	<br />


	<!-- 오픈버튼 사이드 메뉴바에 붙혀야됌 -->
	
	<input type="checkbox" id="side_btn" class="side_input blind" />
      <label for="side_btn" class="side_toggle_btn"></label>
      <div class="side_list">
        <a href="#" class="side_link">개인 정보 수정</a>
        <a href="#" class="side_link">작성한 리뷰 확인</a>
        <a href="#" class="side_link">작성한 댓글 확인</a>
        <a href="#" class="side_link">문의 내용 확인</a>
        <a href="#" class="side_link">장바구니</a>
        <a href="#" class="side_link">주문조회</a>
      </div>
      
   <!-- -------------------------------------------------------------- -->
		
	<div id="btn_group">	<!-- onclick 추가 -->
		<button id="btn1" onclick="">F&A<br><span>자주묻는질문</span></button> 
		<button id="btn2" onclick="">Q&A<br><span>질문과 답변</span></button>
		<button id="btn3" onclick="">NOTICE<br><span>공지사항</span></button> 
		<button id="btn4" onclick="">MYPAGE<br><span>내 정보</span></button>  
	</div>
		
	
	
	<script>
		
	</script>
	
	<br /><br />
	
	<!-- footer 삽입 -->
	
</body>


</html>