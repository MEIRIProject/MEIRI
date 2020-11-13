<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.review.model.vo.*, java.util.*,
                          com.meiri.jsp.review.model.vo.ReviewView" %>
<%@ page import="com.meiri.jsp.common.PageInfo" %>
<%
   ArrayList<ReviewView> list = (ArrayList<ReviewView>)request.getAttribute("list");
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
<title>리뷰 목록</title>
<style>
 /* .title h1{
        color : #231d20;
        margin-bottom: 70px;
    }
    .outer{
    width:600px;
    height:min-height;
    }
    
   .main{
        width : 600px;
        display: inline-block;
        margin-left: 350px;
    }
    .tableArea{
        margin-left:20px;
      width:1000px;
      
    }
    .pagingArea{
       hieght:300px;
       
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
    
    .subcontentArea{
    width:1500px;
    }
   .btnArea{
      width:1000px;
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
   align: center;
}
    .btnArea button:hover{
       cursor:pointer;
    }
    #listArea{
       text-align:center;
    }
    #listArea tr {
       height:30px;
    }
    .pagingArea{
    width:1000px;
   
    }
    button:hover{
    cursor:pointer;
    } */
</style>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

   <br><br><br>
<div class="main">
   <div class="outer">
        <div class="headerArea">
            <div class="title">
                <h1>리뷰 목록</h1>
            </div>
        </div>
      <hr style="width:1000px; margin-bottom:35px">
      
      <div class="tableArea">
         <table align="center" id="listArea">
            <tr>
               <th width="80px">리뷰번호</th>
               <th width="80px">제품번호</th>            
               <th width="100px">작성자</th>               
               <th width="100px">작성일</th>               
               <th width="200px">리뷰내용</th>
               <th width="200px">리뷰사진</th>
               <th width="100px"></th>
            </tr>
            <!-- <% for(ReviewView b : list) { %> -->
            <tr class="tr">
               <!-- 공지사항 DB테이블 보고 만들 예정 -->
               <input type="hidden" id="rno" name="rno" value="<%= b.getRcode() %>">
               <td><%= b.getRcode() %></td>
               <td><%= b.getPcode() %></td>
               <td><%= b.getUserid() %></td>
               <td><%= b.getRdate() %></td>
               <td><%= b.getRcontent() %></td>
               <td>
                  <% if (b.getChangename() != null) {%>
                  <img src="<%=request.getContextPath() %>/resources/reviewUploadFiles/<%= b.getChangename() %>"
                      width="200px" height="150px"/>
                <% } else { %>
                  사진 없음
               
                  <% } %> 
                  
               </td>
               
               <td><button onclick="deleteReview()" id="deleteReview <%= b.getRcode()%>">삭제</button></td>
               
            </tr>
            
            <!-- <% } %> -->
         
         </table>
         <hr class="hr2">
         <%-- 페이지 처리 코드 넣기 --%>
      
      <div class="pagingArea" align="center">
      
      <button onclick="location.href='<%= request.getContextPath() %>/reviewList.re?currentPage=1'"><<</button>
         <%  if(currentPage <= 1){  %>
         <button disabled><</button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/reviewList.re?currentPage=<%=currentPage - 1 %>'"><</button>
         <%  } %>
         
         <% for(int p = startPage; p <= endPage; p++){
               if(p == currentPage){   
         %>
            <button disabled><%= p %></button>
         <%      }else{ %>
            <button onclick="location.href='<%= request.getContextPath() %>/reviewList.re?currentPage=<%= p %>'"><%= p %></button>
         <%      } %>
         <% } %>
            
         <%  if(currentPage >= maxPage){  %>
         <button disabled>></button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/reviewList.re?currentPage=<%=currentPage + 1 %>'">></button>
         <%  } %>
         <button onclick="location.href='<%= request.getContextPath() %>/reviewList.re?currentPage=<%= maxPage %>'">>></button>
      
      </div>
      <div class="btn" align="center">
         
         <br><br>
         
         <button onclick="location.href='views/admin/adminPage.jsp'">
               관리자 페이지
         </button>
            
            <script>
               $(function(){
                  $('button[id^="deleteReview"]').click(function(){
                     var rno = $(this).parent().parent().children().eq(0).val();
                     
                     location.href = '<%= request.getContextPath()%>/rDelete.re?rno=' + rno;
                  });
               })
               
            </script>
               
      </div>
      </div>
      
      
      
   
      
   </div>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>




