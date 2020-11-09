<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.notice.model.vo.*,
                          java.util.*"%>

<% Notice n = (Notice)request.getAttribute("notice"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style>
   .outer{
      width:800px;
      height:500px;
      background:white;
      color:black;
      margin-left:auto;
      margin-right:auto;
        
      margin-top:50px;
   }
   td {
      border:2px solid #edeff1;
      background : white;
      color: black;
        padding-top:25px;
        padding-bottom: 25px;
        padding-left: 30px;

   }

   .tableArea {
      border: none;
      background : white;
      color: black;
      width:800px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   #content {
      height:230px;
   }
    .attr{
        background: #dedede;
        font-weight: bold;
    }
    .btn button{
    padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
}
    .btn button:hover{
       cursor:pointer;
    }
    
</style>
</head>
<body>

   <div class="outer">
      <br>
      <h2 align="center">공지사항 상세보기</h2>
      <div class="tableArea">
            <table align="center" width="800px">
               <tr>
                  <td class="attr">제목 </td>
                  <td colspan="5"><span><%= n.getNtitle() %></span></td>
               </tr>
               <tr>
                  <td class="attr">작성자 </td>
                  <td><span><%= n.getAdminid() %></span></td>
                  <td class="attr">작성일</td>
                  <td><span><%= n.getNdate() %></span></td>
               </tr>
               
               
               <tr>
                  <td colspan="6">
                     <p id="content"><%= n.getNcontent() %>
                  </td>
               </tr>
            </table>
            <br>
        </div>
        <br><br><br><br>
      <div class="btn" align="center">
         <button onclick="location.href='<%= request.getContextPath() %>/noticeList.no'">돌아가기</button>
         <!-- if(m != null && m.getUserName().equals(b.getBwriter())) -->
      <!-- if문으로 관리자 페이지만 (header 구현 후 작성할 것)-->
         <button onclick="location.href='<%= request.getContextPath() %>/nUpView.no?nno='+<%=n.getNno()%>">수정하기</button>
      </div>
   </div>

</body>
</html>