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
		height:350px;
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
<script src="/meiri/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	
	<div class="outer">
		<br>
		<h2 align="center">1:1문의 상세보기</h2>
		<div class="tableArea">
				<table align="center" width="800px">
					<tr>
						<td>제목 </td>
						<td colspan="5"><span><%= b.getInqtitle() %></span></td>
					</tr>
					<tr>
						<td>작성자 </td>
						<td><span><%= b.getInqwriter() %></span></td>
					</tr>
					<tr>
						<td colspan="6">내용 </td>
					</tr>
					<tr>
						<td colspan="6">
							<p id="content"><%= b.getInqcontent() %>
						</td>
					</tr>
				</table>
				<br>
		</div>
		<div align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/inquiryList.in'">돌아가기</button>
			
			
			
		</div>
		
		<div class="replyArea">
			<div class="replyWriteArea">
				<form action="<%= request.getContextPath() %>/insertComment.in" method="post">
					<input type="hidden" name="writer" value="ADMIN"><!-- 변경될수있음 -->
					<input type="hidden" name="inqno" value="<%= b.getInqno() %>" />
					
					<table align="center">
						<tr>
							<td>답변 작성</td>
							<td>
								<textarea name="replyContent" id="replyContent" 
								          cols="80" rows="3"></textarea>
							</td>
							<td>
								<button type="submit" id="addReply">
									답변 등록
								</button>
							</td>
							
						</tr>
					</table>
					
				
				
				
				</form>			
			</div>	
			<div class="replySelectArea">
			<!-- 댓글 목록 구현 영역 -->
			<% if (clist.size() == 0) { %>
				<span>답변을 달아주세요</span>
			<% } else {
				for(InquiryComment bco : clist) { %>
				
			<table id="replySelectTable"
		      	 style="margin-left : 0px;
		      	 		width : 800px;"
		      	 class="replyList">
		  		<tr>
		  			<td rowspan="2"> </td>
					<td><b><%= bco.getUserId() %></b></td>
					<td><%= bco.getCdate() %></td>
					<td align="center">
 					
						<input type="hidden" name="cno" value="<%=bco.getCno()%>"/>
							  
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp;
							
						<button type="button" class="deleteBtn"
							onclick="deleteReply(this);">삭제하기</button>
							
					</td>
				</tr>
				<tr class="comment replyList">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="105" rows="3"
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