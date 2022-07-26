<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
<link href="/meiri/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/fonts/webfonts/NotoKR-all/stylesheet.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<form id="login" action="/meiri/login.me" method="post">
    <div class="wrap">
        <p class="sub_title">로그인</p>
        <div class="join_ul_box">
            <ul class="join_ul">
                <li>
                    <p>ID</p>
                    <input type="text" name="userId" id="userId" required="required" placeholder="아이디를 입력해 주세요">
                </li>
                <li>
                    <p>비밀번호</p>
                    <input type="password" name="password" id="password" required="required" placeholder="패스워드를 입력해 주세요">
                </li>
            </ul>
            <button class="join_btn" type="submit" >로그인하기</button>
            <div class="two_btn">
                <button type="button" class="btn btn-info" onclick="find_id();">ID찾기</button>
                <button type="button" class="btn btn-info" onclick="find_pwd();">PW찾기</button>
            </div>
        </div>
        
    </div>
    </form>
    
    <script>
    
    function find_id(){
        location.href='/meiri/views/member/memberFindId.jsp';
     };
     
     function find_pwd(){
         location.href='/meiri/views/member/memberFindPwd.jsp';
      };
    
    </script>
       
    
    
    
    
    
    
    <%@ include file="/views/common/footer.jsp" %>    
    
    
    
</body>
</html>