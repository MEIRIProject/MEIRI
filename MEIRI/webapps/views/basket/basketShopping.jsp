    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.cart.model.vo.*,
                          java.util.*"%>
    
<%
   ArrayList<CartView> cav = 
      (ArrayList<CartView>)request.getAttribute("cartlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
<style>

   
   
   .container>.container2{
   align:center;
   }
   
   .pagingArea{
      padding-top : 3%;
      width: 100%:
   }
   .pagingArea button:active {
      background: #c5322d;
      color : white;
   }
   
   .btn10{
   float:right;
   background:#2c3e50;
   color:#f79521;
   width:130px;
   border:none;
   height:50px;
   border-top
   }
   
   .paytotal{
   	border : solid 2px #2c3e50;
   	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	
	
   }
   
   .paytotal h3{
   text-align:center;
   font-size:15px;
   color:grey;
   
   }
</style>

</head>

<body>
<%@ include file="/views/common/header.jsp" %>

<% int sum=0; %>
   <div>
      
      <br><br><br><br><br>
      <br><br><br>
      
      <div class="container container2">
      <div class="col-lg-9">
         <h2>장바구니</h2>
         <hr>

         <form id="basketForm" method='post' onsubmit="return check()">

            <table class="table" id="listArea">
               <thead>
                  <tr>
                  
                     <th><input class="au-checkmark" type="checkbox" id="checks"> 전체</th>
                     <th>상품정보</th>
                     <th></th>
                     <th>수량 </th>
                     <th></th>
                     <th>상품금액</th>
                     <th>금액</th>
                     <th></th>
                        
                     
                     
                     

                  </tr>
               </thead>
               <tbody>
                  <%
                     for (int i=0; i<cav.size(); i++) {
                        
                        sum=sum+cav.get(i).getPprice()*cav.get(i).getQuantity();
                  %>
                  <tr>
                     <td style="display : none;"><%=cav.get(i).getCartcode() %></td>
                     
                     <td><input  type='checkbox' name='choice' clsaa="check"
                        value='<%=cav.get(i).getCartcode()%>'>
                     <td><img
                        src="/meiri/resources/productUploadFiles/<%=cav.get(i).getChangename()%>"
                        width="50px" height="50px"></td>
                     <td><%=cav.get(i).getPname()%>
                     <input type="hidden" name="p_name" value="<%=cav.get(i).getPname()%>"></td>
                     <td><input  type="number" name="b_count" value = "<%=cav.get(i).getQuantity()%>" style="width:40px" ></td>
                     <td><input type="hidden" name="p_no" value="<%= cav.get(i).getPcode() %>"/></td>
                     <td id="price"><%=cav.get(i).getPprice()%>
                     <input type="hidden" name="p_price" value="<%=cav.get(i).getPprice()%>"></td>
                     <td><span class="productPrice">0</span>
                     <input type="hidden" name="p_sum" value="0"></td>
                     <td><input type="hidden" name="u_no" value="user01"/></td>
                     <td>
                  <button onclick="deleteCart(this)">삭제하기</button>
                  <input type="hidden" value="<%= cav.get(i).getCartcode() %>" />
               </td>
                     
                     
                  </tr>
                  
                  
                  <%
                     }
                  %>
               </tbody>
            </table>
            <hr>
            <div class="paytotal" style="margin-right:50px;">
            <h3 align="right">총 결제금액 : <span id="totalPrice">0</span>
            </div>
            <input type="hidden" name="totalPrice" id="totalPrice" value="0"></h3>
            <div class="btn">
            <button class="btn10" onclick="paymentBasket();">주문</button>
            </div>
           
           
             
         </form>
         
      
            
         
         
         <script>
         function deleteCart(obj){
          console.log($(obj).siblings('input').val());
          if(confirm("상품을 삭제하시겠습니까?")){
             $.ajax({
                url : '/meiri/deleteCart.ca',
                type : 'post',
                data : {
                   userid : "user01",
                   cno : $(obj).siblings('input').val()
                }, success : function(data){
                   alert(data);
                   window.location.reload();
                }, error : function(){
                   alert("장바구니에 상품 삭제를\n실패했습니다");
                }
             });
          }
       };
         
         function check(){
             console.log("토탈"+$('#totalPrice').text());
          
             if($('#totalPrice').text() == "0"){
                alert("상품을 선택해주세요!!");
                return false;
             } else{
                return true;
             }

          }
         
         
         $('input[name=choice]').each(function(){
            $(this).click(function() {
                
                console.log($(this).val());      
                 
                 console.log($(this).parent().siblings('td').eq(0).text());
                
                 if($(this).parents('tr').find('[name=sendData]') != null){
                     $(this).parents('tr').find('[name=sendData]').remove();
                  }
                 console.log($(this).parents('tr'));
                 console.log($(this).parents('tr').find('td'));
                 console.log("번호"+$(this).parents('tr').find('td').eq(5).children('[name=p_no]').val());
                 console.log("이름"+$(this).parents('tr').find('td').eq(3).text());
                 console.log("가격"+$(this).parents('tr').find('td').eq(6).text());
                 console.log("갯수"+$(this).parents('tr').find('td').eq(4).children('[name=b_count]').val());
                 console.log("합계"+$(this).parents('tr').find('td').eq(7).text());
                 console.log("장바구니 번호"+$(this).val());
                 
              // 제품번호, 제품이름, 제품가격, 제품 수량, 합
                 var $td = $('<td name="sendData" style="display:none;">');
                 $td.append('<input type="hidden" name="p_no3" value="'+Number($(this).parents('tr').find('td').eq(5).children('[name=p_no]').val())+'">');
                 $td.append('<input type="hidden" name="p_name3" value="'+$(this).parents('tr').find('td').eq(3).text()+'">');
                 $td.append('<input type="hidden" name="p_price3" value="'+Number($(this).parents('tr').find('td').eq(6).text())+'">');
                 $td.append('<input type="hidden" name="p_count3" value="'+Number($(this).parents('tr').find('td').eq(4).children('[name=b_count]').val())+'">');
                 $td.append('<input type="hidden" name="p_sum3" value="'+Number($(this).parents('tr').find('td').eq(7).text())+'">');
                 $td.append('<input type="hidden" name="b_no3" value="'+Number($(this).val())+'">');
                 
                 
                 $(this).parents('tr').append($td);
               
             });
         });
        
         
         
    
         
            
            $(function() {
               
            
               var total=0;
               var total2=0;
               
               
               $('[name=choice]').each(function(i, e) {
               
                          console.log("가"+Number($(e).parent().parent().find('td').eq(6).text()));
                          console.log("나"+Number($(e).parent().parent().find('input[type=number]').val()));
               
                          total2 = Number($(e).parent().parent().find('td').eq(6).text()) *
                                 Number($(e).parent().parent().find('input[type=number]').val());
                   
                         console.log(total2);
                         $(e).parents('tr').find('.productPrice').text(total2);
                         $(e).parents('tr').find('.productPrice').siblings('[name=p_sum]').val(total2);
                   });

                  
               
            });
         
            
            function paymentBasket() {
               $("#basketForm").attr("action","<%=request.getContextPath()%>/cartPay.ca");
            }
            
            
            
            $('[name=b_count]').each(function(){
               var $obj = $(this);
               $(this).change(function(){
               //$obj.parent().parent().find('[type=checkbox]').prop('checked', 'true');
               
               
               
               
               
               
               
               $('[name=choice]').each(function(i, e) {
               
                          total2 = Number($(e).parent().parent().find('td').eq(6).text()) *
                                 Number($(e).parent().parent().find('input[type=number]').val());
                   
                         console.log(total2);
                         $(e).parents('tr').find('.productPrice').text(total2);
                         $(e).parents('tr').find('.productPrice').siblings('[name=p_sum]').val(total2);
                   });
               
               
               
               
               total = 0;
               
               console.log($(this).val());
               
               $('[name=choice]:checked').each(function(i, e) {

                       console.log(Number($(e).parent().parent().find('td').eq(6).text()));
                       console.log(Number($(e).parent().parent().find('input[type=number]').val()));
                     
                        total += Number($(e).parent().parent().find('td').eq(6).text()) *
                              Number($(e).parent().parent().find('input[type=number]').val());
                
                      console.log(total);
                });

            $('#totalPrice').text(total); 
            $('#totalPrice').siblings('[name=totalPrice]').val(total);
               
               
               
               
               
               
               
               });
            });
            
            $(function() {

               $("#checks").click(function() {
                  if ($("#checks").prop("checked")) {

                     $("input[type=checkbox]").prop("checked", true);
                     
                     if($(this).parents('tr').find('[name=sendData]') != null){
                         $(this).parents('tr').find('[name=sendData]').remove();
                      }
                     
                     $('input[name=choice]:checked').each(function(){
                       
                            
                            console.log($(this).val());      
                             
                             console.log($(this).parent().siblings('td').eq(0).text());
                            
                             
                             console.log($(this).parents('tr'));
                             console.log($(this).parents('tr').find('td'));
                             console.log("번호"+$(this).parents('tr').find('td').eq(5).children('[name=p_no]').val());
                             console.log("이름"+$(this).parents('tr').find('td').eq(3).text());
                             console.log("가격"+$(this).parents('tr').find('td').eq(6).text());
                             console.log("갯수"+$(this).parents('tr').find('td').eq(4).children('[name=b_count]').val());
                             console.log("합계"+$(this).parents('tr').find('td').eq(7).text());
                             
                             
                          // 제품번호, 제품이름, 제품가격, 제품 수량, 합
                             var $td = $('<td name="sendData" style="display:none;">');
                             $td.append('<input type="hidden" name="p_no3" value="'+Number($(this).parents('tr').find('td').eq(5).children('[name=p_no]').val())+'">');
                             $td.append('<input type="hidden" name="p_name3" value="'+$(this).parents('tr').find('td').eq(3).text()+'">');
                             $td.append('<input type="hidden" name="p_price3" value="'+Number($(this).parents('tr').find('td').eq(6).text())+'">');
                             $td.append('<input type="hidden" name="p_count3" value="'+Number($(this).parents('tr').find('td').eq(4).children('[name=b_count]').val())+'">');
                             $td.append('<input type="hidden" name="p_sum3" value="'+Number($(this).parents('tr').find('td').eq(7).text())+'">');
                             $td.append('<input type="hidden" name="b_no3" value="'+Number($(this).val())+'">');
                             
                             $(this).parents('tr').append($td);
                           
                        
                     });
                     
                  } else {
                     $("input[type=checkbox]").prop("checked", false);
                     
                     $("input[class=check]").prop("checked",false);
                     if($("input[name=choice]").prop("checked")==false){
                        $('input[name=choice]').parents('tr').find('[name=sendData]').remove();
                     }
                  }

               });
               
               
               $('input[type=checkbox]').click(function(){
                  total = 0;
                  
                        console.log($(this).val());
                        
                        $('[name=choice]:checked').each(function(i, e) {

                                console.log(Number($(e).parent().parent().find('td').eq(6).text()));
                                console.log(Number($(e).parent().parent().find('input[type=number]').val()));
                              
                                 total += Number($(e).parent().parent().find('td').eq(6).text()) *
                                       Number($(e).parent().parent().find('input[type=number]').val());
                         
                               console.log(total);
                         });
 
                     $('#totalPrice').text(total); 
                     $('#totalPrice').siblings('[name=totalPrice]').val(total);
                     

                     
                    
                  });
                     
            });
            
            $('input[name=choice]').click(function(){
                
                if($(this).prop('checked') == false){
                   console.log('삭제시작');
                   console.log($('input[name=choice]').parents('tr').find('[type=hidden]').eq(0).val());
                   console.log($('input[name=choice]').parents('tr').find('[type=hidden]').eq(1).val());
                   console.log($('input[name=choice]').parents('tr').find('[type=hidden]').eq(2).val());
                   console.log($('input[name=choice]').parents('tr').find('[type=hidden]').eq(3).val());
                   console.log($('input[name=choice]').parents('tr').find('[type=hidden]').eq(4).val());
                   $('input[name=choice]').parents('tr').find('[name=sendData]').remove();
                   
                }
                
                
             });
         </script>
         </div>
         </div>
         <br /><br /><br /><br />
         <%@ include file="/views/common/footer.jsp" %>
</body>
</html>
    