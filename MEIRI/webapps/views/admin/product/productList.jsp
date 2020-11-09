<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.product.model.vo.*, java.util.*" %>
<%@ page import="com.meiri.jsp.common.PageInfo" %>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
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
<title>제품 목록</title>
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
		<h2 align="center">제품 목록</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="100px">상품번호</th>
					<th width="300px">상품이름</th>					
					<th width="100px">가 격</th>					
					<th width="150px">타 입A</th>
					<th width="150px">타 입B</th>
					<th width="150px">타 입C</th>					
					<th width="100px">색 깔</th>
				</tr>
				<% for(Product b : list) { %>
				<tr>
					<!-- 공지사항 DB테이블 보고 만들 예정 -->
					<input type="hidden" value="<%= b.getPno() %>">
					<td><%= b.getPno() %></td>
					<td><%= b.getPname() %></td>
					<td><%= b.getPprice() %></td>
					<td><%= b.getPtypea() %></td>
					<td><%= b.getPtypeb() %></td>
					<td><%= b.getPtypec() %></td>
					<td><%= b.getPcolor() %></td>
				</tr>
				<% } %>
			</table>
		</div>
		
		<%-- 페이지 처리 코드 넣기 --%>
		
		<div class="pagingArea" align="center">
		
		<button onclick="location.href='<%= request.getContextPath() %>/productList.pr?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/productList.pr?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/productList.pr?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/productList.pr?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/productList.pr?currentPage=<%= maxPage %>'">>></button>
		
		</div>
		
		<div class="btnArea" align="center">
			
			<br><br>
				<button onclick="location.href='views/admin/product/productInsertForm.jsp'">
					등록하기
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
							var pno = $(this).parent().find('input').val();
							location.href = "<%= request.getContextPath() %>/productOne.pr?pno=" + pno;
																		
						});
					});
				</script>
					
		</div>
		
	</div>


</body>
</html>





