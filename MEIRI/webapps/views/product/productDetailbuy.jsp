<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.product.model.vo.*,
    							com.meiri.jsp.member.model.vo.*"%>

<%
Member m = (Member)session.getAttribute("member");

Product p = (Product)request.getAttribute("product");

int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));

int totalPrice = p.getPrice()*productQuantity;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="outer">
		<form action="<%= request.getContextPath() %>/importBuy.pd" method="post" id="buyForm" name="buyForm">
			<div id="listArea" align="center">
				<h2 align="center">주문 상품</h2>			 
				<table class="table1">
					<tr>
						<td></td>
						<td></td>
						<td>상품명</td>
						<td>상품서브명</td>
						<td>상품 가격</td>
						<td>개수</td>
					</tr>
					
					<tr>
						<td><input type="hidden" name="userid" value="<%=m.getUserId()%>"/></td>
						<td><input type="hidden" name="pcode" value="<%=p.getPcode()%>"/></td>
						<td><input type="text" name="pname" value="<%= p.getPname() %>" readonly></td>
						<td><input type="text" name="ptitle" value="<%= p.getPtitle() %>" readonly></td>
						<td><input type="text" name="productPrice" value="<%= p.getPrice() %>" readonly></td>
						<td><input type="text" name="productQuantity" value="<%= productQuantity %>" readonly></td>
					</tr>
				</table>		
				
				<table class="table1">
					<tr>
						
						<td>주문자명</td>
						<td>주문자 이메일</td>
						<td>주소</td>
						<td>주문자 전화번호</td>
						
					</tr>
					
					<tr>
						<td><input type="text" name="userid" value="<%=m.getUserId()%>" readonly/></td>
						<td><input type="text" name="useremail" value="<%=m.getEmail()%>" readonly/></td>
						<td><input type="text" name="useraddress" value="<%=m.getAddress()%>" readonly/></td>
						<td><input type="text" name="userphone" value="<%= m.getPhone() %>" readonly></td>
					</tr>
				</table>		
				
				<br><br><br><br>
				총 금액 : <input type="text" name="totalPrice" value="<%= totalPrice %>" readonly>	
				<br><br><br><br>
				
			</div>
			<hr>
			<br>
		
			<hr>
			<br><br><br><br>
			<div align="center">
				<input type="submit" onclick="" value="주문하기" class="Btn">
				<input type="button" onclick="location.href='javascript:history.back();'" value="주문 취소" class="Btn">
			</div>
			<br><br><br><br>	
		</form>	
	</div>



</body>
</html>