    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.inquiry.model.vo.*, java.util.*" %>
<%@ page import="com.meiri.jsp.common.PageInfo" %>
<%
   ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1상담문의 목록</title>
<style>
   /*   .title h1{
        color : #231d20;
        margin-bottom: 70px;
    }
   .main{
        width : 600px;
        display: inline-block;
        margin-left: 350px;
    }
    .outer{
    	height:min-height;
    }
    .tableArea{
        margin-left:20px;
    }
    .hr2{
        border: none;
       border-top: 2px solid #edeff1;
        margin-top:35px; 
        width:1000px;
    }
    .title:hover{
    cursor:pointer;
    }    
    .tableArea:hover{
    opacity: 70%;
    }
    .subcontentArea{
    width:1500px;
    }
    .btn{
   padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
  margin-top:15px;
   */
 }
</style>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<br><br><br>
<div class="main">
     <div class="outer">
         <div class="title">
             <h1>문의 목록</h1>
          </div>
          <hr style="width:1000px"; margin-bottom:35px">
       <% for( Inquiry b : list ) { %>       
       <div class="listArea">
           <div class="contentArea">
               <h3 class="title"><%= b.getInqtitle() %>     <input type="hidden" value="<%= b.getInqno() %>"></h3>
           </div>
           <div class="subcontentArea">
               <p>글 번호 : <%= b.getInqno() %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   작성자 : <%= b.getInqwriter() %> </p>
           </div>
       </div> 
   <hr class="hr3">
            <% } %>

			<div class="btn" align="right">

				<br>
				<br>
				  <% if( m != null && m.getUserId().equals("admin")){ %>
				<button
					onclick="location.href='<%= request.getContextPath() %>/views/admin/adminPage.jsp'">관리자
					페이지</button>
					<% } %>
					 <button onclick="location.href='index.pl'">
               돌아가기
            </button>
				<script>
                        $(function(){
                            $('.title').click(function(){
                                var inqno = $(this).find('input').val();
                                location.href = "<%= request.getContextPath() %>/inquiryOne.in?inqno=" + inqno;
                                                                            
                            });
                        });
                    </script>

			</div>

		</div>

</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>





    
