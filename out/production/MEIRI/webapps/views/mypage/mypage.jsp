<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MY PAGE</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css">
    <link href="/meiri/resources/css/common2.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/css/main2.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/fonts/webfonts/NotoKR-all/stylesheet.css" rel="stylesheet" type="text/css">
    
    <style>
    #a{
    cursor:pointer;
    }
    </style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
    <header class="header2">
        <a href="#" class="logo"><img src="/meiri/resources/images/meiri.png" alt="로고" height="50">MY PAGE</a>
        <button class="menu_btn"><i class="fas fa-bars"></i></button>
    </header>
    <div class="test_main_height">
        <div class="menu_box open">
            <ul>
                <li><a href="<%=request.getContextPath()%>/mypagemyreview.my">작성한 리뷰 확인</a></li>
                <li><a href="#none">작성한 댓글 확인</a></li>
                <li><a href="#none">문의 내용 확인</a></li>
                <li><a id="a" onclick="basketShopping()">장바구니</a></li>
                <li><a href="#none">주문 조회</a></li>
            </ul>
        </div>
        <div class="wrap ">
            
            <ul class="mypage_btn_ul">
                <li>
                    <button id="mp__btn1">
                        <p>
                            F&A<br>
                            자주 묻는 질문
                        </p>
                    </button>
                </li>
                <li>
                    <button id="mp__btn2">
                        <p>
                            Q&A<br>
                            질문과 답변
                        </p>
                    </button>
                </li>
                <li>
                    <button id="mp__btn3">
                        <p>
                            NOTICE<br>
                            공지사항
                        </p>
                    </button>
                </li>
                <li>
                    <button id="mp__btn4" onclick="location.href='views/member/memberUpdateForm.jsp'">
                        <p>
                            MY PAGE<br>
                            내 정보
                        </p>
                    </button>
                </li>
            </ul>
            
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script>
    
        $(".menu_btn").click(function(){
            $(".menu_box").toggleClass("open")
        })
        
        
            

      function basketShopping() {
         
         var userid = 'user01';
            location.href = "<%= request.getContextPath() %>/selectCart.ca?userid=" + userid;
      }
   </script>
    
      <%@ include file="/views/common/footer.jsp" %>  
</body>
</html>