<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.meiri.jsp.member.model.vo.*,
    								com.meiri.jsp.review.model.vo.*,
    								com.meiri.jsp.product.model.vo.*,
    								java.util.*"%>
<%

	ProductFilesList[] pf = (ProductFilesList[])request.getAttribute("productfile");

	Product p = (Product)request.getAttribute("product");
	ArrayList<ReviewView> rvlist = (ArrayList<ReviewView>)request.getAttribute("rvlist");
	
	ProductFilesList pf1 = (ProductFilesList)request.getAttribute("pf1");
	ArrayList<ProductFilesList> pflist2 = (ArrayList<ProductFilesList>)request.getAttribute("pflist2");
	ProductFilesList pf3 = (ProductFilesList)request.getAttribute("pf3");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductDetail</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>

<style>
h2 {
	color: #1f76bc;
}

.width {
	width: 2000px;
}
/* 상품 상세 */
.product_info {
	padding: 100px 0 135px;
	background: white;
}

.product_pictures {
	text-align: center;
	position: relative;
}

.product_pictures .thumb_img {
	margin-top: 70px;
	display: flex;
	justify-content: center;
}

.product_pictures .thumb_img li {
	padding: 12px 0;
	text-align: center;
	background: white;
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
}

.product_pictures .thumb_img li img {
	width: 70px;
	height: 70px;
	margin-left: 25px;
	margin-right: 25px;
}

form hr {
	border: none;
	border-top: 1px solid #edeff1;
	margin-top: 15px;
	margin-bottom: 15px;
	margin-right: 45px;
}

.option h4 {
	display: inline-block;
	font-weight: 600;
	font-size: 18px;
	margin-right: 20px;
}

.option .size input {
	display: none;
}

.option .size label {
	font-size: 14px;
	transition: 0.3s;
	cursor: pointer;
}

.quantity span {
	cursor: pointer;
}

.option .size input:checked+label {
	font-size: 18px;
	font-weight: 600;
	color: #1f76bc;
}

.option .quantity input {
	border: none;
	width: 30px;
	color: #1f76bc;
	font-weight: 600;
	text-align: center;
	font-size: 18px;
}

.order_summary h4, button {
	display: inline-block;
	font-weight: 600;
	font-size: 18px;
	margin-right: 20px;
}

.order_summary button {
	margin-top: 20px;
	cursor: pointer;
}

.total_price .price {
	display: inline-block;
	font-weight: 600;
	font-size: 18px;
	margin-right: 4px;
	color: #1f76bc;
}

.buybtn {
	padding: 0 24px;
	height: 40px;
	color: white;
	font-size: 18px;
	font-weight: 600;
	background: #1f76bc;
	border-radius: 25px;
	border: none;
}

.product_pictures .thumb_img li:before {
	content: "";
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	top: 0;
	background: #F5F6CE;
	opacity: 0;
	transition: 0.3s;
	cursor: pointer;
}

.product_pictures .thumb_img li.active:before {
	opacity: 1;
}

.product_pictures .thumb_img li.active img {
	opacity: 0.3;
}

/* 제품 상세설명 css */
.row2 {
	text-align: center;
	margin-right: -10%;
	padding-top: 8px;
	padding-bottom: 8px;
	background: #e8f0f2;
	margin-left: -10%;
	border-radius: 15px;
	border: none;
}
/* 리뷰 css */
.row3 {
	text-align: center;
	margin-right: 400px;
	padding-top: 50px;
	padding-bottom: 8px;
	background: white;
	margin-left: 300px;
	color: #1f76bc;
	font-size: 18px;
}

.rviewh1 {
	margin-top: 150px;
	text-align: center;
	margin-right: 400px;
	padding-top: 50px;
	padding-bottom: 8px;
	background: white;
	margin-left: 300px;
	color: #1f76bc;
	font-size: 27px;
}

.product_review hr {
	margin-top: 100px;
	width: 800px;
	margin-right: 650px;
	border: none;
	border-top: 1px solid #edeff1;
}

.review_list {
	display: flex;
	width: 1000px;
	border: solid 1px #edeff1;;
	border-left: none;
	border-right: none;
	margin-right: 100px;
}

.review_writearea {
	display: flex;
	width: 1000px;
	border: solid 1px #edeff1;;
	border-left: none;
	border-right: none;
	margin-right: 100px;
}

/* 리뷰 작성 */
.review_writeright button {
	padding: 0 18px;
	height: 40px;
	color: white;
	font-size: 18px;
	font-weight: 600;
	background: #1f76bc;
	border-radius: 25px;
	border: none;
}

.size, .color, .quantity {
	margin-right: 40px;
}


</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>

	<div class="width">
		<section class="product_info">
			<div class="container">
				<div class="row"
					style="margin-left: auto; margin-right: auto; display: flex; width:100%;">
					<div class="product_pictures" style="float: left; width: 50%;">
					
						<img src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= pf1.getChangename() %>" class="big_img" width=200px, height=200px>
						
						<ul class="thumb_img">
						
					<!-- 		<li class="active"><img src="../../resources/images/product/2.png" data-target="2.png"></li>
							<li><img src="../../resources/images/product/3.png"	data-target="3.png"></li>
							<li><img src="../../resources/images/product/4.jpg" data-target="4.jpg"></li>
					 -->		
							<% for(ProductFilesList pflist : pflist2) {%>
								<li><img src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= pflist.getChangename() %>" width=150px, height=150px></li>	
							<%} %>
						</ul>
					</div>
				<form action="<%= request.getContextPath() %>/Detailbuy.pd" method="post">
					<div style="margin-top:10%; margin-bottom:10%;">
						<h2>
							<input type="text" name="pname" value="<%= p.getPname()%>" style="border:none; font-size:30px; font-weight:bold; color:grey;" readonly >
						</h2>
						<h3>
							<input type="text" name="ptitle" value="<%= p.getPtitle()%>" style="border:none; font-size:20px; font-weight:bold; color:grey;" readonly>
						</h3>
							<input type="hidden" name="pcode" value="<%= p.getPcode()%>" readonly>
							<hr />
							<div class="option" style="display: flex; width: 600px; margin-top:20px;">
								<div class="size">
									<h4>타입</h4>
									<input type="radio" id="a_type" name="a_type" value="<%= p.getPtypea() %>">
									<label for="a_type">A</label> -
									<% if(p.getPtypeb() != null) {%>
									<input type="radio" id="b_type"	name="b_type" value="<%= p.getPtypeb() %>" checked> 
									<label for="b_type">B</label> - 
									<% } %>
									<% if(p.getPtypec() != null) {%>
									<input type="radio" id="c_type" name="c_type" value="<%= p.getPtypec() %>">
									<label for="c_type">C</label>
									<% } %>
								</div>
								<div class="color">
									<h4>색상</h4>
									<select name="color" id="color">
										<option value="블랙">블랙</option>
										<option value="화이트">화이트</option>
										<option value="골드">골드</option>
										<option value="로즈골드">로즈골드</option>
									</select>
								</div>
								<div class="quantity">
									<h4>수량</h4>
									<span class="minus">-</span>
									<input type="text" name="productQuantity" readonly	value="1"> 
									<span class="plus">+</span> 
								</div>
							</div>
							<hr />
							<div class="order_summary"
								style="display: inline-block; width: 600px;">
								<div class="total_price" style="float: left; margin-top:20px;">
									<h4>가격</h4>
									<span class="price"><%= p.getPrice() %>원</span>
									<input type="hidden" name="productPrice" value="<%= p.getPrice()%>">
									<!-- 상품 등록 시 .quantity클래스 아이디로 받고 여기에서 get 필요할 듯 -->
								</div>
								<div class="order_now" style="float: right; margin-right: 25px;">
									
									<button type="submit" class="buybtn">구매하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		<button id="basketbtn" onclick="basketbtn()">장바구니</button>
		</section>
		<script>
			function basketbtn() {
				$.ajax({
					url : '/meiri/cartInsert.ca',
					type : 'post',
					data : {
						userid : "<%= m.getUserId() %>",
						pcode : <%= p.getPcode() %>,
						fcode : <%= pf[0].getFcode() %>,
						Quantity : $('input[name=productQuantity]').val()
				}, success : function(data) {
					alert(data);
					}, error : function() {
						alert("장바구니 추가에 실패하였습니다");
					}
				});
			};
		</script>
		

		<section class="product_detailinfo">
			<div class="container">
				<div class="row2">
					<h1>
						제품 설명
						</h1>
				</div>
				<div class="product_content"
					style="display: flex; justify-content: center; margin-right: 100px; margin-top: 80px;">
					<img src="<%= request.getContextPath() %>/resources/productUploadFiles/<%= pf3.getChangename() %>" width="1000px"
						height="100%";>
				</div>
				<div></div>
			</div>
		</section>

		<div class="reviewwrite">
			<h1 class="rviewh1">리뷰 작성</h1>
			<div class="containers"
				style="width: 100%; display: flex; justify-content: center;">
				<div class="review_writearea">
					<div class="review_writeleft" style="width: 80%; display: flex;">
						<div class="review_writelleft">
							<p style="font-size: 12px;">
								REVIEW | <span>리뷰와 관련없는 글은 관리자에 의해 삭제 처리됩니다.</span>
							</p>


							<form action="<%=request.getContextPath()%>/insert.re"
								style="margin: 0;" method="post" enctype="multipart/form-data">
								<!-- 파일, 상품 번호, 리뷰 내용, 회원 번호 넘겨줘야함 -->
								
								<input type="hidden" name="userId" value="<%=m.getUserId()%>">
								
								<input type="hidden" name="pcode" value="<%= p.getPcode() %>" />
							

								<textarea name="rcontent" id="rcontent" cols="95" rows="10"
									value placeholder="내용을 입력해주세요." style="resize: none;"></textarea>
						</div>
						<div class="review_writelright"
							style="margin-left: 25px; margin-top: 40px;">
							<input type="file" name="review_img" id="review_img"
								onchange="loadImg(this,1)" /> <img id="uploadreviewImg"
								width="100" height="100" style="margin-top: 30px;" />
						</div>
					</div>
					<div class="review_writeright"
						style="margin-top: 210px; margin-left: 10px;">
						<button onclick="reConfirm(this)">리뷰 등록</button>
						</form>
						<!-- 리뷰 내용과 파일, 작성자정보 보내야함 -->
					</div>
				</div>
			</div>
		</div>
			
		<section class="product_review">
         <div class="container">
            <hr>
            <div class="row3">
               <h1>제품 리뷰</h1>
            </div>
            <div class="reviewlist">
            <% for(int i = 0 ; i < rvlist.size(); i++){%>
               <div class="containers" style="width : 100%; display: flex; justify-content: center; ">
                  <div class="review_item">
                        <div class="review_list" style="height:170px;">
                        <div class="list_left" style="width: 80%; display: flex;" >
                           <div style="width: 200px; margin-top:10px; margin-bottom: 10px; margin-right: 10px;">
                              <img src="<%= request.getContextPath() %>/resources/reviewUploadFiles/<%=rvlist.get(i).getChangename()%>" style="width:100%;" id="reviewImg" src="img/5.gif">
                           </div>
                           <div><p><%=rvlist.get(i).getRcontent()%></p>
                           </div>
                        </div>
                        <div class="list_right" style="margin-left: 55px;">
                           <br>
                           <div>
                              <u style="color:grey">작성자</u><br><strong><%=rvlist.get(i).getUserid()%></strong>
                           </div>   
                           <br>
                           <div>
                              <u style="color:grey">작성일자</u><br><strong><%=rvlist.get(i).getRdate()%></strong>
                           </div>
                        </div>
                     </div>
                   
                  </div>
                </div>
            <% } %>
            </div>
   		</div>
</section>   
			
			
			
		<!-- <div>
			<% for(int i = 0 ; i < rvlist.size(); i++){%>
				<p><%=rvlist.get(i).getUserid()%></p>
				<p><%=rvlist.get(i).getRcontent()%></p>
				<p><%=rvlist.get(i).getRdate()%></p>
				<p><%=rvlist.get(i).getPcode()%></p>
				<p><%=rvlist.get(i).getChangename()%></p>
				
				
			<% } %>
		</div>
		 -->
	<!-- 사진 미리보기 -->
	<script>
		function loadImg(img, num) {
			if (img.files && img.files[0]) {

				var reader = new FileReader();

				reader.onload = function(e) {

					switch (num) {
					case 1:
						$('#uploadreviewImg').attr('src', e.target.result);
						break;
					}
				}

				reader.readAsDataURL(img.files[0]);
			}
		}
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="../common/footer.jsp" %>
	
</body>
<script>
	var $productPictures = $('.product_pictures'), $bigImg = $productPictures
			.find('.big_img'), $thumbImgList = $productPictures
			.find('.thumb_img li');

	/*
	   1. 리스트를 클릭하면 그 요소에 active 추가한다.
	   2. 클릭한 요소의 자식요소 img의 data-target 값을 확인 후 큰 이미지 경로 수정 
	 */
	$thumbImgList.click(function() {
		$(this).addClass('active').siblings().removeClass('active');
		var targetImgPath = '../../resources/images/product/'
				+ $(this).find('img').attr('data-target');

		$bigImg.attr('src', targetImgPath)
	});

	// 상품 수량 및 총 가격 변경
	var $quantity = $('.quantity'), $unitprice = <%= p.getPrice() %>, $qtyBtn = $quantity
			.find('span'), $qtyInput = $quantity.find('input'), $targetTotal = $('.total_price .price');

	/*
	$qtyBtn 클릭하면 그 요소가 class명 prev가 참이면 (+클릭)
	$qytInput value 기존값에서 1 증가
	거짓이면(- 클릭) 기존값에서 1 감소
	 */
	$qtyBtn.click(function() {
		var currentCount = $qtyInput.val();

		if ($(this).hasClass('plus')) {
			currentCount++;
			$qtyInput.val(currentCount);
		} else {
			if (currentCount > 1) {
				currentCount--;
				$qtyInput.val(currentCount);
			}
		}
		// 수량*단가 변수 total에 저장하고 그걸 .price 값으로 변경
		var total = (currentCount * $unitprice).toLocaleString('en') + '원';
		$targetTotal.text(total);

	});
</script>
</html>