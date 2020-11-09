<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.inquiry.model.vo.*"%>
 <% inquiry b = (inquiry)request.getAttribute("board"); %>
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
<title>문의 수정 페이지</title>
</head>
<body>


	<div class="outer">
		<br>
		<h2 align="center">문의 수정 페이지</h2>
		<div class="tableArea">
			<form id="updateForm" method="post" enctype="multipart/form-data">
				<table align="center">
					<tr>
						<td>제목 </td>
						<td colspan="3">
							<input type="text" size="65" name="title" value="<%=b.getcTitle() %>">
							<input type="hidden" name="bno" value="<%=b.getcCode()%>">
						</td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td colspan="3"><%= b.getUserId() %></td>
					</tr>
					<tr>
						<td>내용 </td>
						<td colspan="3">
							<textarea name="content" cols="67" rows="15" style="resize:none;"><%=b.getcContent() %></textarea>
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
						$("#updateForm").attr("action","<%= request.getContextPath()%>/bUpdate.bo");
					}
					
					function deleteBoard(){
						$("#updateForm").attr("action","<%= request.getContextPath()%>/bDelete.bo");
					}
				
				</script>
			</form>
		</div>
	</div>
	
</body>
</html>