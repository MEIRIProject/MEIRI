<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.meiri.jsp.member.model.vo.*
    							,com.meiri.jsp.product.model.vo.*,	
    							java.util.* "%>
<%
	Member m = (Member) session.getAttribute("member");
	ArrayList<ProductView> pvlist = (ArrayList<ProductView>) request.getAttribute("pvlist");
	int idx = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
<meta name="copyright" content="ninodezign.com">
<title>MEIRI</title>

<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script>
<!-- favicon -->
<link rel="shortcut icon" href="resources/images/meiri-logo2.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="resources/images/ico/apple-touch-icon-57-precomposed.png">

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/materialdesignicons.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/prettyPhoto.css" />
	
<link rel="stylesheet" type="text/css" href="resources/css/owl.carousel.min.css" />	
<link rel="stylesheet" type="text/css" href="resources/css/unslider.css" />
<link rel="stylesheet" type="text/css" href="resources/css/template.css" />

<style>
#userLoginBtn, #userJoinBtn {
	cursor: pointer;
}

.ic {
	margin-left: -5%;
}

#sidebox {
    background-color:none;
    position:absolute; width:120px;
    top:440px; right:30px;
    padding: 3px 10px;
    border-radius : 6px;
      opacity : 60%;
     }
#sidebox > div:hover{
     opacity:100%;
     
     }
.sideboxmenu{
       text-align:center;
       border:solid 0px #1f76bc;
       margin-bottom:5px;
       opacity: 70%;   
       border-radius : 6px;
       background:#2c3e50;
       height:100px;
       line-height: 95px;
       
       
    }
.sidebartext{
      color:white; 
      }
      
      
      /* Set the size of the div element that contains the map */

#map {

        height: 400px;  /* The height is 400 pixels */

        width: 100%;  /* The width is the width of the web page */

       }   
      
.owl-nav{
    background : none;
    border: none;
    color: #1f76bc;
    font-size: 30px;
    font-weight: bold;
    margin-left:50%;
    margin-top:5%;
}      
      
</style>

</head>

</head>

<body data-target="#nino-navbar" data-spy="scroll">



	<!-- Header -->
	<header id="nino-header">
	
		<ul class="cb-slideshow">
            <li><span></span><div><h3></h3></div></li>
            <li><span></span><div><h3></h3></div></li>
            <li><span></span><div><h3></h3></div></li>
            <li><span></span><div><h3></h3></div></li>
            <li><span></span><div><h3></h3></div></li>
            <li><span></span><div><h3></h3></div></li>
        </ul>
        
		<div id="nino-headerInner">
			<div class="navbar-subheader">
				<%
					if (m == null) {
				%>
				<ul>
					<li><div id="userLoginBtn"
							onclick="location.href='/meiri/views/member/memberLoginForm.jsp';">로그인</div></li>&nbsp;&nbsp;
					<li><div id="userJoinBtn"
							onclick="location.href='/meiri/views/member/memberJoinForm.jsp';">회원가입</div></li>
				</ul>
				<%
					} else if (m != null && m.getUserId().equals("admin")) {
				%>
				<ul>
					<li><%=m.getUserName()%></li>
					<li><div id="userLoginBtn"
							onclick="location.href='/meiri/views/admin/adminPage.jsp';">관리자
							페이지</div></li>&nbsp;&nbsp;
					<li><div id="userJoinBtn"
							onclick="location.href='/meiri/logout.me';">로그아웃</div></li>
				</ul>
				<%
					} else {
				%>
				<ul>
					<li><%=m.getUserName()%></li>
					<li><div id="userLoginBtn"
							onclick="location.href='<%=request.getContextPath()%>/mypage.my'">마이페이지</div></li>&nbsp;&nbsp;
					<li><div id="userJoinBtn"
							onclick="location.href='/meiri/logout.me';">로그아웃</div></li>
				</ul>
				<%
					}
				%>
			</div>
			<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#nino-navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="index.pl"><img
							src="resources/images/meiri-logo.PNG" alt="" width=30px
							height=30px style="margin-top: -5px;"/ ></a> <a
							class="navbar-brand" href="index.pl">
		                  <span style="color:black">M<span style="color:#1f76bc">E</span><span style="color:#f79521">I</span><span style="color:#1f76bc">R</span><span style="color:#f79521">I</span></a>					
							</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="nino-menuItem pull-right">
						<div class="collapse navbar-collapse pull-left"
							id="nino-navbar-collapse">
							<ul class="nav navbar-nav">
								<li><a href="#" class="nino-search"><i
										class="mdi mdi-magnify nino-icon"></i></a></li>
								<li class="active"><a href="#nino-header">Home <span
										class="sr-only">(current)</span></a></li>
								<li><a href="#nino-services">본사 소개</a></li>
								<li onmouseover="showhead_dept('head_dept02');"
									onmouseout="hidehead_dept();"><a href="#nino-story">제품
										정보</a></li>
								<li><a href="#nino-map">오시는 길</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
						<ul class="nino-iconsGroup nav navbar-nav">
							<li><a onclick="basketShopping()"><i
									class="mdi mdi-cart-outline nino-icon"></i></a></li>
						</ul>
					</div>
				</div>
					<script>
						function basketShopping() {
						
							var userid = 'user01';
           				    location.href = "<%= request.getContextPath() %>/selectCart.ca?userid=" + userid;
						}
					</script>
				
				<!-- /.container-fluid -->
				<div id="head_dept02" class="head_dept02"
					onmouseover="showhead_dept('head_dept02');"
					onmouseout="hidehead_dept();">
					<ul>
						<li><a href="#">LED 거실등</a></li>
						<li><a href="#">LED 방등</a></li>
						<li><a href="#">LED 주방등</a></li>
						<li><a href="#">식탁/펜던트/포인트</a></li>
						<li><a href="#">인기 상품</a></li>
						<li><a href="#">신상품</a></li>
					</ul>
				</div>
			</nav>

			<section id="nino-slider" class="carousel slide container"
				data-ride="carousel">

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<h2 class="nino-sectionHeading" style="margin-top:15%">
							<span class="nino-subHeading"></span> MEIRI
						</h2>
						<a href="#" class="nino-btn">밝고 따뜻한 빛을 선사하는 LED 조명 제조 전문 기업</a>
					</div>
				</div>
			</section>
		</div>
	</header>
	
	
	 <!-- Services
    ================================================== -->
    <section id="nino-services">
    <div class="container2" style="width:1800px;">
    
       <div class="spaceb" style=" justify-content: space-between; display:flex; width:1800px;">
      
         <div class="profile" style="margin-left:400px;">
            <img src="resources/images/yeon2.png">
         </div>
         <div class="profile" style="margin-right:300px;">
            <img src="resources/images/yeon.png">
         </div>
      </div>
    </div>
    </section><!--/#nino-services-->


	<!--/#header-->

	<section id="nino-whatWeDo">
		<div class="container">
			<h2 class="nino-sectionHeading">
				<span class="nino-subHeading">MEIRI</span> 회사 정보
			</h2>
			<div class="sectionContent">
				<div class="row">
					<div class="col-md-6">
						<div class="meiriimage">
							<img src="resources/images/meiri-company2.jpg" width=550px
								height=400px alt="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne"> <img
											class="ic" src="resources/images/icon1.png" alt="" />&nbsp;
											주소
										</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">경기도 부천시 삼작로163번길 78 (우)14453</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo"> <img
											class="ic" src="resources/images/icon2.png" alt="" />&nbsp;전화
											번호
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">032-683-0222</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree"> <img
											class="ic" src="resources/images/icon3.png" alt="" />&nbsp;
											이용 시간
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">평일 9:00 ~ 18:00</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="nino-story" class="nino-testimonial bg-white">
		<div class="container">
			<h2 class="nino-sectionHeading" >제품 정보</h2>
			<hr />
		<div class="owl-carousel owl-theme">
  		<div><img src="resources/images/meiri1.jpg" width=190px height=200px></div>
 		 <div><img src="resources/images/meiri2.jpg" width=190px height=200px></div>
 		 <div> <img src="resources/images/meiri3.jpg" width=190px height=200px> </div>
 		  <div> <img src="resources/images/meiri4.jpg" width=190px height=200px> </div>
 		   <div> <img src="resources/images/meiri5.jpg" width=190px height=200px> </div>
		  <div><img src="resources/images/meiri6.jpg" width=190px height=200px> </div>
  		<div> <img src="resources/images/meiri7.jpg" width=190px height=200px> </div>
  		<div><img src="resources/images/meiri8.jpg" width=190px height=200px></div>
		</div>
			<hr />
		</div>
	</section>
	<script>
$(document).ready(function(){
  $('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:10,
	    nav:true,
	    autoplay:true,
	    autoplayTimeout:3000,
	    
	    responsive:{
	        0:{
	            items:1,
	        },
	        600:{
	            items:3,
	        },
	        1000:{
	            items:5,
	        }
	    }
  });
});
</script>




	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">LED 거실등</h2>
			<div class="sectionProduct">
				<div class="row nino-hoverEffect">
					<%
						for (ProductView p : pvlist) {
					%>
					<div class="col-md-3 col-sm-3 productDetail item_<%=idx%>">
						<div class="item product">
							<a class="overlay" href="#"> <span class="content"> <%=p.getPname()%>
							</span> <img
								src="/meiri/resources/productUploadFiles/<%=p.getChangename()%>"
								alt="">
							</a>
						</div>
					</div>
					<input type="hidden" name="pcode" class="item_<%=idx++%>"
						value="<%=p.getPcode()%>" />
					<%
						}
					%>





				</div>
			</div>
	</section>
	<!--/#nino-story-->
	<script>
                  /* 제품 선택시 제품 상세보기로 넘어가기 */
                  $(function(){
                     $(".productDetail").click(function(){
                    	 var obj = $(this);
                    	 var pcodeClass = obj[0].className.substring(obj[0].className.indexOf('item'));
                         var pcode = $('input.'+pcodeClass).val();
                         location.href="<%=request.getContextPath()%>/pSelect.pd?pcode="+ pcode;
						});
				});
	</script>




























	<!-- Map
    ================================================== -->
    <section id="nino-map">
       <div class="container" style="display:block;">
          <h2 class="nino-sectionHeading">
             <i class="mdi mdi-map-marker nino-icon">&nbsp;오시는 길</i>
    
          </h2>
           <div id="mapWrap" style="width:500px; height: 500px; float:left;"></div>
           <div id="mapcontent" style="float:right; width:400px; height:500px; margin-right:140px;">
           <br><br><h3>경기도 부천시 삼작로163번길 78 (우)14453</h3>
                <p style="width:700px; height:400px; padding-top:100px;"><strong>-대중교통으로 오시는 길</strong><br>
                   부천IC 정류장 하차 후 GS 신화주유소 방향으로 500M 걸어 방문<br><br><br>
                   <strong>-자차로 오시는 길</strong> <br>
                   네비게이션 '경기도 부천시 삼작로163번길 78'검색 후 방문
                </p>
           </div>
          
         
          

  <script>

// Initialize and add the map

function initMap() {

  // The location of Uluru

  var uluru = {lat: -25.344, lng: 131.036};

  // The map, centered at Uluru

  var map = new google.maps.Map(

      document.getElementById('mapWrap'), {zoom: 4, center: uluru});

  // The marker, positioned at Uluru

  var marker = new google.maps.Marker({position: uluru, map: map});

}

    </script>

  <!--Load the API from the specified URL
* The async attribute allows the browser to render the page while the API loads
* The key parameter will contain your own API key (which is not needed for this tutorial)
* The callback parameter executes the initMap() function
-->
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLpT5ahlIT9Wbw_tgyYL2x8Vk46tIzl9w&callback=initMap">
</script>
        
     <script>
    // 구글 지도를 초기화 하고 마커를 추가한다.
    function initMap() {
        // 오스트레일리아 울룰루 산의 위도, 경도 정보
        var uluru = {lat: 37.5227676, lng: 126.7778141};
        // 구글 지도 객체를 생성하고, 위치는 uluru로 맞춘다.
        var map = new google.maps.Map(
            document.getElementById('mapWrap'), {zoom: 15, center: uluru});
        // Uluru 산에 마커를 위치시키는 ㅗ드
        var marker = new google.maps.Marker({position: uluru, map: map});
    }
</script>

    </section>
	<!--/#nino-map-->

	<section>
		<div></div>
	</section>

	<!-- Footer
    ================================================== -->
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div>
					<div class="colInfo" style="text-align: center;">
						<div class="footerLogo">
							<a href="#">MEIRI</a>
						</div>
						<h2 style="color: white;">회사 정보</h2>
						<p style="font-size: 15px;">
							이용 시간 : 평일 AM 09:00~ PM 18:00 <br /> 점심 시간 : PM 12:00 ~ PM 13:00
							<br /> 이메일 : kgudfhr96@naver.com <br /> 본사 : 경기도 부천시 삼작로163번길
							78 (우)14453
						</p>

						<div>
							<span class=""
								style="font-size: 20px; color: white; text-align: center;">
								고객 센터 </span>
						</div>
						<div>
							<span class=""
								style="font-size: 40px; color: white; text-align: center;">
								032-683-0222 </span>
						</div>

					</div>
				</div>

			</div>

			<div class="nino-copyright">Copyright &copy; 2020  김다희 김익주 김형록
				서형준 전재렬. All Rights Reserved. by MEIRI Team</div>
		</div>
	</footer>
	<!--/#footer-->

	<!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
	<form action="" id="nino-searchForm">
		<input type="text" placeholder="Search..."
			class="form-control nino-searchInput"> <i
			class="mdi mdi-close nino-close"></i>
	</form>
	<!--/#nino-searchForm-->

	<!-- Scroll to top
    ================================================== -->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	
	 <!-- sidebox -->
   <div id="sidebox" style="text-align:center">
          <div class="sideboxmenu"><a class="sidebartext" href='<%=request.getContextPath()%>/noticeList.no'">공지사항</a></div>
         <div class="sideboxmenu"><a class="sidebartext" href='<%=request.getContextPath()%>/inquiryList.in'">1:1 문의</a></div>
         <div class="sideboxmenu"><a class="sidebartext" href='<%=request.getContextPath()%>/questionList.qu'">자주묻는질문</a></div>
         
   </div>
   <script>
   var currentPosition = parseInt($("#sidebox").css("top"));
   $(window).scroll(function() {
      var position = $(window).scrollTop();
   $("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
   });

   </script>

	<!-- javascript -->
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript"
		src="resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript"
		src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script type="text/javascript" src="resources/js/owl.carousel.js"></script>
	<script type="text/javascript" src="resources/js/owl.carousel.min.js"></script>	
		
	<script type="text/javascript" src="resources/js/unslider-min.js"></script>
	<script type="text/javascript" src="resources/js/template.js"></script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
   <![endif]-->
	<!-- css3-mediaqueries.js for IE less than 9 -->
	<!--[if lt IE 9]>
       <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
   <![endif]-->

</body>
</html>