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
	.outer{
		width:1500px;
		height:auto;
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
		width:1300px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
	}
</style>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>


	<div class="outer">
		<br>
		<h2 align="center">리뷰 목록</h2>
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
				<% for(ReviewView b : list) { %>
				<tr>
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
				<% } %>
			</table>
		</div>
		
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
		
		<div class="btnArea" align="center">
			
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


</body>
</html>





