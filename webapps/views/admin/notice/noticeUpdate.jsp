<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.notice.model.vo.*"%>
 <% Notice n = (Notice)request.getAttribute("notice"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    margin-top:40px;
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
    .none{
    border-left:1px solid white    ;   

    border-right:1px solid white;

    border-top:1px solid white;

    border-bottom:1px solid white;

    }
    
</style>
<title>공지사항 수정 화면</title>
</head>
<body>
   <div class="outer">
      <br>
      <h2 align="center">게시글 수정 페이지</h2>
      <div class="tableArea">
            <form id="updateForm" method="post">
            <table align="center" width="1288px">
               <tr>
                  <td class="attr">제목 </td>
                    <td colspan="3">
                     <input type="text" class="none" size="65" name="title" 
                           value="<%=n.getNtitle() %>">
                     <input type="hidden" name="nno" value="<%=n.getNno()%>">
                  </td>
               </tr>
               <tr>
                  <td class="attr">작성자 </td>
                   <td colspan="3" class="none"><%= n.getAdminid() %></td>
                  
               </tr>
               
               
               <tr>
                  <td colspan="3">
                     <textarea class="none" name="content" cols="100" rows="15" style="resize:none;"><%=n.getNcontent() %></textarea>
                  </td>
               </tr>
            </table>
            <br>
        </div>
        <br><br><br><br>
      <div class="btn" align="center">
               <button onclick="complete();">작성완료</button>
               <button onclick="deleteNotice();">삭제하기</button>
            </div>
         
            <script>
               function complete(){
                  $("#updateForm").attr("action","<%=request.getContextPath() %>/update.no");
               }
               
               function deleteNotice(){
                  $("#updateForm").attr("action","<%=request.getContextPath() %>/nDelete.no");
               }
            
            </script>
   </form>
   </div>
   </div>
   <script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</body>
</html>