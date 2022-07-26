<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.member.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		min-width: 500px; min-height: 200px; font-size: 18px;
		margin-left: auto; margin-right: auto; margin-top: 5%; margin-bottom: 50px;
	}
	.Btn2{
		font-size: 14px; color:#fff; 
		background-color:  #2c3e50; width:200px; height:40px;
	}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>



		<br><br><br><br>
	<div class="outer">
		<br><br><br><br>
		<h3 align="center"><%= m.getUserId() %>님 메이리를 이용해주셔서 감사합니다.</h3>
	

		<br><br><br><br>
		<div align="center">
			<button class="Btn2" onclick="location.href='<%= request.getContextPath() %>'">홈으로 돌아가기</button>
		</div>
	</div>

		<br><br><br><br>

<%@ include file="../common/footer.jsp" %>

</body>
</html>