<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.question.model.vo.*,
    							 java.util.*"%>

<% Question n = (Question)request.getAttribute("question"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 상세보기</title>
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
		<h2 align="center">자주묻는질문 상세보기</h2>
		<div class="tableArea">
				<table align="center" width="800px">
					<tr>
						<td>질 문</td>
						<td colspan="5"><span><%= n.getQtitle() %></span></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><span><%= n.getQwriter() %></span></td>
					</tr>
					
					<tr>
						<td colspan="6">답 변</td>
					</tr>
					<tr>
						<td colspan="6">
							<p id="content"><%= n.getQanswer() %>
						</td>
					</tr>
				</table>
				<br>
		</div>
		<div align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/productList.pr'">돌아가기</button>
			<!-- if(m != null && m.getUserName().equals(b.getBwriter())) -->
			<button onclick="location.href='<%= request.getContextPath() %>/qUpView.qu?qno='+<%=n.getQno()%>">수정하기</button>
		</div>
	</div>

</body>
</html>