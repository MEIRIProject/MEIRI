<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.product.model.vo.*"%>

<%


Product p = (Product)request.getAttribute("product");

int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));

int totalPrice = p.getPrice()*productQuantity;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .btna input{
   padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
    }
   .noo td input{
   border:none;
   width:250px;
   }
  
    
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
      <div class="outer">
      <form action="<%= request.getContextPath() %>/importBuy.pd" method="post" id="buyForm" name="buyForm">
         <div id="listAre" align="center">
            <h2 align="center">주문 상품</h2>   
            <hr style="width:100px; align:center;'">       
            <br />
            <table class="table1">
               <tr>
                  <td></td>
                  <td></td>
                  <td>상품명</td>
                  <td>상품서브명</td>
                  <td>상품 가격</td>
                  <td>개수</td>
               </tr>
               
               <tr class="noo">
                  <td><input type="hidden" name="userid" value="<%=m.getUserId()%>"/></td>
                  <td><input type="hidden" name="pcode" value="<%=p.getPcode()%>"/></td>
                  <td><input type="text" name="pname" value="<%= p.getPname() %>" readonly></td>
                  <td><input type="text" name="ptitle" value="<%= p.getPtitle() %>" readonly></td>
                  <td><input type="text" name="productPrice" value="<%= p.getPrice() %>" readonly></td>
                  <td><input type="text" name="productQuantity" value="<%= productQuantity %>" readonly></td>
               </tr>
            </table>      
            <hr />
            <table class="table1">
               <tr>
                  
                  <td>주문자명</td>
                  <td>주문자 이메일</td>
                  <td>주소</td>
                  <td>주문자 전화번호</td>
                  
               </tr>
               
               <tr class="noo">
                  <td><input type="text" name="userid" value="<%=m.getUserId()%>" readonly/></td>
                  <td><input type="text" name="useremail" value="<%=m.getEmail()%>" readonly/></td>
                  <td><input type="text" name="useraddress" value="<%=m.getAddress()%>" readonly/></td>
                  <td><input type="text" name="userphone" value="<%= m.getPhone() %>" readonly></td>
               </tr>
            </table>      
            <div style="margin-left:140px;">
            <br><br><br><br>
            <strong>총 금액 : </strong><input type="text" name="totalPrice" value="<%= totalPrice %>" readonly style="border:none;">
            <br><br><br><br>
            </div>
         </div>
         <hr>
         <br>
      
      
         <br><br><br><br>
         <div class="btna" align="center">
            <input type="submit" onclick="" value="주문하기" class="Btn">
            <input type="button" onclick="location.href='javascript:history.back();'" value="주문 취소" class="Btn">
         </div>
         <br><br><br><br>   
      </form>   
   </div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>