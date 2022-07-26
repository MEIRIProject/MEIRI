<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 등록</title>
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
      <h2 align="center">질문 등록</h2>
      <div class="tableArea">
             <form action="<%= request.getContextPath() %>/insert.qu" method="post">
            <table align="center" width="800px">
               <tr>
                  <td class="attr">작성자 </td>
                  <td>
                    <input type="text" class="none" value="ADMIN" name="aid" readonly>
                    <!-- 위 두 input의 value 부분은 추후에 header에서 로그인정보를 가져와서 수정해야 합니다 -->
                    <input type="hidden" value="ADMIN" name="userId">
                  </td>
               </tr>
               <tr>
                  <td class="attr">질문 </td>
                  <td colspan="3"><input type="text"  class="none" size="50" name="title"></td>
               </tr>
               
               
               <tr>
                   
                  <td colspan="6">
                    <textarea class="none" name="content" cols="100" rows="10" style="resize:none;">이 곳에 답변을 입력하세요!</textarea>
                  </td>
               </tr>
            </table>
            <br>
        </div>
        <br><br><br><br>
        <div align="center">
            <button type="reset">취소하기</button>
            <button type="submit">등록하기</button>
         </div>
        </form>
         
      </div>
   </div>
</body>
</html>