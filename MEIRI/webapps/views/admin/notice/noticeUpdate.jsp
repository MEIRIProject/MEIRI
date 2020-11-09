<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.notice.model.vo.*"%>
 <% Notice n = (Notice)request.getAttribute("notice"); %>
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
<title>공지사항 수정 화면</title>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">게시글 수정 페이지</h2>
		<div class="tableArea">
			<form id="updateForm" method="post">
				<table align="center">
					<tr>
						<td>제목 </td>
						<td colspan="3">
							<input type="text" size="65" name="title" 
								   value="<%=n.getNtitle() %>">
							<input type="hidden" name="nno" value="<%=n.getNno()%>">
						</td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td colspan="3"><%= n.getAdminid() %></td>
					</tr>
					
					<tr>
						<td>내용 </td>
						<td colspan="3">
							<textarea name="content" cols="67" rows="15" style="resize:none;"><%=n.getNcontent() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button onclick="complete();">작성완료</button>
					<button onclick="deleteNotice();">삭제하기</button>
				</div>
				<script>
					function complete(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/update.no");
					}
					
					function deleteNotice(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/nDelete.no");
					}
				
				</script>
			</form>
	</div>
	</div>
	<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</body>
</html>