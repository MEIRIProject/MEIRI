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
<title>자주묻는질문 목록</title>
<style>
	.outer{
		width:900px;
		height:600px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table {
		padding : 20px;
		border:1px solid white;
		text-align:center;
	}
	.tableArea {
		width:750px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>


	<div class="outer">
		<br>
		<h2 align="center">자주묻는질문 목록</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="100px">질문번호</th>
					<th width="300px">질 문</th>					
					<th width="100px">작성자</th>
				</tr>
				<% for(Question b : list) { %>
				<tr>
					<!-- 공지사항 DB테이블 보고 만들 예정 -->
					<input type="hidden" value="<%= b.getQno() %>">
					<td><%= b.getQno() %></td>
					<td><%= b.getQtitle() %></td>
					<td><%= b.getQwriter() %></td>
				</tr>
				<% } %>
			</table>
		</div>
		
		<%-- 페이지 처리 코드 넣기 --%>
		
		<div class="pagingArea" align="center">
		
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
		
		</div>
		
		<div class="btnArea" align="center">
			
			<br><br>
				<button onclick="location.href='views/question/questionInsertForm.jsp'">
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





