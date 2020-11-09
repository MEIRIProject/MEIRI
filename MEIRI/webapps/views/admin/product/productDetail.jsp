<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.product.model.vo.*,
    							 java.util.*"%>

<% 
	Product p = (Product)request.getAttribute("product"); 
	ArrayList<ProductFile> fileList
		= (ArrayList<ProductFile>)request.getAttribute("fileList");
	
	ProductFile[] productfile = new ProductFile[5]; 
	
	for(int i = 0; i < 5; i++){
		productfile[i] = fileList.get(i);
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세보기</title>
<style>
	.outer{
		width:800px;
		height:auto;
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
		height:auto;
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
		<h2 align="center">제품 상세보기</h2>
		<div class="tableArea">
				<table align="center" width="800px">
					<tr>
						<td>이 름</td>
						<td colspan="5"><span><%= p.getPname() %></span></td>
					</tr>
					<tr>
						<td>중제목</td>
						<td colspan="5"><span><%= p.getPtitle() %></span></td>
					</tr>
					<tr>
						<td>가 격</td>
						<td colspan="5"><span><%= p.getPprice() %></span></td>
					</tr>
					<tr>
						<td>타 입 A</td>
						<td><span><%= p.getPtypea() %></span></td>
						<td>타 입 B</td>
						<td><span><%= p.getPtypeb() %></span></td>
						<td>타 입 C</td>
						<td><span><%= p.getPtypec() %></span></td>
					</tr>
					<tr>
						<td>색 상</td>
						<td colspan="5"><span><%= p.getPcolor() %></span></td>
					</tr>
					<tr>
						<td>대표사진</td>
						<td colspan="4">
							<div id="titleImgArea" align="center">
								<img id="titleImg" width="350" height="200" 
									src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[0].getChangename() %>">
							</div>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[0].getChangename() %>" download="<%= productfile[0].getOriginname() %>"><button type="button">다운로드</button></a>
						</td>
					</tr>
					<tr>
						<td>서브 이미지</td>
						<td>
							<div class="detailImgArea">
							<% if (productfile[1].getChangename() != null) { %>
								<img width="100" height="100" id="detailImg1" class="detailImg" src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[1].getChangename()%>">
								<a href="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[1].getChangename()%>" download="<%= productfile[1].getOriginname()%>"><button type="button">다운로드</button></a>
							<% } else { %>
								<img width="100" height="100" id="detailImg1" class="detailImg" src="<%= request.getContextPath() %>/resources/images/no-image.png">
							<% } %>
							</div>
						</td>
						<td>
							<div class="detailImgArea">
							<% if (productfile[2].getChangename() != null) { %>
								<img width="100" height="100" id="detailImg2" class="detailImg" src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[2].getChangename()%>">
								<a href="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[2].getChangename()%>" download="<%= productfile[2].getOriginname()%>">
									<button type="button">다운로드</button>
								</a>
							<% } else { %>
								<img width="100" height="100" id="detailImg2" class="detailImg" src="<%= request.getContextPath() %>/resources/images/no-image.png">
							<% } %>
							</div>
						</td>
						<td>
							<div class="detailImgArea">
							<% if (productfile[3].getChangename() != null) { %>
								<img width="100" height="100" id="detailImg3" class="detailImg" src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[3].getChangename()%>">
								<a href="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[3].getChangename()%>" download="<%= productfile[3].getOriginname()%>"><button type="button">다운로드</button></a>
							<% } else { %>
								<img width="100" height="100" id="detailImg3" class="detailImg" src="<%= request.getContextPath() %>/resources/images/no-image.png">
							<% } %>
							</div>
						</td>
					</tr>
					<tr>
						<td>설명 이미지</td>
						<td colspan="4">
							<div id="titleImgArea" align="center">
								<img width="350" height="auto" id="titleImg" src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[4].getChangename() %>">
							</div>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[4].getChangename() %>" download="<%= productfile[4].getOriginname() %>"><button type="button">다운로드</button></a>
						</td>
					</tr>
				</table>
				<br>
		</div>
		<div align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/productList.pr'">돌아가기</button>
			<!-- if(m != null && m.getUserName().equals(b.getBwriter())) -->
			<button onclick="location.href='<%= request.getContextPath() %>/pUpView.pr?pno='+<%=p.getPno()%>">수정하기</button>
		</div>
	</div>

</body>
</html>