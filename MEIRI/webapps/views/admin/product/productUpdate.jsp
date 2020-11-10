<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.product.model.vo.*,
    							 java.util.*"%>
<%
	Product p = (Product)request.getAttribute("product");
	ProductFile[] fileList
	= (ProductFile[])request.getAttribute("fileList");
	
	ProductFile[] productfile = new ProductFile[5]; 
	
	for(int i = 0; i < 5; i++){
	productfile[i] = fileList[i];
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		border:1px solid white;
	}

	.tableArea {
		border:1px solid white;
		width:800px;
		height:auto;
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
<title>제품정보 수정 화면</title>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">제품정보 수정</h2>
		<div class="tableArea">
			<form id="updateForm" method="post" enctype="multipart/form-data">
				<table align="center" width="800px">
					<tr>
						<td>이 름</td>
						<td colspan="5">
						<input type="text" name="name" value="<%= p.getPname() %>"/>
						<input type="hidden" name="pno" value="<%=p.getPno()%>">
						</td>
					</tr>
					<tr>
						<td>중제목</td>
						<td colspan="5">
						<input type="text" name="title" value="<%= p.getPtitle() %>"/>
						</td>
					</tr>
					<tr>
						<td>가 격</td>
						<td colspan="5">
						<input type="number" name="price" value="<%= p.getPprice() %>"/>
						</td>
					</tr>
					<tr>
						<td>타 입 A</td>
						<td colspan="5">
							<input type="text" name="typea" value="<%= p.getPtypea() %>"/>
						</td>
					</tr>
					<tr>
						<td>타 입 B</td>
						<td colspan="5">
							<input type="text" name="typeb" value="<%= p.getPtypeb() %>"/>
						</td>
					</tr>
					<tr>
						<td>타 입 C</td>
						<td colspan="5">
							<input type="text" name="typec" value="<%= p.getPtypec() %>"/>
						</td>
					</tr>
					<tr>
						<td>색 상</td>
						<td colspan="5">
						<input type="text" name="color" value="<%= p.getPcolor() %>"/>
						</td>
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
							<% if (productfile[1] != null) { %>
								<img width="100" height="100" id="detailImg1" class="detailImg" src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[1].getChangename()%>">
								<a href="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[1].getChangename()%>" download="<%= productfile[1].getOriginname()%>"><button type="button">다운로드</button></a>
							<% } else { %>
								<img width="100" height="100" id="detailImg1" class="detailImg" src="<%= request.getContextPath() %>/resources/images/no-image.png">
							<% } %>
							</div>
						</td>
						<td>
							<div class="detailImgArea">
							<% if (productfile[2] != null) { %>
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
							<% if (productfile[3] != null) { %>
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
							<div id="detailImgArea" align="center">
								<% if (productfile[4] != null) { %>
									<img width="100" height="100" id="detailImg4" class="detailImg" src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[4].getChangename()%>">
									
								<% } else { %>
									<img width="100" height="100" id="detailImg4" class="detailImg" src="<%= request.getContextPath() %>/resources/images/no-image.png">
								<% } %>
							</div>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/resources/productUploadFiles/<%= productfile[4].getChangename() %>" download="<%= productfile[4].getOriginname() %>"><button type="button">다운로드</button></a>
						</td>
					</tr>
					<tr>
						<td>관리자</td>
						<td>
							<input type="text" value="ADMIN" name="aid" readonly>
							<!-- 위 두 input의 value 부분은 추후에 header에서 로그인정보를 가져와서 수정해야 합니다 -->
							<input type="hidden" value="ADMIN" name="userId">
						</td>
					</tr>
					<tr>
						<td>작업 일지</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<div class="fileArea" id="fileArea">
		      		<input type="file" id="thumbnailImg1"
		      				name="thumbnailImg1" onchange="loadImg(this, 1);" />
		      				
		      		<input type="file" id="thumbnailImg2"
		      				name="thumbnailImg2" onchange="loadImg(this, 2);" />
		      				
		      		<input type="file" id="thumbnailImg3"
		      				name="thumbnailImg3" onchange="loadImg(this, 3);" />
		      				
		      		<input type="file" id="thumbnailImg4"
		      				name="thumbnailImg4" onchange="loadImg(this, 4);" />
		      				
		      		<input type="file" id="thumbnailImg5"
		      				name="thumbnailImg5" onchange="loadImg(this, 5);" />
		      	</div>
				<br>
				<div align="center">
					<button onclick="complete();">수정완료</button>
					<button onclick="deleteBoard();">삭제하기</button>
				</div>
				<script>
					function complete(){
						$("#updateForm").attr("action","<%= request.getContextPath()%>/update.pr");
					}
					
					function deleteBoard(){
						$("#updateForm").attr("action","<%= request.getContextPath()%>/pDelete.pr");
					}
				
					// 사진 게시판 미리보기 기능 지원 스크립트
					$(function(){
						$('#fileArea').hide();
						
						$('#titleImgArea').click(() => {
							$('#thumbnailImg1').click();
						});
						
						$('#detailImg1').click(() => {
							$('#thumbnailImg2').click();
						});
						
						$('#detailImg2').click(() => {
							$('#thumbnailImg3').click();
						});
		
						$('#detailImg3').click(() => {
							$('#thumbnailImg4').click();
						});
						
						$('#detailImg4').click(() => {
							$('#thumbnailImg5').click();
						});
					});
					
					function loadImg(value, num){
						
						if(value.files && value.files[0])  {
							
							var reader = new FileReader();
							
							reader.onload = function(e){
								
								switch(num) {
								case 1 : $('#titleImg').attr('src', e.target.result);
									break;
								case 2 : $('#detailImg1').attr('src', e.target.result);
									break;
								case 3 : $('#detailImg2').attr('src', e.target.result);
									break;
								case 4 : $('#detailImg3').attr('src', e.target.result);
									break;
								case 5 : $('#detailImg4').attr('src', e.target.result);
									break;
								}
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
			</form>
	</div>
	</div>
</body>
</html>