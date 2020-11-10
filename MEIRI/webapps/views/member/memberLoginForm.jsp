<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<title>로그인</title>
<style>
 .title{
   color :  navy
 };
 
 .serch{
    width100%; height:40px; border-bottom:1px dashed #999;
    box-sizing:border-box; line-height: 40px; text-align:center;
    margin-bottom: 20px;
 }
 
 .serch span{
    font-size: 11px; color: #999; 
 }
 
 .serch a{
    font-size:12px; text-decoration:none; background-color: #333;
    color: #fff; padding: 3px 5px; border-radius: 3px; margin-left: 5px;
 }
 
</style>
</head>
<body>




<form id="login" action="/meiri/login.me" method="post" >
<table align="center">

<br /><br /><br /><br /><br />

<div class="titleArea" align="center">
<h1 class="title">Login</h1>
</div>

<tr>

 <td align="center"><input type="text" name="userId" id="userId" required="required"
      placeholder="아이디" ></td>
</tr>
<tr>
 <td align="center"><input type="password" id="password" name="password" required="required"
      placeholder="비밀번호"></td>
</tr>

</table>

<br /><br />

<div class="search">
<span class="text">아이디 또는 비밀번호를 잊으셨나요?</span>
<a href="/meiri/views/member/memberFindId.jsp">ID 찾기</a>
<a href="/meiri/views/member/memberFindPwd.jsp">PW 찾기</a>

</div>

<div align="center" >
   <input type="submit" value="로그인" 
    > &emsp;
   <input type="button" value="회원가입" 
   onclick="location.href='memberJoinForm.jsp'" >
</div>
</form>

</body>
</html>