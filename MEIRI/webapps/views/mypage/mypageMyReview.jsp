<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.review.model.vo.*,
    							java.util.*"%>
    
<%
	ArrayList<ReviewView> rlist = (ArrayList<ReviewView>)request.getAttribute("rlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 목록</title>
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
        margin-bottom:5px;
        margin-top:5px; 
       
    }
    .title:hover{
        cursor:pointer;
    }    
    .tableArea td:hover{
    opacity: 70%;
    cursor:pointer;
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

    #listArea{
        margin-left:60px;
           text-align: center;
    }
    .pagingArea{
        margin-top:500px;
       margin-left:400px;
    }
    .btnArea{
    width:700px;
       margin-left:150px;
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
                    <h1>내가 쓴 댓글 확인</h1>
                </div>
            </div>
            <hr style="width:1000px; margin-bottom:35px">
      <div class="tableArea" style="width:900px;">
         <table align="center" id="listArea">
            <tr>
               <th width="100px">리뷰코드</th>
               <th width="300px">리뷰내용</th>               
               <th width="100px">작성일</th>               
               <th width="150px">작성자</th>
               <th width="150px">제품</th>
               <th width="150px">사진</th>               
            </tr>
            <% for(ReviewView r : rlist) { %>
            <tr>
               <td><%= r.getRcode() %></td>
               <td><%= r.getRcontent() %></td>
               <td><%= r.getRdate() %></td>
               <td><%= r.getUserid() %></td>
               <td><%= r.getPcode() %></td>
               <td>
               <% if (r.getChangename() != null) {%>
               <img src="<%=request.getContextPath() %>/resources/reviewUploadFiles/<%= r.getChangename() %>" alt="" width=30px height=30px/>
               <% } else { %>
						등록된 사진 없음
				<% } %>
				</td>
               
               
               
               
               
               
                </tr>
                <tr><td><hr class="hr2"></td><td><hr class="hr2"></td><td><hr class="hr2"></td><td><hr class="hr2"></td><td><hr class="hr2"><td><hr class="hr2"></td><td><hr class="hr2"></td></tr>
             
            <% } %>
         </table>
      </div>
      
     
      
         <br><br>
            
            
           
           
      
   </div>


</body>
</html>
