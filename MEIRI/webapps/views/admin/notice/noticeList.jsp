<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.notice.model.vo.*, java.util.*" %>
<%@ page import="com.meiri.jsp.common.PageInfo" %>
<%
   ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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
<title>공지사항 목록</title>
<style>
   .title h1{
        color : #231d20;
        margin-bottom: 70px;
    }
   .main{
        width : 600px;
        display: inline-block;
        margin-left: 350px;
    }
    .tableArea{
        margin-left:20px;
    }
    .hr2{
        border: none;
       border-top: 2px solid #edeff1;
        margin-bottom:35px;
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
     .btnArea button{
    padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
}
    .btnArea button:hover{
       cursor:pointer;
    }
    
</style>   
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>

<br><br><br>
<div class="main">
   <div class="outer">
        <div class="headerArea">
            <div class="title">
                <h1>공지사항(Notice)</h1>
            </div>
        </div>
        <hr style="width:1000px; margin-bottom:35px">
    
     <% for(Notice b : list) { %>
           
     
        <div class="tableArea">
            <div class="contentArea">
                <h3 class="title"><%= b.getNtitle() %>    <input type="hidden" value="<%= b.getNno() %>"> </h3>
            </div>
            <div class="subcontentArea">
                <p>작성일 : <%= b.getNdate() %> | 글 번호 : <%= b.getNno() %>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    작성자 : <%= b.getAdminid() %> </p>
            </div>
        </div> 
    <hr class="hr2">
    <% } %>
    

      
      
      
   </div>

</div>
      
      <%-- 페이지 처리 코드 넣기 --%>
      
      <div class="pagingArea" align="center">
      
      <button onclick="location.href='<%= request.getContextPath() %>/noticeList.no?currentPage=1'"><<</button>
         <%  if(currentPage <= 1){  %>
         <button disabled><</button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/noticeList.no?currentPage=<%=currentPage - 1 %>'"><</button>
         <%  } %>
         
         <% for(int p = startPage; p <= endPage; p++){
               if(p == currentPage){   
         %>
            <button disabled><%= p %></button>
         <%      }else{ %>
            <button onclick="location.href='<%= request.getContextPath() %>/noticeList.no?currentPage=<%= p %>'"><%= p %></button>
         <%      } %>
         <% } %>
            
         <%  if(currentPage >= maxPage){  %>
         <button disabled>></button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/noticeList.no?currentPage=<%=currentPage + 1 %>'">></button>
         <%  } %>
         <button onclick="location.href='<%= request.getContextPath() %>/noticeList.no?currentPage=<%= maxPage %>'">>></button>
      
      </div>
      
      <div class="btnArea" align="center">
         
         <br><br>
            <button onclick="location.href='index.jsp'">
               돌아가기
            </button>
            <!-- if문으로 관리자 페이지만 (header 구현 후 작성할 것)-->
            <button onclick="location.href='views/admin/notice/noticeInsertForm.jsp'">
               작성하기
            </button>
            
            <button onclick="location.href='views/admin/adminPage.jsp'">
               관리자 페이지
            </button>
            
            <script>
               $(function(){
                  $('.title').click(function(){
                     var nno = $(this).find('input').val();
                     location.href = "<%= request.getContextPath() %>/noticeOne.no?nno=" + nno;
                                                      
                  });
               });
            </script>
               
      </div>
      
   </div>

</body>
</html>



