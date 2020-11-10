<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.admin.inquiry.model.vo.*, 
                                 com.meiri.jsp.admin.inquiryComment.model.vo.*,
                                 java.util.*"%>
    
<% Inquiry b = (Inquiry)request.getAttribute("inquiry"); 
   ArrayList<InquiryComment> clist = (ArrayList<InquiryComment>)request.getAttribute("clist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
<style>
   .outer{
      width:800px;
      height:500px;
      background:white;
      color:black;
      margin-left:auto;
      margin-right:auto;
        
      margin-top:50px;
   }
   td {
      border:2px solid #edeff1;
      background : white;
      color: black;
        padding-top:25px;
        padding-bottom: 25px;
        padding-left: 30px;

   }

   .tableArea {
      border: none;
      background : white;
      color: black;
      width:800px;
      height:350px;
      margin-left:auto;
      margin-right:auto;
   }
   #content {
      height:230px;
   }
    .attr{
        background: #dedede;
        font-weight: bold;
        width:78px; 
    }
    .attr2{
        background: #dedede;
        font-weight: bold;
        width:110px;
        text-align:left;
    }
    .btn button{
    padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
}
 .btn button:hover{
       cursor:pointer;
    }
 .replyArea textArea {
      border-radius: 10px;
      resize: none;
   }
    .btn button{
    padding: 0 24px;
   height: 40px;
   color: white;
   font-size: 18px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 25px;
   border: none;
}
    .btn button:hover{
       cursor:pointer;
    }
    #btn2{
        padding: 0 10px;
   height: 30px;
   color: white;
   font-size: 13px;
   font-weight: 600;
   background: #1f76bc;
   border-radius: 18px;
   border: none;
    }
    
</style>
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
   
   <div class="outer">
      <br>
      <h2 align="center">1:1문의 상세보기</h2>
      <div class="tableArea">
            <table align="center" width="800px">
               <tr>
                  <td class="attr">제목 </td>
                  <td class="attrcontent" colspan="5"><span><%= b.getInqtitle() %></span></td>
               </tr>
               <tr>
                  <td class="attr">작성자 </td>
                  <td class="attrcontent"><span><%= b.getInqwriter() %></span></td>
               </tr>
               
               
               <tr>
                  <td colspan="6">
                     <p id="content"><%= b.getInqcontent() %>
                  </td>
               </tr>
            </table>
            <br>
        </div>
        <br><br><br><br>
      <div class="btn" align="center">
        <button onclick="location.href='<%= request.getContextPath() %>/inquiryList.in'">돌아가기</button>
      </div>
   </div>
<br><br><br>
   <div class="replyArea" style="margin-top: 10px;">
    <div class="replyWriteArea">
        <form action="<%= request.getContextPath() %>/insertComment.in" method="post">
            <input type="hidden" name="writer" value="ADMIN"><!-- 변경될수있음 -->
            <input type="hidden" name="inqno" value="<%= b.getInqno() %>" />
            
            <table align="center" class="replytable">
                <tr>
                    <td>답변 작성</td>
                    <td>
                        <textarea name="replyContent" id="replyContent" 
                                  cols="75" rows="3"></textarea>
                    </td>
                    <td>
                        <button id="btn2" type="submit" id="addReply">
                                  답변 등록
                        </button>
                    </td>
                    
                </tr>
            </table>
            </form>         
      
         
         <div class="replySelectArea">
         <!-- 댓글 목록 구현 영역 -->
         <% if (clist.size() == 0) { %>
            <span style="margin-left:870px;">답변을 달아주세요</span>
         <% } else {
            for(InquiryComment bco : clist) { %>
            
      
            <table id="replySelectTable"
            style="margin-left : 0px;
                    width : 800px; margin-left:540px;"
            class="replyList">
           <tr>
             <td class="attr2"><b><%= bco.getUserId() %></b></td>
             <td class="attr2"><%= bco.getCdate() %></td>
             <td align="center">
              
                 <input type="hidden" name="cno" value="<%=bco.getCno()%>"/>
                       
                 <button type="button" class="updateBtn" id="btn2";
                     onclick="updateReply(this);">수정하기</button>
                     
                 <button type="button" class="updateConfirm"
                     onclick="updateConfirm(this);" id="btn2";
                     style="display:none;" >수정완료</button> &nbsp;&nbsp;
                     
                 <button type="button" class="deleteBtn" id="btn2";
                     onclick="deleteReply(this);">삭제하기</button>
                     
             </td>
         </tr>
         <tr class="comment replyList">
             <td colspan="3" style="background : transparent;">
             <textarea class="reply-content" cols="105" rows="4"
              readonly="readonly"><%= bco.getCcontent() %></textarea>
             </td>
         </tr>
     </table>
     <%
    }
}
%>
</div>

</div>
      
      </div>
      <script>
      
         function updateReply(obj) {
            
            // 현재 버튼의 위치와 가장 가까운 textarea 접근하기
            
            $(obj).parent().parent().next().find('textarea').removeAttr('readonly');
            
            // 수정 완료 버튼 보이게 하기
            $(obj).siblings('.updateConfirm').css('display', 'inline');
            
            // 현재 클릭한 수정 버튼 숨기기
            $(obj).css('display', 'none');
         }
         
         function updateConfirm(obj) {
            // 수정을 마친 댓글 내용 가져오기
            var content = $(obj).parent().parent().next().find('textarea').val();
            
            // 댓글 번호 가져오기
            var cno = $(obj).siblings('input').val();
            
            location.href = "<%= request.getContextPath() %>/updateComment.in?"
                        + "inqno=<%= b.getInqno() %>"
                        + "&cno=" + cno
                        + "&content=" + content;
         }
         
         function deleteReply(obj){
            // 댓글 번호 가져오기
            var cno = $(obj).siblings('input').val();
            
            // 게시글 번호 가져오기
            var inqno = '<%= b.getInqno() %>';
            
            //console.log("삭제 댓글 번호 : " + cno + " / " + bno);
            
            location.href="<%= request.getContextPath() %>/deleteComment.in"
                        + "?cno=" + cno + "&inqno=" + inqno;
            
         }
      </script>
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   <br />
   
      
   </div>

</body>
</html>