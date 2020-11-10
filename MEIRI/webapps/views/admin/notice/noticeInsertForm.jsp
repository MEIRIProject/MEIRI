<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
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
</head>
<body>

   <div class="outer">
      <br>
      <h2 align="center">공지사항 작성</h2>
      <div class="tableArea">
        <form action="<%= request.getContextPath() %>/insert.no" method="post">
            <table align="center" width="800px">
               <tr>
                  <td class="attr">제목 </td>
                  <td colspan="5"><input class="none" type="text" size="50" name="title"></td>
               </tr>
               <tr>
                  <td class="attr">작성자 </td>
                  <td>
                    <input class="none" type="text" value="ADMIN" name="writer" readonly>
                    <input type="hidden" value="ADMIN" name="userId">
                  </td>
               </tr>
               
               
               <tr>
                  <td colspan="6">
                    <textarea class="none" name="content" cols="100" rows="10" style="resize:none;"></textarea>
                  </td>
               </tr>
            </table>
            <br>
        </div>
        <br><br><br><br>
        <div class="btnArea" align="center">
            <button type="reset">취소하기</button>
            <button type="submit">등록하기</button>
         </div>
        </form>
   </div>

</body>
</html>