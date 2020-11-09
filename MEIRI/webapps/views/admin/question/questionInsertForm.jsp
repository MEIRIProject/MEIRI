<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 등록</title>
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
	
	table {
		border:1px solid white;
	}

	.tableArea {
		width:450px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">질문 등록</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/insert.qu" method="post">
				<table>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" value="ADMIN" name="aid" readonly>
							<!-- 위 두 input의 value 부분은 추후에 header에서 로그인정보를 가져와서 수정해야 합니다 -->
							<input type="hidden" value="ADMIN" name="userId">
						</td>
					</tr>
					<tr>
						<td>질 문</td>
						<td colspan="3"><input type="text" size="50" name="title"></td>
					</tr>
					<tr>
						<td>답 변</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
				
			</form>
			
		</div>
	</div>
</body>
</html>