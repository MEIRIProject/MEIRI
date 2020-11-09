<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>관리자 페이지</title>
   <link rel="stylesheet" href="../../resources/css/all.min.css"><!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/css/templatemo-xtra-blog.css">
    
    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/templatemo-script.js"></script>
   <script>
      function notice(){
         location.href='/meiri/noticeList.no';
      }
      
      function product(){
         location.href='/meiri/productList.pr';
      }
      
      function member(){
         location.href='/meiri/memberList.me';
      }
      
      function review(){
         location.href='/meiri/reviewList.re';
      }
      
      function inquiry(){
         location.href='/meiri/inquiryList.in';
      }
      
      function question(){
         location.href='/meiri/questionList.qu';
      }
      
   </script>
   
   
   
</head>
<body>
   <header class="tm-header" id="tm-header">
        <div class="tm-header-wrapper">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2x"></i></div>            
                <h1 class="text-center">관리자</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">            
                <ul>
                   <!-- a 태그를 button 으로 바꿈 -->
                   <!-- 첫 li태그 class에 active 지움 -->
                    <li class="tm-nav-item"><button onclick="notice()" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        공지사항
                    </button></li>
                    <li class="tm-nav-item"><button onclick="product()" class="tm-nav-link">
                        <i class="fas fa-pen"></i>
                        제품 관리
                    </button></li>
                    <li class="tm-nav-item"><button onclick="member()" class="tm-nav-link">
                        <i class="fas fa-users"></i>
                        회원 관리
                    </button></li>
                    <li class="tm-nav-item"><button onclick="review()" class="tm-nav-link">
                        <i class="far fa-comments"></i>
                        리뷰 관리
                    </button></li>
                    <li class="tm-nav-item"><button onclick="inquiry()" class="tm-nav-link">
                        <i class="far fa-comments"></i>
                        1:1상담
                    </button></li>
                    <li class="tm-nav-item"><button onclick="question()" class="tm-nav-link">
                        <i class="far fa-comments"></i>
                        자주 묻는 질문
                    </button></li>
                </ul>
            </nav>
            
        </div>
    </header>
    
    
    <div class="container-fluid">
        <main class="tm-main">
            <!-- Search form --> 
            <div class="row tm-row">
                <div class="col-12">
                    <form method="GET" class="form-inline tm-mb-80 tm-search-form">                
                        <input class="form-control tm-search-input" name="query" type="text" placeholder="Search..." aria-label="Search">
                        <button class="tm-search-button" type="submit">
                            <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                        </button>                                
                    </form>
                </div>                
            </div>     
            <div class="row tm-row">
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">
                    <a href="post.html" class="effect-lily tm-post-link tm-pt-60">
                        <div class="tm-post-link-inner">
                            <img src="../../resources/images/img/img-01.jpg" alt="Image" class="img-fluid">                            
                        </div>
                        <span class="position-absolute tm-new-badge">New</span>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">Simple and useful HTML layout</h2>
                    </a>                    
                    <p class="tm-pt-30">
                        There is a clickable image with beautiful hover effect and active title link for each post item. 
                        Left side is a sticky menu bar. Right side is a blog content that will scroll up and down.
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">Travel . Events</span>
                        <span class="tm-color-primary">June 24, 2020</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span>36 comments</span>
                        <span>by Admin Nat</span>
                    </div>
                </article>
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">
                    <a href="post.html" class="effect-lily tm-post-link tm-pt-60">
                        <div class=" tm-post-link-inner">
                            <img src="../../resources/images/img/img-02.jpg" alt="Image" class="img-fluid">                            
                        </div>
                        <span class="position-absolute tm-new-badge">New</span>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">Multi-purpose blog template</h2>
                    </a>                    
                    <p class="tm-pt-30">
                        <a rel="nofollow" href="https://templatemo.com/tm-553-xtra-blog" target="_blank">Xtra Blog</a>  is a multi-purpose HTML CSS template from TemplateMo website. 
                        Blog list, single post, about, contact pages are included. Left sidebar fixed width and content area is a fluid full-width.
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">Creative . Design . Business</span>
                        <span class="tm-color-primary">June 16, 2020</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span>48 comments</span>
                        <span>by Admin Sam</span>
                    </div>
                </article>
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">
                    <a href="post.html" class="effect-lily tm-post-link tm-pt-20">
                        <div class="tm-post-link-inner">
                            <img src="../../resources/images/img/img-03.jpg" alt="Image" class="img-fluid">
                        </div>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">How can you apply Xtra Blog</h2>
                    </a>                    
                    <p class="tm-pt-30">
                        You are <u>allowed</u> to convert this template as any kind of CMS theme or template for your custom website builder. 
                        You can also use this for your clients. Thank you for choosing us.
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">Music . Audio</span>
                        <span class="tm-color-primary">June 11, 2020</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span>24 comments</span>
                        <span>by John Walker</span>
                    </div>
                </article>
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">
                    <a href="post.html" class="effect-lily tm-post-link tm-pt-20">
                        <div class="tm-post-link-inner">
                            <img src="../../resources/images/img/img-04.jpg" alt="Image" class="img-fluid">
                        </div>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">A little restriction to apply</h2>
                    </a>                    
                    <p class="tm-pt-30">
                        You are <u>not allowed</u> to re-distribute this template as a downloadable ZIP file on any template collection
                        website. This is strongly prohibited as we worked hard for this template. Please contact TemplateMo for more information.
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">Artworks . Design</span>
                        <span class="tm-color-primary">June 4, 2020</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span>72 comments</span>
                        <span>by Admin Sam</span>
                    </div>
                </article>
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">
                    <a href="post.html" class="effect-lily tm-post-link tm-pt-20">
                        <div class="tm-post-link-inner">
                            <img src="../../resources/images/img/img-05.jpg" alt="Image" class="img-fluid">
                        </div>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">Color hexa values of Xtra Blog</h2>
                    </a>                    
                    <p class="tm-pt-30">
                        If you wish to kindly support us, please contact us or contribute a small PayPal amount to info [at] templatemo.com that is helpful for us.
                        <br>
                        Title #099 New #0CC <br>
                        <span class="tm-color-primary">Text #999 Line #CCC Next #0CC Prev #F0F0F0</span>
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">Creative . Video . Audio</span>
                        <span class="tm-color-primary">May 31, 2020</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span>84 comments</span>
                        <span>by Admin Sam</span>
                    </div>
                </article>
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">
                    <a href="post.html" class="effect-lily tm-post-link tm-pt-20">
                        <div class="tm-post-link-inner">
                            <img src="../../resources/images/img/img-06.jpg" alt="Image" class="img-fluid">
                        </div>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">Donec convallis varius risus</h2>
                    </a>                    
                    <p class="tm-pt-30">
                        Quisque id ipsum vel sem maximus vulputate sed quis velit. Nunc vel turpis eget orci elementum cursus vitae in eros. Quisque vulputate nulla ut dolor consectetur luctus.
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">Visual . Artworks</span>
                        <span class="tm-color-primary">June 16, 2020</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span>96 comments</span>
                        <span>by Admin Sam</span>
                    </div>
                </article>
            </div>
            <div class="row tm-row tm-mt-100 tm-mb-75">
                <div class="tm-prev-next-wrapper">
                    <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
                    <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
                </div>
                <div class="tm-paging-wrapper">
                    <span class="d-inline-block mr-3">Page</span>
                    <nav class="tm-paging-nav d-inline-block">
                        <ul>
                            <li class="tm-paging-item active">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">1</a>
                            </li>
                            <li class="tm-paging-item">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">2</a>
                            </li>
                            <li class="tm-paging-item">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">3</a>
                            </li>
                            <li class="tm-paging-item">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">4</a>
                            </li>
                        </ul>
                    </nav>
                </div>                
            </div>            
            <footer class="row tm-row">
                <hr class="col-12">
                <div class="col-md-6 col-12 tm-color-gray">
                    Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
                </div>
                <div class="col-md-6 col-12 tm-color-gray tm-copyright">
                    Copyright 2020 Xtra Blog Company Co. Ltd.
                </div>
            </footer>
        </main>
    </div>
      

</body>
</html>