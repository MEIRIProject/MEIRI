<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.meiri.jsp.member.model.vo.*
    							,com.meiri.jsp.product.model.vo.*,
    							java.util.* "%>
<%
   Member m = (Member)session.getAttribute("member");
   ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");	
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
   
   <!-- favicon -->
    <link rel="shortcut icon" href="resources/images/meiri-logo2.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="resources/images/ico/apple-touch-icon-57-precomposed.png">
   
   <!-- css -->
   <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" />
   <link rel="stylesheet" type="text/css" href="resources/css/materialdesignicons.min.css" />
   <link rel="stylesheet" type="text/css" href="resources/css/jquery.mCustomScrollbar.min.css" />
   <link rel="stylesheet" type="text/css" href="resources/css/prettyPhoto.css" />
   <link rel="stylesheet" type="text/css" href="resources/css/unslider.css" />
   <link rel="stylesheet" type="text/css" href="resources/css/template.css" />
   
</head>

<body data-target="#nino-navbar" data-spy="scroll">



   <!-- Header -->
   <header id="nino-header">
      <div id="nino-headerInner">         
               <div class="navbar-subheader">
                  <%if ( m == null ) { %>
                  <ul> 
                     <li><div id="userLoginBtn" onclick="location.href='/meiri/views/member/memberLoginForm.jsp';">로그인</div></li>&nbsp;&nbsp;
                     <li><div id="userJoinBtn" onclick="location.href='/meiri/views/member/memberJoinForm.jsp';">회원가입</div></li>
                  </ul>
                  <% } else if( m != null && m.getUserId().equals("admin")){ %>
                  <ul> 
                     <li><%= m.getUserName() %></li>
                     <li><div id="userLoginBtn" onclick="location.href='/meiri/views/mypage/mypage.jsp';">관리자 페이지</div></li>&nbsp;&nbsp;
                     <li><div id="userJoinBtn" onclick="location.href='/meiri/logout.me';">로그아웃</div></li>
                  </ul>
                  <% } else {%>
                  <ul> 
                     <li><%= m.getUserName() %></li>
                     <li><div id="userLoginBtn" onclick="location.href='/meiri/views/mypage/mypage.jsp';">마이페이지</div></li>&nbsp;&nbsp;
                     <li><div id="userJoinBtn" onclick="location.href='/meiri/logout.me';">로그아웃</div></li>
                  </ul>
                  <% }%>
               </div>         
         <nav id="nino-navbar" class="navbar navbar-default" role="navigation">
            <div class="container">
               <!-- Brand and toggle get grouped for better mobile display -->
               <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nino-navbar-collapse">
                     <span class="sr-only">Toggle navigation</span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="index.jsp"><img src="resources/images/meiri-logo.PNG" alt="" width=30px height=30px style="margin-top:-5px;"/ ></a>
                  <a class="navbar-brand" href="index.jsp">MEIRI</a>
               </div>

               <!-- Collect the nav links, forms, and other content for toggling -->
               <div class="nino-menuItem pull-right">
                  <div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
                     <ul class="nav navbar-nav">
                        <li><a href="#" class="nino-search"><i class="mdi mdi-magnify nino-icon"></i></a></li>
                        <li class="active"><a href="#nino-header">Home <span class="sr-only">(current)</span></a></li>
                        <li>
                           <a href="#nino-story" onmouseover="showhead_dept('head_dept02');" onmouseout="hidehead_dept();">제품 정보</a>
                        </li>
                        <li><a href="#nino-services">본사 소개</a></li>
                        <li><a href="#nino-map">오시는 길</a></li>
                     </ul>
                  </div><!-- /.navbar-collapse -->
                  <ul class="nino-iconsGroup nav navbar-nav">
                     <li><a href="#"><i class="mdi mdi-cart-outline nino-icon"></i></a></li>
                  </ul>
               </div>
            </div><!-- /.container-fluid -->
               <div id="head_dept02" class="head_dept02">
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

         <section id="nino-slider" class="carousel slide container" data-ride="carousel">
            
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
               <div class="item active">
                  <h2 class="nino-sectionHeading">
                     <span class="nino-subHeading"></span>
                     MEIRI
                  </h2>
                  <a href="#" class="nino-btn">Learn more</a>
               </div>
               <div class="item">
                  <h2 class="nino-sectionHeading">
                     <span class="nino-subHeading"></span>
                     MEIRI
                  </h2>
                  <a href="#" class="nino-btn">Learn more</a>
               </div>
               <div class="item">
                  <h2 class="nino-sectionHeading">
                     <span class="nino-subHeading"></span>
                     MEIRI
                  </h2>
                  <a href="#" class="nino-btn">Learn more</a>
               </div>
               <div class="item">
                  <h2 class="nino-sectionHeading">
                     <span class="nino-subHeading"></span>
                     MEIRI
                  </h2>
                  <a href="#" class="nino-btn">Learn more</a>
               </div>
            </div>

            <!-- Indicators -->
            <ol class="carousel-indicators clearfix">
               <li data-target="#nino-slider" data-slide-to="0" class="active">
                  <div class="inner">
                     <span class="number">01</span> intro   
                  </div>
               </li>
               <li data-target="#nino-slider" data-slide-to="1">
                  <div class="inner">
                     <span class="number">02</span> work
                  </div>
               </li>
               <li data-target="#nino-slider" data-slide-to="2">
                  <div class="inner">
                     <span class="number">03</span> about
                  </div>
               </li>
               <li data-target="#nino-slider" data-slide-to="3">
                  <div class="inner">
                     <span class="number">04</span> contacts
                  </div>
               </li>
            </ol>
         </section>
      </div>
   </header><!--/#header-->
   
    <section id="nino-whatWeDo">
       <div class="container">
          <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">MEIRI</span>
            회사 정보
         </h2>
         <div class="sectionContent">
            <div class="row">
               <div class="col-md-6">
                  <div class="text-center">
                     <img src="resources/images/what-we-do/img-1.jpg" alt="">
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                     <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                           <h4 class="panel-title">
                              <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                 <i class="mdi mdi-chevron-up nino-icon arrow"></i>
                                 <i class="mdi mdi-map-marker nino-icon"></i>
                                 주소
                              </a>
                           </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                           <div class="panel-body">
                              경기도 부천시 삼작로163번길 78 (우)14453
                           </div>
                        </div>
                     </div>
                     <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                           <h4 class="panel-title">
                              <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                 <i class="mdi mdi-chevron-up nino-icon arrow"></i>
                                 <i class="mdi mdi-owl nino-icon"></i> 
                                 전화 번호
                              </a>
                           </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                           <div class="panel-body">
                              032-683-0222
                           </div>
                        </div>
                     </div>
                     <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                           <h4 class="panel-title">
                              <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 <i class="mdi mdi-chevron-up nino-icon arrow"></i>
                                 <i class="mdi mdi-laptop-mac nino-icon"></i> 
                                 이용 시간
                              </a>
                           </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                           <div class="panel-body">
                              평일 9:00 ~ 18:00
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
       </div>
    </section><!--/#nino-whatWeDo-->

   <section id="nino-story" class="nino-testimonial bg-white">   
      <div class="container">
         <h2 class="nino-sectionHeading" style="color:#1f76bc">
            제품 정보
         </h2>
         <hr />
      <div class="slideshow-container">
      <div class="mySlides">
         <div class="productInfo">
           <img src="resources/images/meiri-logo2.png" width=100px height=100px>
               <img src="resources/images/meiri-logo2.png" width=100px height=100px>
               <img src="resources/images/meiri-logo2.png" width=100px height=100px>
              <img src="resources/images/meiri-logo2.png" width=100px height=100px>
              <img src="resources/images/meiri-logo2.png" width=100px height=100px>
          </div>
      </div>

      <div class="mySlides">
           <div class="productInfo">
              <img src="resources/images/meiri-logo2.png" width=100px height=100px>
              <img src="resources/images/meiri-logo2.png" width=100px height=100px>
          </div>
      </div>

      <div class="mySlides">
           <div class="productInfo">
              <img src="resources/images/meiri-logo2.png" width=100px height=100px>
              <img src="resources/images/meiri-logo2.png" width=100px height=100px>
              <img src="resources/images/meiri-logo2.png" width=100px height=100px>
          </div>
      </div>


		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
	</div>
	<br>
		<div style="text-align:center">
  			<span class="dot" onclick="currentSlide(1)"></span> 
 			<span class="dot" onclick="currentSlide(2)"></span> 
  		    <span class="dot" onclick="currentSlide(3)"></span> 
		</div>
	<hr />
	</div>		
	</section><!--/#nino-story-->
	
		<div class="product-heading">
			<div class="product-subheading">
				안녕
			</div>
		</div>
	
	
	
	<section id="nino-story">
		<div class="container">
			<h2 class="nino-sectionHeading">
				LED 거실등
			</h2>
			<% for(Product p : plist){ %>
			<div class="sectionProduct">
				<div class="row nino-hoverEffect">
					<div class="col-md-3 col-sm-3" onclick="location.href='/meiri/views/product/productDetail.jsp';">
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품 1
								</span>
								<img src="resources/images/meiri1.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-3" >
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품 2
								</span>
								<img src="resources/images/meiri2.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품3
								</span>
								<img src="resources/images/meiri3.jpg" alt="">
							</a>
						</div>
					</div>	
					<div class="col-md-3 col-sm-3">
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품 4
								</span>
								<img src="resources/images/meiri4.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
				
				<div class="row nino-hoverEffect">
					<div class="col-md-3 col-sm-3">
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품 5
								</span>
								<img src="resources/images/meiri5.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-3" >
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품 6
								</span>
								<img src="resources/images/meiri6.jpg" alt="">
							</a>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품 7
								</span>
								<img src="resources/images/meiri7.jpg" alt="">
							</a>
						</div>
					</div>	
					<div class="col-md-3 col-sm-3">
						<div class="item product">
							<a class="overlay" href="#">
								<span class="content">
									제품 8
								</span>
								<img src="resources/images/meiri8.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
				
				
				
				
			</div>
		</div>		
	</section><!--/#nino-story-->
	
	
	


   
   
   
   
   
   
   
   
   
   
   
   
    <!-- Services
    ================================================== -->
    <section id="nino-services">
       <div class="container">
          <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">We work with</span>
            Amazing Services
         </h2>
         <div class="sectionContent">         
            <div class="fw" layout="row">
               <div class="col-md-4 col-sm-6 item ">
                  <div layout="row">
                     <i class="mdi mdi-apple-keyboard-command nino-icon fsr"></i>
                     <div>
                        <h4 class="nino-serviceTitle">Photography</h4>
                        <p>Photography is the science, art and practice of creating durable images by recording light or other electromagnetic radiation</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6 item ">
                  <div layout="row">
                     <i class="mdi mdi-blender nino-icon fsr"></i>
                     <div>
                        <h4 class="nino-serviceTitle">Web Design</h4>
                        <p>Web design encompasses many different skills and disciplines in the production and maintenance of websites.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6 item ">
                  <div layout="row">
                     <i class="mdi mdi-bookmark-plus-outline nino-icon fsr"></i>
                     <div>
                        <h4 class="nino-serviceTitle">Creativity</h4>
                        <p>Creativity is a phenomenon whereby something new and somehow valuable is formed. The created item may be intangible or a physical object.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6 item ">
                  <div layout="row">
                     <i class="mdi mdi-buffer nino-icon fsr"></i>
                     <div>
                        <h4 class="nino-serviceTitle">seo</h4>
                        <p>Search engine optimization (SEO) is the process of affecting the visibility of a website or a web page in a web search engine's unpaid results.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6 item ">
                  <div layout="row">
                     <i class="mdi mdi-desktop-mac nino-icon fsr"></i>
                     <div>
                        <h4 class="nino-serviceTitle">Css/Html</h4>
                        <p>HyperText Markup Language, commonly abbreviated as HTML, is the standard markup language used to create web pages. </p>
                     </div>
                  </div>
               </div>
               <div class="col-md-4 col-sm-6 item ">
                  <div layout="row">
                     <i class="mdi mdi-diamond nino-icon fsr"></i>
                     <div>
                        <h4 class="nino-serviceTitle">digital</h4>
                        <p>With digital signals, system noise, provided it is not too great, will not change the quantification whereas with signals handled using analog processing.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
       </div>
    </section><!--/#nino-services-->

    <!-- Unique Design
    ================================================== -->
    <section id="nino-uniqueDesign">
       <div class="container">
          <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">For all devices</span>
            Unique design
         </h2>
         <div class="sectionContent">
            <div class="nino-devices">
               <img class="tablet" src="resources/images/unique-design/img-1.png" alt="">
               <img class="mobile" src="resources/images/unique-design/img-2.png" alt="">
            </div>
         </div>
       </div>
    </section><!--/#nino-uniqueDesign-->

    <!-- What We Do
    ================================================== -->
    <section id="nino-whatWeDo">
       <div class="container">
          <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">Service</span>
            what we do
         </h2>
         <p class="nino-sectionDesc">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
         </p>
         <div class="sectionContent">
            <div class="row">
               <div class="col-md-6">
                  <div class="text-center">
                     <img src="resources/images/what-we-do/img-1.jpg" alt="">
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                     <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                           <h4 class="panel-title">
                              <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                 <i class="mdi mdi-chevron-up nino-icon arrow"></i>
                                 <i class="mdi mdi-camera nino-icon"></i> 
                                 Photography
                              </a>
                           </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                           <div class="panel-body">
                              Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                           </div>
                        </div>
                     </div>
                     <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                           <h4 class="panel-title">
                              <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                 <i class="mdi mdi-chevron-up nino-icon arrow"></i>
                                 <i class="mdi mdi-owl nino-icon"></i> 
                                 creativity
                              </a>
                           </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                           <div class="panel-body">
                              Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                           </div>
                        </div>
                     </div>
                     <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                           <h4 class="panel-title">
                              <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 <i class="mdi mdi-chevron-up nino-icon arrow"></i>
                                 <i class="mdi mdi-laptop-mac nino-icon"></i> 
                                 web design
                              </a>
                           </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                           <div class="panel-body">
                              Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
       </div>
    </section><!--/#nino-whatWeDo-->

    <!-- Testimonial
    ================================================== -->
    <section class="nino-testimonial">
       <div class="container">
          <div class="nino-testimonialSlider">
            <ul>
               <li>
                  <div layout="row">
                     <div class="nino-symbol fsr">
                        <i class="mdi mdi-comment-multiple-outline nino-icon"></i>
                     </div>
                     <div>
                        <p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
                        <span class="name">Jon Doe</span>
                     </div>
                  </div>
               </li>
               <li>
                  <div layout="row">
                     <div class="nino-symbol fsr">
                        <i class="mdi mdi-wechat nino-icon"></i>   
                     </div>
                     <div>
                        <p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
                        <span class="name">Jon Doe</span>
                     </div>
                  </div>
               </li>
               <li>
                  <div layout="row">
                     <div class="nino-symbol fsr">
                        <i class="mdi mdi-message-text-outline nino-icon"></i>
                     </div>
                     <div>
                        <p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
                        <span class="name">Jon Doe</span>
                     </div>
                  </div>
               </li>
            </ul>
         </div>
       </div>
    </section><!--/#nino-testimonial-->

    <!-- Our Team
    ================================================== -->
   <section id="nino-ourTeam">
      <div class="container">
         <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">Who we are</span>
            Meet our team
         </h2>
         <p class="nino-sectionDesc">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
         </p>
         
      </div>
   </section><!--/#nino-ourTeam-->

   <!-- Brand
    ================================================== -->
    <section id="nino-brand">
       <div class="container">
          <div class="verticalCenter fw" layout="row">
             <div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="resources/images/brand/img-1.png" alt=""></a></div>
             <div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="resources/images/brand/img-2.png" alt=""></a></div>
             <div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="resources/images/brand/img-3.png" alt=""></a></div>
             <div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="resources/images/brand/img-4.png" alt=""></a></div>
             <div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="resources/images/brand/img-5.png" alt=""></a></div>
             <div class="col-md-2 col-sm-4 col-xs-6"><a href="#"><img src="resources/images/brand/img-6.png" alt=""></a></div>
          </div>
       </div>
    </section><!--/#nino-brand-->

   <!-- Portfolio
    ================================================== -->
   <section id="nino-portfolio">
      <div class="container">
         <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">What we do</span>
            some of our work
         </h2>
         <p class="nino-sectionDesc">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
         </p>
      </div>
      <div class="sectionContent">
         <ul class="nino-portfolioItems">
            <li class="item">
               <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="images/our-work/img-1.jpg">
                  <img src="resources/images/our-work/img-1.jpg" />
                  <div class="overlay">
                     <div class="content">
                        <i class="mdi mdi-crown nino-icon"></i>
                        <h4 class="title">creatively designed</h4>
                        <span class="desc">Lorem ipsum dolor sit</span>
                     </div>
                  </div>
               </a>
            </li>
            <li class="item">
               <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="images/our-work/img-2.jpg">
                  <img src="resources/images/our-work/img-2.jpg" />
                  <div class="overlay">
                     <div class="content">
                        <i class="mdi mdi-cube-outline nino-icon"></i>
                        <h4 class="title">creatively designed</h4>
                        <span class="desc">Lorem ipsum dolor sit</span>
                     </div>
                  </div>
               </a>
            </li>
            <li class="item">
               <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="images/our-work/img-3.jpg">
                  <img src="resources/images/our-work/img-3.jpg" />
                  <div class="overlay">
                     <div class="content">
                        <i class="mdi mdi-desktop-mac nino-icon"></i>
                        <h4 class="title">creatively designed</h4>
                        <span class="desc">Lorem ipsum dolor sit</span>
                     </div>
                  </div>
               </a>
            </li>
            <li class="item">
               <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="images/our-work/img-4.jpg">
                  <img src="resources/images/our-work/img-4.jpg" />
                  <div class="overlay">
                     <div class="content">
                        <i class="mdi mdi-flower nino-icon"></i>
                        <h4 class="title">creatively designed</h4>
                        <span class="desc">Lorem ipsum dolor sit</span>
                     </div>
                  </div>
               </a>
            </li>
            <li class="item">
               <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="images/our-work/img-5.jpg">
                  <img src="resources/images/our-work/img-5.jpg" />
                  <div class="overlay">
                     <div class="content">
                        <i class="mdi mdi-gamepad-variant nino-icon"></i>
                        <h4 class="title">creatively designed</h4>
                        <span class="desc">Lorem ipsum dolor sit</span>
                     </div>
                  </div>
               </a>
            </li>
            <li class="item">
               <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="images/our-work/img-6.jpg">
                  <img src="resources/images/our-work/img-6.jpg" />
                  <div class="overlay">
                     <div class="content">
                        <i class="mdi mdi-gnome nino-icon"></i>
                        <h4 class="title">creatively designed</h4>
                        <span class="desc">Lorem ipsum dolor sit</span>
                     </div>
                  </div>
               </a>
            </li>
            <li class="item">
               <a class="nino-prettyPhoto" rel="prettyPhoto[gallery1]" title="Development Mobile" href="images/our-work/img-7.jpg">
                  <img src="resources/images/our-work/img-7.jpg" />
                  <div class="overlay">
                     <div class="content">
                        <i class="mdi mdi-guitar-electric nino-icon"></i>
                        <h4 class="title">creatively designed</h4>
                        <span class="desc">Lorem ipsum dolor sit</span>
                     </div>
                  </div>
               </a>
            </li>
         </ul>
      </div>
   </section><!--/#nino-portfolio-->

   <!-- Testimonial
    ================================================== -->
    <section class="nino-testimonial bg-white">
       <div class="container">
          <div class="nino-testimonialSlider">
            <ul>
               <li>
                  <div layout="row" class="verticalCenter">
                     <div class="nino-avatar fsr">
                        <img class="img-circle img-thumbnail" src="resources/images/testimonial/img-1.jpg" alt="">
                     </div>
                     <div>
                        <p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
                        <span class="name">Joshua Earle</span>
                     </div>
                  </div>
               </li>
               <li>
                  <div layout="row" class="verticalCenter">
                     <div class="nino-avatar fsr">
                        <img class="img-circle img-thumbnail" src="resources/images/testimonial/img-2.jpg" alt="">
                     </div>
                     <div>
                        <p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
                        <span class="name">Jon Doe</span>
                     </div>
                  </div>
               </li>
               <li>
                  <div layout="row" class="verticalCenter">
                     <div class="nino-avatar fsr">
                        <img class="img-circle img-thumbnail" src="resources/images/testimonial/img-3.jpg" alt="">
                     </div>
                     <div>
                        <p class="quote">"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation."</p>
                        <span class="name">Jon Doe</span>
                     </div>
                  </div>
               </li>
            </ul>
         </div>
       </div>
    </section><!--/#nino-testimonial-->

    <!-- Happy Client
    ================================================== -->
    <section id="nino-happyClient">
       <div class="container">
          <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">Happy Clients</span>
            What people say
         </h2>
         <div class="sectionContent">
            <div class="row">
               <div class="col-md-6">
                  <div layout="row" class="item">
                     <div class="nino-avatar fsr">
                        <img class="img-circle" src="resources/images/happy-client/img-1.jpg" alt="">
                     </div>
                     <div class="info">
                        <h4 class="name">Matthew Dix</h4>
                        <span class="regency">Graphic Design</span>
                        <p class="desc">
                           Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
                        </p>
                     </div>
                  </div>
               </div>
               <div class="col-md-6">
                  <div layout="row" class="item">
                     <div class="nino-avatar fsr">
                        <img class="img-circle" src="resources/images/happy-client/img-2.jpg" alt="">
                     </div>
                     <div class="info">
                        <h4 class="name">Nick Karvounis</h4>
                        <span class="regency">Graphic Design</span>
                        <p class="desc">
                           Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
                        </p>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-6">
                  <div layout="row" class="item">
                     <div class="nino-avatar fsr">
                        <img class="img-circle" src="resources/images/happy-client/img-3.jpg" alt="">
                     </div>
                     <div class="info">
                        <h4 class="name">Jaelynn Castillo</h4>
                        <span class="regency">Graphic Design</span>
                        <p class="desc">
                           Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
                        </p>
                     </div>
                  </div>
               </div>
               <div class="col-md-6">
                  <div layout="row" class="item">
                     <div class="nino-avatar fsr">
                        <img class="img-circle" src="resources/images/happy-client/img-4.jpg" alt="">
                     </div>
                     <div class="info">
                        <h4 class="name">Mike Petrucci</h4>
                        <span class="regency">Graphic Design</span>
                        <p class="desc">
                           Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo illo cupiditate temporibus sapiente, sint, voluptatibus tempora esse. Consectetur voluptate nihil quo nulla voluptatem dolorem harum nostrum
                        </p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
       </div>
    </section><!--/#nino-happyClient-->

    <!-- Latest Blog
    ================================================== -->
    <section id="nino-latestBlog">
       <div class="container">
          <h2 class="nino-sectionHeading">
            <span class="nino-subHeading">Our stories</span>
            Latest Blog
         </h2>
         <div class="sectionContent">
            <div class="row">
               <div class="col-md-4 col-sm-4">
                  <article>
                     <div class="articleThumb">
                        <a href="#"><img src="resources/images/our-blog/img-1.jpg" alt=""></a>
                        <div class="date">
                           <span class="number">15</span>
                           <span class="text">Jan</span>
                        </div>
                     </div>
                     <h3 class="articleTitle"><a href="">Lorem ipsum dolor sit amet</a></h3>
                     <p class="articleDesc">
                        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     </p>
                     <div class="articleMeta">
                        <a href="#"><i class="mdi mdi-eye nino-icon"></i> 543</a>
                        <a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 15</a>
                     </div>
                  </article>
               </div>
               <div class="col-md-4 col-sm-4">
                  <article>
                     <div class="articleThumb">
                        <a href="#"><img src="resources/images/our-blog/img-2.jpg" alt=""></a>
                        <div class="date">
                           <span class="number">14</span>
                           <span class="text">Jan</span>
                        </div>
                     </div>
                     <h3 class="articleTitle"><a href="">sed do eiusmod tempor</a></h3>
                     <p class="articleDesc">
                        Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     </p>
                     <div class="articleMeta">
                        <a href="#"><i class="mdi mdi-eye nino-icon"></i> 995</a>
                        <a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 42</a>
                     </div>
                  </article>
               </div>
               <div class="col-md-4 col-sm-4">
                  <article>
                     <div class="articleThumb">
                        <a href="#"><img src="resources/images/our-blog/img-3.jpg" alt=""></a>
                        <div class="date">
                           <span class="number">12</span>
                           <span class="text">Jan</span>
                        </div>
                     </div>
                     <h3 class="articleTitle"><a href="">incididunt ut labore et dolore</a></h3>
                     <p class="articleDesc">
                        Elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                     </p>
                     <div class="articleMeta">
                        <a href="#"><i class="mdi mdi-eye nino-icon"></i> 1264</a>
                        <a href="#"><i class="mdi mdi-comment-multiple-outline nino-icon"></i> 69</a>
                     </div>
                  </article>
               </div>
            </div>
         </div>
       </div>
    </section><!--/#nino-latestBlog-->

    <!-- Map
    ================================================== -->
    <section id="nino-map">
       <div class="container">
          <h2 class="nino-sectionHeading">
             <i class="mdi mdi-map-marker nino-icon"></i>
             <span class="text">Open map</span>
             <span class="text" style="display: none;">Close map</span>
          </h2>
          <div class="mapWrap">
             <iframe src="https://www.google.com/maps/embed?pb=!1m23!1m12!1m3!1d79466.26604960626!2d-0.19779784176715043!3d51.50733004537892!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m8!3e6!4m0!4m5!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon%2C+UK!3m2!1d51.5073509!2d-0.1277583!5e0!3m2!1sen!2s!4v1469206441744" width="800" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>
          </div>
       </div>
    </section><!--/#nino-map-->
   
    <!-- Footer
    ================================================== -->
    <footer id="footer">
        <div class="container">
           <div class="row">
              <div class="col-md-4">
                 <div class="colInfo">
                    <div class="footerLogo">
                       <a href="#" >MoGo</a>   
                    </div>
                    <p>
                       Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </p>
                    <div class="nino-followUs">
                       <div class="totalFollow"><span>15k</span> followers</div>
                       <div class="socialNetwork">
                          <span class="text">Follow Us: </span>
                          <a href="" class="nino-icon"><i class="mdi mdi-facebook"></i></a>
                          <a href="" class="nino-icon"><i class="mdi mdi-twitter"></i></a>
                          <a href="" class="nino-icon"><i class="mdi mdi-instagram"></i></a>
                          <a href="" class="nino-icon"><i class="mdi mdi-pinterest"></i></a>
                          <a href="" class="nino-icon"><i class="mdi mdi-google-plus"></i></a>
                          <a href="" class="nino-icon"><i class="mdi mdi-youtube-play"></i></a>
                          <a href="" class="nino-icon"><i class="mdi mdi-dribbble"></i></a>
                          <a href="" class="nino-icon"><i class="mdi mdi-tumblr"></i></a>
                       </div>
                    </div>
                    <form action="" class="nino-subscribeForm">
                       <div class="input-group input-group-lg">
                        <input type="email" class="form-control" placeholder="Your Email" required>
                        <span class="input-group-btn">
                           <button class="btn btn-success" type="submit">Subscribe</button>
                        </span>
                     </div>
                    </form>
                 </div>
              </div>
              <div class="col-md-4 col-sm-6">
                 <div class="colInfo">
                    <h3 class="nino-colHeading">Blogs</h3>
                    <ul class="listArticles">
                       <li layout="row" class="verticalCenter">
                          <a class="articleThumb fsr" href="#"><img src="resources/images/our-blog/img-4.jpg" alt=""></a>
                          <div class="info">
                             <h3 class="articleTitle"><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing</a></h3>
                             <div class="date">Jan 9, 2016</div>
                          </div>
                       </li>
                       <li layout="row" class="verticalCenter">
                          <a class="articleThumb fsr" href="#"><img src="resources/images/our-blog/img-5.jpg" alt=""></a>
                          <div class="info">
                             <h3 class="articleTitle"><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing</a></h3>
                             <div class="date">Jan 9, 2016</div>
                          </div>
                       </li>
                       <li layout="row" class="verticalCenter">
                          <a class="articleThumb fsr" href="#"><img src="resources/images/our-blog/img-6.jpg" alt=""></a>
                          <div class="info">
                             <h3 class="articleTitle"><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing</a></h3>
                             <div class="date">Jan 9, 2016</div>
                          </div>
                       </li>
                    </ul>
                 </div>
              </div>
              <div class="col-md-4 col-sm-6">
                 <div class="colInfo">
                    <h3 class="nino-colHeading">instagram</h3>
                    <div class="instagramImages clearfix">
                       <a href="#"><img src="resources/images/instagram/img-1.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-2.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-3.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-4.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-5.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-6.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-7.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-8.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-9.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-3.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-4.jpg" alt=""></a>
                       <a href="#"><img src="resources/images/instagram/img-5.jpg" alt=""></a>
                    </div>
                    <a href="#" class="morePhoto">View more photos</a>
                 </div>
              </div>
           </div>
         <div class="nino-copyright">Copyright &copy; 2016 <a target="_blank" href="http://www.ninodezign.com/" title="Ninodezign.com - Top quality open source resources for web developer and web designer">Ninodezign.com</a>. All Rights Reserved. <br/> MoGo free PSD template by <a href="https://www.behance.net/laaqiq">Laaqiq</a></div>
        </div>
    </footer><!--/#footer-->

    <!-- Search Form - Display when click magnify icon in menu
    ================================================== -->
    <form action="" id="nino-searchForm">
       <input type="text" placeholder="Search..." class="form-control nino-searchInput">
       <i class="mdi mdi-close nino-close"></i>
    </form><!--/#nino-searchForm-->
   
    <!-- Scroll to top
    ================================================== -->
   <a href="#" id="nino-scrollToTop">Go to Top</a>
   
   <!-- javascript -->
   <script type="text/javascript" src="resources/js/jquery.min.js"></script>   
   <script type="text/javascript" src="resources/js/isotope.pkgd.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery.prettyPhoto.js"></script>
   <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="resources/js/jquery.hoverdir.js"></script>
   <script type="text/javascript" src="resources/js/modernizr.custom.97074.js"></script>
   <script type="text/javascript" src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
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