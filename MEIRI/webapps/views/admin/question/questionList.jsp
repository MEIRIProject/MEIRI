<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.question.model.vo.*, java.util.*" %>
<%@ page import="com.meiri.jsp.common.PageInfo" %>
<%
   ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
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

<style>
      .outer{            
      width : 600px;
           display: inline-block;
           margin-left: 350px;
      }
      .outer2{            
      width : 900px;
           display: inline-block;
     
     
      }
        .menuSection {
            background:white;
            width : 800px;
            margin-left : 0px;
            padding : 10px;
            
        }

        .menuSection h2 {
            margin : 5px 0;
            padding : 0;
        }

        .menuSection h2 a{
            font-size : 20px;
            display : block;
            color : black;
            margin : 0;
            padding : 10px;
            border-radius : 5px;
          text-decoration:none
        }

        .menuSection h2 a:focus,
        .menuSection h2 a:hover,
        .menuSection h2:active {
            background : white;
            color : black;
            text-shadow: none;
        }

        .menuSection p {
            padding :  0 10px;
            margin : 0;
            height : 0;
            background : white;
            color: black;
            overflow : hidden;
            transition :  height 0.5s ease-in;
            
        }

        .menuSection:target p {
            overflow : auto;
            height : 100px;
        }
        .title h1{
        color : #231d20;
        margin-bottom: 70px;
    }
    .answer{
       border : 1px solid #1f76bc;
       width:750px;
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
   
   margin-top:25px;
}
.btnArea button:hover{
       cursor:pointer;
    }  
    .btnArea{
       width:1000px;
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
                    <h1>자주묻는질문 목록</h1>
                </div>
            </div>
            <hr style="width:1000px; margin-bottom:10px;">
      
      <div class="outer2">
      <br>
          <% for(Question b : list) { %>
      <div class="menuSection" id="part<%=b.getQno()%>">
   
               <input type="hidden" value="<%= b.getQno() %>">
               <div class="menuSection" id="part<%=b.getQno()%>">
                  <h2><a href="#part<%=b.getQno()%>">Q. <%=b.getQtitle() %></a></h2>
               </div>
               <div class="answer">
               <p>
                  &nbsp; A. <%=b.getQanswer() %>  
               </p>
               </div> 
               <br>&nbsp;   <button onclick="location.href='<%= request.getContextPath() %>/qUpView.qu?qno='+<%=b.getQno()%>">수정하기</button>
               <%-- <%= b.getQanswer() %> --%>
      </div>
            <% } %>
      
      
      
      
      
      </div>
      
      <%-- 페이지 처리 코드 넣기 --%>
      
      <%-- <div class="pagingArea" align="center">
      
      <button onclick="location.href='<%= request.getContextPath() %>/questionList.qu?currentPage=1'"><<</button>
         <%  if(currentPage <= 1){  %>
         <button disabled><</button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/questionList.qu?currentPage=<%=currentPage - 1 %>'"><</button>
         <%  } %>
         
         <% for(int p = startPage; p <= endPage; p++){
               if(p == currentPage){   
         %>
            <button disabled><%= p %></button>
         <%      }else{ %>
            <button onclick="location.href='<%= request.getContextPath() %>/questionList.qu?currentPage=<%= p %>'"><%= p %></button>
         <%      } %>
         <% } %>
            
         <%  if(currentPage >= maxPage){  %>
         <button disabled>></button>
         <%  }else{ %>
         <button onclick="location.href='<%= request.getContextPath() %>/questionList.qu?currentPage=<%=currentPage + 1 %>'">></button>
         <%  } %>
         <button onclick="location.href='<%= request.getContextPath() %>/questionList.qu?currentPage=<%= maxPage %>'">>></button>
      
      </div> --%>
      
      <div class="btnArea" align="center"style="margin-top:300px;">
         
             <button onclick="location.href='index.jsp'">
                     돌아가기
               </button>
            <!--    header 받고 if문 작성 필요 -->
            <button onclick="location.href='views/admin/question/questionInsertForm.jsp'">
               작성하기
            </button>
            
            <button onclick="location.href='views/admin/adminPage.jsp'">
               관리자 페이지
            </button>
            
            <script>
               $(function(){
                  $('#listArea td').mouseenter(function(){
                     $(this).parent().css({"background" : "grey", "cursor" : "pointer"});
                  }).mouseout(function(){
                     $(this).parent().css({"background" : "black"});
                  }).click(function(){
                     var qno = $(this).parent().find('input').val();
                     location.href = "<%= request.getContextPath() %>/questionOne.qu?qno=" + qno;
                                                      
                  });
               });
            </script>
               
      </div>
      
   </div>


</body>
</html>




