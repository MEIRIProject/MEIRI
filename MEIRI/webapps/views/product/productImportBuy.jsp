<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userid = request.getParameter("userid");
	String useremail = request.getParameter("useremail");
	String useraddress = request.getParameter("useraddress");
	String userphone = request.getParameter("userphone");
	String pname = request.getParameter("pname");
	String productPrice = request.getParameter("productPrice");
	String productQuantity = request.getParameter("productQuantity");
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	 <script>
    $(function(){
	
        var IMP = window.IMP; 
        IMP.init('imp26448552');
        var msg;
        
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'MEIRI<%=pname%>',
            amount : <%=totalPrice%>,
            buyer_email : '<%=useremail%>',
            buyer_name : '<%=userid%>',
            buyer_tel : '<%=userphone%>',
            buyer_addr : '<%=useraddress%>'
            
        }, function(rsp) {
	       	   if ( rsp.success ) {
	       	        var msg = '결제가 완료되었습니다.';
	       	        msg += '고유ID : ' + rsp.imp_uid;
	       	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	       	        msg += '결제 금액 : ' + rsp.paid_amount;
	       	     	location.href='<%=request.getContextPath()%>/orderConfirm?msg=' + msg;
	       	    } else {
	       	        var msg = '결제에 실패하였습니다.';
	       	        msg += '에러내용 : ' + rsp.error_msg;
	       	    }
	       	    alert(msg);        	
        });
        
    });
    </script>
</body>
</html>