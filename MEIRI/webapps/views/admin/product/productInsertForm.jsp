<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<style>
	.outer {
		width:800px;
		height:auto;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table {
		border:1px solid white;
		margin-left:auto;
		margin-right:auto;
		
		
	}
	.insertArea {
		width:500px;
		height:450px;
		margin-left:auto;
		margin-right:auto;
	}
	.btnArea {
		width:150px;
		margin-left:auto;
		margin-right:auto;
	}
	#titleImgArea {
		width:350px;
		height:200px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	}
	#titleImgArea:hover, #contentImgArea1:hover, 
	#contentImgArea2:hover, #contentImgArea3:hover,
	#contentImgArea4:hover {
		cursor:pointer;
	}
	#contentImgArea1, #contentImgArea2, #contentImgArea3, #contentImgArea4 {
		width:120px;
		height:100px;
		border:2px dashed darkgray;
		text-align:center;
		display:table-cell;
		vertical-align:middle;
	}
</style>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">제품 등록</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/insert.pr"
				  method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>이 름(제목)</td>
						<td colspan="5">
							<input type="text" size="50" name="name">
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="5">
							<input type="text" value="ADMIN" name="aid" readonly>
							<!-- 위 두 input의 value 부분은 추후에 header에서 로그인정보를 가져와서 수정해야 합니다 -->
							<input type="hidden" value="ADMIN" name="userId">
						</td>
					</tr>
					<tr>
						<td>중제목</td>
						<td colspan="5">
							<input type="text" size="50" name="title">
						</td>
					</tr>
					<tr>
						<td>대표 이미지</td>
						<td colspan="5">
							<div id="titleImgArea">
								<img id="titleImg" width="350" height="200" />
							</div>
						</td>
					</tr>
					<tr>
						<td>서브 이미지</td>
						<td>
							<div id="contentImgArea1">
								<img id="contentImg1" width="100" height="100" />
							</div>
						
							<div id="contentImgArea2">
								<img id="contentImg2" width="100" height="100" />
							</div>
						
							<div id="contentImgArea3">
								<img id="contentImg3" width="100" height="100" />
							</div>
						</td>
					</tr>
					<tr>
						<td>가 격</td>
						<td colspan="5"><input type="number" size="50" name="price"></td>
					</tr>
					<tr>
						<td>타 입 A</td>
						<td colspan="5"><input type="text" size="50" name="typeA"></td>
					</tr>
					<tr>
						<td>타 입 B</td>
						<td colspan="5"><input type="text" size="50" name="typeB"></td>
					</tr>
					<tr>
						<td>타 입 C</td>
						<td colspan="5"><input type="text" size="50" name="typeC"></td>
					</tr>
					<tr>
						<td>색 상</td>
						<td colspan="5"><input type="text" size="50" name="color"></td>
					</tr>
					
					<tr>
						<td>설명 이미지</td>
						<td>
							<div id="contentImgArea4">
								<img id="contentImg4" width="350" height="auto" />
							</div>
						</td>
					</tr>
					<tr>
						<td>작업 일지</td>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<div class="fileArea" id="fileArea">
					<input type="file" name="thumbnailImg1" id="thumbnailImg1" onchange="loadImg(this,1);" />
					<input type="file" name="thumbnailImg2" id="thumbnailImg2" onchange="loadImg(this,2);" />
					<input type="file" name="thumbnailImg3" id="thumbnailImg3" onchange="loadImg(this,3);" />
					<input type="file" name="thumbnailImg4" id="thumbnailImg4" onchange="loadImg(this,4);" />
					<input type="file" name="thumbnailImg5" id="thumbnailImg5" onchange="loadImg(this,5);" />
				</div>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
				
			</form>
			
		</div>
	</div>
	<script>
		// 사진 게시글 미리보기 기능 구현
		$(function(){
			$('#titleImgArea').click(function(){
				$('#thumbnailImg1').click();
			});
			
			$('#contentImgArea1').click(function(){
				$('#thumbnailImg2').click();
			});
			
			$('#contentImgArea2').click(function(){
				$('#thumbnailImg3').click();
			});
			
			$('#contentImgArea3').click(function(){
				$('#thumbnailImg4').click();
			});
			
			$('#contentImgArea4').click(function(){
				$('#thumbnailImg5').click();
			});
			
			$('#fileArea').hide();
		})
		
		function loadImg(img, num){
			if(img.files && img.files[0]) {
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					
					switch(num){
					case 1 : $('#titleImg').attr('src', e.target.result);
							 break;
					case 2 : $('#contentImg1').attr('src', e.target.result);
							 break;
					case 3 : $('#contentImg2').attr('src', e.target.result);
							 break;
					case 4 : $('#contentImg3').attr('src', e.target.result);
							 break;
					case 5 : $('#contentImg4').attr('src', e.target.result);
					 		break;
					}
				}
				
				reader.readAsDataURL(img.files[0]);
			}	
		}
	</script>
</body>
</html>