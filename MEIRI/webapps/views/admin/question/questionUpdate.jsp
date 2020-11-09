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
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	td {
		border:1px solid white;
	}

	.tableArea {
		border:1px solid white;
		width:800px;
		height:360px;
		margin-left:auto;
		margin-right:auto;
	}
	.tableArea table {
		width : 600px;
	}
	#content {
		height:230px;
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
				<table align="center">
					<tr>
						<td>질 문</td>
						<td colspan="3">
							<input type="text" size="65" name="title" value="<%=q.getQtitle() %>">
							<input type="hidden" name="qno" value="<%=q.getQno()%>">
						</td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td colspan="3"><%= q.getQwriter() %></td>
					</tr>
					
					<tr>
						<td>답 변</td>
						<td colspan="3">
							<textarea name="content" cols="67" rows="15" style="resize:none;"><%=q.getQanswer() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
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