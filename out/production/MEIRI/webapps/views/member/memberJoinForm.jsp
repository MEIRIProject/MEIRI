<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>회원 가입</title>
<link href="/meiri/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/css/main.css" rel="stylesheet" type="text/css">
    <link href="/meiri/resources/fonts/webfonts/NotoKR-all/stylesheet.css" rel="stylesheet" type="text/css">
</head>
<body>

<%@ include file="/views/common/header.jsp" %>
 <form id="joinForm" action="/meiri/mInsert.me" method="post">
    <div class="wrap">
        <p class="sub_title">회원가입</p>
          <div class="join_ul_box">
            <ul class="join_ul">
                <li>
                    <p>아이디</p>
                    <div>
                        <input type="text" name="userId" id="userId"  required="required" placeholder="아이디를 입력해 주세요">
                        <button class="btn btn-info" id="idCheck" type="button">중복확인</button>
                    </div>
                </li>
                <li>
                    <p>비밀번호</p>
                   <input type="password"  name="password" id="password"  required="required" placeholder="패스워드를 입력해 주세요">
                 </li>
                <li>
                    <p>비밀번호 확인</p>
                    <input type="password" name="password2" id="password2"placeholder="패스워드를 입력해 주세요">
                     <label id="pwdResult"></label>
                </li>
                <li>
                    <p>이름</p>
                    <input type="text" name="userName" id="userName" required="required" placeholder="이름을 입력해 주세요">
                </li>
                <li>
                    <p>생년월일</p>
                    <input type="text" name="birth" placeholder="생년월일 입력해 주세요">
                </li>
                <li>
                    <p>이메일</p>
                    <div>
                        <div>
                            <input id="email1" name="email1" type="text" placeholder="이메일을 입력해 주세요">
                            <span>@</span>
                            <select id="email2" name="email2">
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="nate.com">nate.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                            </select>
                        </div>
                        <button class="btn btn-info" id="emailCheck" type="button">중복확인</button>
                    </div>
                </li>
                <li>
                    <p>우편번호</p>
                    <div>
                        <input type="text" id="zipCode" name="zipCode" placeholder="우편번호를를 입력해 주세요">
                        <button class="btn btn-info" id="ckZip" onclick="addrSearch();" type="button">검색</button>
                    </div>
                </li>
                <li>
                    <p>주소</p>
                    <input type="text" name="address1" id="address1" placeholder="주소를 입력해 주세요">
                </li>
                <li>
                    <p>상세주소</p>
                    <input type="text" name="address2" id="address2" placeholder="주소를 입력해 주세요">
                </li>
                <li>
                    <p>연락처</p>
                    <div class="phone">
                        <select name="tel1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                        </select>
                        <span>-</span>
                        <input type="text" name="tel2">
                        <span>-</span>
                        <input type="text" name="tel3">
                    </div>
                    
                </li>
            </ul>
            <div class="two_btn">
                <button type="button" id="goMain" class="btn btn-info" onclick="goMain();">메인으로</button>
                <button type="button" id="joinBtn" class="btn btn-info" onclick="insertMember();">가입하기</button>
            </div>
        </div>
    </div>
           </form>
    
     <script>
            function insertMember() {
               $("#joinForm").submit();
            }
            
            $("#joinForm").submit(function(event){
               if($("#password").val() == "" || $("#userId").val() == "") alert("아이디나 비밀번호는 필수 값입니다.");
               else if($('#password').val() != $('#password2').val()) alert("비밀번호가 일치하지 않습니다.");
               else return;
               event.preventDefault();
            });
            
            // 참조 API : http://postcode.map.daum.net/guide
            function addrSearch() {
                 new daum.Postcode({
                     oncomplete: function(data) {
                         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                         var fullAddr = ''; // 최종 주소 변수
                         var extraAddr = ''; // 조합형 주소 변수

                         // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                             fullAddr = data.roadAddress;

                         } else { // 사용자가 지번 주소를 선택했을 경우(J)
                             fullAddr = data.jibunAddress;
                         }

                         // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                         if(data.userSelectedType === 'R'){
                             //법정동명이 있을 경우 추가한다.
                             if(data.bname !== ''){
                                 extraAddr += data.bname;
                             }
                             // 건물명이 있을 경우 추가한다.
                             if(data.buildingName !== ''){
                                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                             }
                             // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                             fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                         }

                         // 우편번호와 주소 정보를 해당 필드에 넣는다.
                         $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
                         
                         $('#address1').val(fullAddr);

                         // 커서를 상세주소 필드로 이동한다.
                         $('#address2').focus();
                     }
                 }).open();
             };
            
         function goMain(){
            location.href='/meiri/index.jsp';
         };
         
         $('#idCheck').on('click',function(){
            $.ajax({
               url : '/meiri/idDup.me',
               type : 'post',
               data : { userId : $('#userId').val() },
               success : function(data){
                  // console.log(data);
                  
                  // 전달된 결과가 0이면 사용자 없음 : 가입 가능!
                  //     ' '       1    `  `    있음 : 가입 불가!
                  if ( data == 0 ) {
                     alert("사용 가능한 아이디입니다.");
                  } else {
                     alert("이미 사용 중인 아이디입니다.");
                  }
                }, error : function(){
                  console.log("에러 발생");
               }
            });
         });
         
         $('#emailCheck').click(function() {
            
            var email1 = $('#email1').val();
            var email2 = $('#email2').val();
            var email3 = email1 + '@' + email2; 
            
            
            $.ajax({
               url : '/meiri/emailDup.me',
               type : 'post',
               data : { 
                      email : email3
                       },
               success : function(data){
                  
                  if ( data == 'ok' && $('#email1').val() != "" && $('#email2').val() != "") {
                     alert("사용 가능한 이메일입니다.");
                  } else {
                     alert("이미 사용 중인 이메일입니다.");
                     $('#email1').select();
                  }
               }, error : function(){
                  console.log("에러 발생");
               }
            });
         });
      
            
         </script>
            
                  
             <%@ include file="/views/common/footer.jsp" %>
    
</body>
</html>