<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.question.model.vo.*"%>
 <% Question q = (Question)request.getAttribute("question"); %>
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
        width:100px;
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
   margin-top:100px;
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
   <script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
<title>자주묻는질문 수정 화면</title>
</head>
<body>
   <div class="outer">
      <br>
      <h2 align="center">자주묻는질문 수정 페이지</h2>
      <div class="tableArea">
         <form id="updateForm" method="post">
            <table align="center" width="800px">
               <tr>
                  <td class="attr">질문 </td>
                    <td colspan="5">
                <input type="text" class="none" size="65" name="title" value="<%=q.getQtitle() %>">
                      <input type="hidden" name="qno" value="<%=q.getQno()%>">
               </td>
               </tr>
               <tr>
                  <td class="attr">작성자 </td>
                  <td>
                     <%= q.getQwriter() %>
                  </td>
               </tr>
               
               
               <tr>
                  <td colspan="6">
                  <textarea class="none" name="content" cols="100" rows="15" style="resize:none;"><%=q.getQanswer() %></textarea>
                  </td>
               </tr>
            </table>
            <br>
        </div>
            <br>
            <div align="center" class="btn">
               <button onclick="complete();">수정완료</button>
               <button onclick="deleteBoard();">삭제하기</button>
            </div>
            <script>
               function complete(){
                  $("#updateForm").attr("action","<%= request.getContextPath()%>/update.qu");
               }
               
               function deleteBoard(){
                  $("#updateForm").attr("action","<%= request.getContextPath()%>/qDelete.qu");
               }
            
            </script>
         </form>
   </div>
   </div>
</body>
</html>