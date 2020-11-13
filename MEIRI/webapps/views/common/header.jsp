<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.meiri.jsp.member.model.vo.*"%>

<%
   Member m = (Member) session.getAttribute("member");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
<meta name="copyright" content="ninodezign.com">
<title>MEIRI</title>

<script type="text/javascript" src="/meiri/resources/js/jquery-3.5.1.js"></script>
<!-- favicon -->
<link rel="shortcut icon" href="/meiri/resources/images/meiri-logo2.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
   href="/meiri/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
   href="/meiri/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
   href="/meiri/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
   href="/meiri/resources/images/ico/apple-touch-icon-57-precomposed.png">

<!-- css -->
<link rel="stylesheet" type="text/css"
   href="/meiri/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
   href="/meiri/resources/css/materialdesignicons.min.css" />
<link rel="stylesheet" type="text/css"
   href="/meiri/resources/css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css"
   href="/meiri/resources/css/prettyPhoto.css" />
<link rel="stylesheet" type="text/css"
   href="/meiri/resources/css/unslider.css" />
<link rel="stylesheet" type="text/css"
   href="/meiri/resources/css/template.css" />
<style>
#userLoginBtn, #userJoinBtn {
   cursor: pointer;
}

.outer {
   width: 800px;
   height: min-height;
   background: white;
   color: black;
   margin-left: auto;
   margin-right: auto;
   margin-top: 50px;
}

.detailtable td {
   border: 2px solid #edeff1;
   background: white;
   color: black;
   padding-top: 25px;
   padding-bottom: 25px;
   padding-left: 30px;
}

.tableArea {
   border: none;
   background: white;
   color: black;
   width: 800px;
   height: 350px;
   margin-left: auto;
   margin-right: auto;
}

#content {
   height: 230px;
}

.main {
   height: min-height;
}

.detailtable .attr {
   background: #dedede;
   font-weight: bold;
}

.btn {
   width: 800px;
   align: center;
}

.btn button {
   padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
}

.btn button:hover {
   cursor: pointer;
}

.listArea td {
   padding-top: 15px;
   padding-bottom: 15px;
}

.listArea td:hover {
   cursor: pointer;
}

.title {
   margin-bottom: 50px;
}

.pagingArea {
   margin-top: 25px;
}

.tr {
   text-align: center;
}

#listArea tbody tr th {
   text-align: center;
}

#btn2 {
   padding: 0 15px;
   height: 30px;
   color: white;
   font-size: 15px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 15px;
   border: none;
}

.title:hover {
   cursor: pointer;
}

#loading_background {
   width: 100%;
   height: 100%;
   position: fixed;
   top: 0;
   left: 0;
   background-color: #0000002e;
   z-index: 9998;
}

#loading {
   width: 100%;
   height: 100%;
   position: fixed;
   top: 0;
   left: 0;
   z-index: 9999;
   display: flex;
   align-items: center;
   justify-content: center;
}

#loading>div {
   background-image: url('/meiri/resources/images/loading.gif');
   border-radius: 50%;
   background-size: cover;
   background-position: center;
   background-color: #efefef;
   width: 110px;
   height: 110px;
}

#loading_box {
   width: 100%;
   height: 100%;
   position: fixed;
   top: 0;
   left: 0;
   z-index: 9999;
   display: flex;
   align-items: center;
   justify-content: center;
}
</style>

</head>

<body data-target="#nino-navbar" data-spy="scroll">
   <div id="loading_box" style="display: none">
      <div id="loading_background"></div>
      <div id="loading">
         <div></div>
      </div>
   </div>
   <script>
      function showLoading() {
         $('#loading_box').show();
      }
      function hideLoading() {
         $('#loading_box').hide();
      }
   </script>


   <!-- Header -->
   <header>
      <div id="nino-headerInner">
         <div class="navbar-subheader">
            <%
               if (m == null) {
            %>
            <ul>
               <li><div id="userLoginBtn"
                     onclick="location.href='/meiri/views/member/memberLoginForm.jsp';">로그인</div></li>&nbsp;&nbsp;
               <li><div id="userJoinBtn"
                     onclick="location.href='/meiri/views/member/memberJoinForm.jsp';">회원가입</div></li>
            </ul>
            <%
               } else if (m != null && m.getUserId().equals("admin")) {
            %>
            <ul>
               <li><%=m.getUserName()%></li>
               <li><div id="userLoginBtn"
                     onclick="location.href='/meiri/views/admin/adminPage.jsp';">관리자페이지</div></li>&nbsp;&nbsp;
               <li><div id="userJoinBtn"
                     onclick="location.href='/meiri/logout.me';">로그아웃</div></li>
            </ul>
            <%
               } else {
            %>
            <ul>
               <li><%=m.getUserName()%></li>
               <li><div id="userLoginBtn"
                     onclick="location.href='<%=request.getContextPath()%>/mypage.my'">마이페이지</div></li>&nbsp;&nbsp;
               <li><div id="userJoinBtn"
                     onclick="location.href='/meiri/logout.me';">로그아웃</div></li>
            </ul>
            <%
               }
            %>
         </div>
         <nav id="nino-navbar" class="navbar navbar-default" role="navigation">
            <div class="container">
               <!-- Brand and toggle get grouped for better mobile display -->
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed"
                     data-toggle="collapse" data-target="#nino-navbar-collapse">
                     <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span> <span
                        class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand"
                     href='<%=request.getContextPath()%>/index.pl'"><img
                     src="/meiri/resources/images/meiri-logo.PNG" alt="" width=30px
                     height=30px style="margin-top: -5px;"/ ></a> <a
                     class="navbar-brand"
                     href='<%=request.getContextPath()%>/index.pl'"> <span
                     style="color: black">M<span style="color: #1f76bc">E</span><span
                        style="color: #f79521">I</span><span style="color: #1f76bc">R</span><span
                        style="color: #f79521">I</span></a>
               </div>

               <!-- Collect the nav links, forms, and other content for toggling -->
               <div class="nino-menuItem pull-right">
                  <div class="collapse navbar-collapse pull-left"
                     id="nino-navbar-collapse">
                     <ul class="nav navbar-nav">
                        <li><a href='<%=request.getContextPath()%>/index.pl'
                           " class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li>
                        <li><a href='<%=request.getContextPath()%>/index.pl'">Home
                              <span class="sr-only">(current)</span>
                        </a></li>
                        <li><a href='<%=request.getContextPath()%>/index.pl'
                           onmouseover="showhead_dept('head_dept02');"
                           onmouseout="hidehead_dept();">제품 정보</a></li>
                        <li><a href='<%=request.getContextPath()%>/index.pl'">본사
                              소개</a></li>
                        <li><a href='<%=request.getContextPath()%>/index.pl'">오시는
                              길</a></li>
                     </ul>
                  </div>
                  <!-- /.navbar-collapse -->
                  <ul class="nino-iconsGroup nav navbar-nav">
                     <li><a href='<%=request.getContextPath()%>/index.pl'"><i
                           class="mdi mdi-cart-outline nino-icon"></i></a></li>
                  </ul>
               </div>
            </div>
            <!-- /.container-fluid -->

         </nav>


      </div>
   </header>
   <!--/#header-->


   <!-- javascript -->
   <script type="text/javascript" src="/meiri/resources/js/jquery.min.js"></script>
   <script type="text/javascript"
      src="/meiri/resources/js/isotope.pkgd.min.js"></script>
   <script type="text/javascript"
      src="/meiri/resources/js/jquery.prettyPhoto.js"></script>
   <script type="text/javascript"
      src="/meiri/resources/js/bootstrap.min.js"></script>
   <script type="text/javascript"
      src="/meiri/resources/js/jquery.hoverdir.js"></script>
   <script type="text/javascript"
      src="/meiri/resources/js/modernizr.custom.97074.js"></script>
   <script type="text/javascript"
      src="/meiri/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
   <script type="text/javascript"
      src="/meiri/resources/js/unslider-min.js"></script>
   <script type="text/javascript" src="/meiri/resources/js/template.js"></script>
</body>