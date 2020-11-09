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
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	td {
		border:1px solid black;
		background : black;
		color: white;
	}

	.tableArea {
		border:1px solid black;
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
	.replyArea {
		width:800px;
		color:white;
		background:black;
		margin-left:auto;
		margin-right:auto;
		padding-bottom : 5px;
	}
	.replyArea textArea {
		border-radius: 10px;
		resize: none;
	}
	a:link {
    	color: yellow;
	}
	a:active {
		color: aqua;
	}
	table[class*="replyList"] * {
		color: black;
		
	}
	.replyList1 td{	background : lavenderblush; }
	.replyList2 td{	background : honeydew; }
	.replyList3 td{ background : aliceblue; }
	
</style>
</head>
<body>

	<div class="outer">
		<br>
		<h2 align="center">공지사항 상세보기</h2>
		<div class="tableArea">
				<table align="center" width="800px">
					<tr>
						<td>제목 </td>
						<td colspan="5"><span><%= n.getNtitle() %></span></td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td><span><%= n.getAdminid() %></span></td>
						<td>작성일</td>
						<td><span><%= n.getNdate() %></span></td>
					</tr>
					
					<tr>
						<td colspan="6">내용 </td>
					</tr>
					<tr>
						<td colspan="6">
							<p id="content"><%= n.getNcontent() %>
						</td>
					</tr>
				</table>
				<br>
		</div>
		<div align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/noticeList.no'">돌아가기</button>
			<!-- if(m != null && m.getUserName().equals(b.getBwriter())) -->
			<button onclick="location.href='<%= request.getContextPath() %>/nUpView.no?nno='+<%=n.getNno()%>">수정하기</button>
		</div>
	</div>

</body>
</html>