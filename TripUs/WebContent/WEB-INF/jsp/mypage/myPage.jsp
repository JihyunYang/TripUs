<%--
파일명 : myPage.jsp
설명 : 자신의 정보등을 관리할 수 있는 페이지
작성일 : 2019.9.1
작성자 : LHJ
 --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%! String mno=""; %>
    <%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs =null; %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>tripUs</title>

	

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Small Business - Start Bootstrap Template</title>

 <!--Animated CSS-->
        <link rel="stylesheet" type="text/css" href="/resources/css/animate.min.css">

        <!-- Bootstrap -->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Bootstrap Carousel-->
        <link type="text/css" rel="stylesheet" href="/resources/css/carousel.css" />

        <link rel="stylesheet" href="/resources/css/isotope/style.css">

        <!--Main Stylesheet-->
        <link href="/resources/css/style.css" rel="stylesheet">
        <!--Responsive Framework-->
        <link href="/resources/css/responsive.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
 

<!--Scroll to top-->
	<!--End of Scroll to top-->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="/resources/js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<script src="/resources/js/waypoints.min.js"></script>
	<!--Counter UP-->
	<script src="/resources/js/jquery.counterup.min.js"></script>
	<!--Google Maps API-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjxvF9oTfcziZWw--3phPVx1ztAsyhXL4"></script>


	<!--Isotope-->
	<script src="/resources/js/isotope/min/scripts-min.js"></script>
	<script src="/resources/js/isotope/cells-by-row.js"></script>
	<script src="/resources/js/isotope/isotope.pkgd.min.js"></script>
	<script src="/resources/js/isotope/packery-mode.pkgd.min.js"></script>
	<script src="/resources/js/isotope/scripts.js"></script>


	<!--Back To Top-->
	<script src="/resources/js/backtotop.js"></script>


	<!--JQuery Click to Scroll down with Menu-->
	<script src="/resources/js/jquery.localScroll.min.js"></script>
	<script src="/resources/js/jquery.scrollTo.min.js"></script>
	<!--WOW With Animation-->
	<script src="/resources/js/wow.min.js"></script>
	<!--WOW Activated-->
	<script>
		new WOW().init();
	</script>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- Custom JavaScript-->
	<script src="/resources/js/main.js"></script>

<!-- bootstrap 3.4.0 -->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

 <link href="/resources/css/small-business.css" rel="stylesheet">

 
 
 
	<style type="text/css">
	
	@font-face {
	font-family: 'Handon3gyeopsal300g';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
	}
	
	@font-face {
		font-family: 'Handon3gyeopsal600g';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	p{
	font-family: 'Handon3gyeopsal300g';
	}
	
	h4{
		font-family: 'Handon3gyeopsal600g';
	}
	
		
	
	p.member{
	
	padding: 0px 15px
	
	}
	
	.card-footer{
	
	padding: 8px 20px;
	
	}
	
	.card-body{
	padding: 12.5px 12.5px 100px 12.5px;
	}
	
	.navbar-default {
   		 background-color: #ffff;
	}
	.navbar-default:visited {
	    background-color: #ffff;
	}
	ul.dropdown-menu {
	    background-color: #ffff;
	    text-align: center;
	}
	ul.dropdown-menu:hover {
	    background-color: #ffff;
	}
	.footer{
		background: #eef8ff;
		padding:2%;
	}

	</style>
		
	
	</head>
	<body>	
	
		<!--Start Hedaer Section-->
	<section id="header">
		<div class="header-area">
			<div class="top_header">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="social_icon text-right">
							<%
								hs = request.getSession(true);
								mid =(String)hs.getAttribute("mid");
								mname = (String)hs.getAttribute("mname");
								memail = (String)hs.getAttribute("memail");
								mgrade = (String)hs.getAttribute("mgrade");
								if(mid==null){
							%>
								<a class="signup" href="/login/loginPage.do" role="button">
								<button type="button" class="btn btn-default btn-sm">
									로그인</button>
								</a>
								<a class="signup" href="/signup/insertForm.do" role="button">
									<button type="button" class="btn btn-default btn-sm">
										회원가입
									</button>
								</a>	
							
							
								<ul class="nav navbar-nav">
								</ul>
							<% 
								}else{ 
									if(mgrade.equals("1")){
							%>
								<a class="signup" href="/admin.jsp" role="button">
								<button type="button" class="btn btn-default btn-sm">
									관리자페이지
								</button>
								</a>	
							<%
									}
							%>
							<script>
							$(document).ready(function(){
								$("#name").html("<%=mname%>");
								$("#email").html("<%=memail%>");
							});
							</script>
								<ul class="nav navbar-nav navbar-right">
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"> <span
											class="glyphicon glyphicon-user"></span>  <span
											class="glyphicon glyphicon-chevron-down"></span>
									</a>
										<ul class="dropdown-menu">
											<li>
												<div class="navbar-login">
													<div class="row">
														<div class="col-lg-8">
															<p class="text-center">
																<span class="glyphicon glyphicon-user icon-size"></span>
															</p>
														</div>
														<div class="col-lg-8">
															<p class="text-left">
																<strong> <span id="name"></span>님</strong>
															</p>
															<p class="text-left small"><span id="email"></span></p>
															<li class="divider"></li>

															<p class="text-left">
																<a href="/mypage/myPage.do" class="btn btn-default btn-sm"> My page</a>
																<a href="/login/logout.do" class="btn btn-default btn-sm"> logout</a>
															</p>
														</div>
													</div>
												</div>
											</li>

										</ul></li>
								</ul>
							<% } %>
							</div>
						</div>
						<!--End of col-md-4-->
					</div>
					<!--End of row-->
				</div>
			</div>
			<!--End of top header-->
			<div class="header_menu text-center" data-spy="affix"
				data-offset-top="50" id="nav">
				<div class="container">
					<nav class="navbar navbar-default zero_mp ">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand custom_navbar-brand" href="/main.jsp"><img
								src="/img/trip.png" alt=""></a>
						</div>
						<!--End of navbar-header-->


						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp navHeaderCollapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right main_menu">
								<li><a href="/notice/ntBoardList.nt">공지사항</a></li>
								<li><a href="/tour.jsp">여행지</a></li>
								<li class="dropdown">
									<a href="/cource.html" class="dropdown-toggle" data-toggle="dropdown">코스
									<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="/course.html">추천 코스</a></li>
										<li><a href="/myCourse/goDIY.do">DIY 코스</a></li>
										<li><a href="/myCourse/goMyCourseMain.do">내코스</a></li>
									</ul>
								</li>
								<li><a href="/restaurant/restaurantMain.do">맛집</a></li>
								<li><a href="/festival.html">축제</a></li>
								<li><a href="/contact.html">contact us</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</nav>
					<!--End of nav-->
				</div>
				<!--End of container-->
			</div>
			<!--End of header menu-->
		</div>
		<!--end of header area-->
	</section>
	
	
	<h1 align="center" style="font-size:40px; margin:40px"> MY PAGE</h1>


	<hr>
	
  <!-- Page Content -->
  <div class="container">


    <!-- Heading Row -->
    <div class="row align-items-center my-5">
    
    <!-- 왼쪽 공백 -->
    <div class="col-lg-1">
	</div>
      <div class="col-lg-5" align="center" style="margin-top: 120px;">
      <p class="btn btn-info">My Profile </p>
      <br><br>
        <img class="img-fluid rounded mb-4 mb-lg-0" src="${mprofile}" width="200px" height="200px" alt="">
      </div>
      
      <p style="font-size: 29px; text-align: center; padding-right: 11%; margin-bottom: -2%;"><b>User Info</b><p>
      <!-- /.col-lg-8 -->
      <div class="col-lg-5" style="padding: 0px 16px">
       
       
        
        <br>
        <br>
        
		<c:forEach items="${mInfo}" var="mem" varStatus="i">

            <div class="panel-group">
	            <div class="panel panel-default" style="padding : 15px 0px 15px 10px;margin-right:3%;">
				 <h4 class="member text-primary" style="margin:0px; font:bold;display: inline;">별 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명 &nbsp;:</h4>
	            	<p class="data" align="center" style="padding-left:50px;display: inline;">&nbsp; &nbsp;${mem.mnick}</p>	           
	            
				</div>
			</div>
			
			<div class="panel-group">
	            <div class="panel panel-default" style="padding : 15px 0px 15px 10px;margin-right:3%;">
		          <h4 class="member text-primary" style="margin:0px; font:bold;display: inline;">전화번호 &nbsp;:</h4>
		          <p class="data"align="center" style="padding-left:50px;display: inline;"> &nbsp;${mem.mhp}</p>
             
	            
				</div>
			</div>
			
			<div class="panel-group">
	            <div class="panel panel-default" style="padding : 15px 0px 15px 10px;margin-right:3%;">
	        		<h4 class="member text-primary" style="margin:0px; font:bold;display: inline;">가 &nbsp;입 &nbsp;일 &nbsp;: </h4>
	        		<p class="data" align="center" style="padding-left:50px;display: inline;">${mem.minsertdate}</p> 
			   
	            
				</div>
			</div>
					
			
			</c:forEach>
		
        </div>
      <!-- /.col-md-4 -->
    </div>
    <!-- /.row -->

    <!-- 이 기능은 보류중 --><!--
    <div class="card text-white bg-secondary my-5 py-4 text-center">
      <div class="card-body">
        <p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p>
      </div>
    </div>
     -->

	<br>
	<br>

    <!-- Content Row -->
    
    <div class="row" style="padding: 0px 10%">
      <div class="col-md-6 mb-6">
        <div class="panel panel-default h-100">
          <div class="panel-body" style="width: 300px; height: 120px">
            <h2 class="panel-title" style="font-size: 25px;font:bold;">가입정보 수정</h2>
            
            <br>
            <p class="panel-text"> 내 정보 수정이 필요하면 눌러주세요.</p>
            
          </div>
          <div class="footer" align="right">
            <a href="/mypage/infoupdate.do" class="btn btn-default">수정</a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      <div class="col-md-6 mb-6">
        <div class="panel panel-default h-100">
          <div class="panel-body" style="width: 300px; height: 120px">
            <h2 class="panel-title" style="font-size: 25px;font:bold;">즐겨찾기 목록</h2>
            <br>
            <p class="panel-text">사용자가 즐겨찾기한 축제,관광지,맛집을<br> 볼 수 있습니다.</p>
           
          </div>
          <div class="footer" align="right">
            <a href="/mypage/myfavorite.do?mygrade=0" class="btn btn-default">이동</a>
          </div>
        </div>
      </div>
      <!-- /.col-md-4 -->
      

    </div>
    <!-- /.row -->
	<br>
	<br>

    <div class="row" style="padding: 0px 10%">
      <div class="col-md-6 mb-6">
        <div class="panel panel-default h-100">
          <div class="panel-body" style="width: 300px; height: 120px">
            <h2 class="panel-title" style="font-size: 25px;font:bold;">Q&A</h2>
            <br>
            <p class="panel-text">Q&A게시판으로 이동합니다.</p>
          	
          </div>
          <div class="footer" align="right">
            <a href="/qna/qaBoardList.qa" class="btn btn-default">이동</a>
          </div>
        </div>
      </div>
 		
 	   <div class="col-md-6 mb-6">
        <div class="panel panel-default h-100">
          <div class="panel-body" style="width: 300px; height: 120px">
            <h2 class="panel-title" style="font-size: 25px;font:bold;">회원탈퇴</h2>
            <br>
            <p class="panel-text">회원탈퇴를 진행하려면 탈퇴버튼을 누르세요.</p>
          
          </div>
          <div class="footer" align="right" >
            <a href="/login/goDeleteNotice.do" class="btn btn-default">탈퇴</a>
          </div>
        </div>
      </div>    	 
 	 </div>
  </div>
  
  <!-- /.container -->

	<br>
	<br>

  	<!--Start of footer-->
	<section id="footer">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-6">
				<div class="copyright">
					<p>
						@ 2019 - Design By <span><a href="">&#9798;</a></span>
					</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="designer">
					<p>
						A Design By <a href="#">한땀</a>
					</p>
				</div>
			</div>
		</div>
		<!--End of row-->
	</div>
	<!--End of container--> </section>
	<!--End of footer-->



	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>-->
	<script src="/js/jquery-1.12.3.min.js"></script>

	<!--Counter UP Waypoint-->
	<script src="/js/waypoints.min.js"></script>
	<!--Counter UP-->
	<script src="/js/jquery.counterup.min.js"></script>
	<!--Google Maps API-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjxvF9oTfcziZWw--3phPVx1ztAsyhXL4"></script>


	<!--Isotope-->
	<script src="/js/isotope/min/scripts-min.js"></script>
	<script src="/js/isotope/cells-by-row.js"></script>
	<script src="/js/isotope/isotope.pkgd.min.js"></script>
	<script src="/js/isotope/packery-mode.pkgd.min.js"></script>
	<script src="/js/isotope/scripts.js"></script>


	<!--Back To Top-->
	<script src="/js/backtotop.js"></script>


	<!--JQuery Click to Scroll down with Menu-->
	<script src="/js/jquery.localScroll.min.js"></script>
	<script src="/js/jquery.scrollTo.min.js"></script>
	<!--WOW With Animation-->
	<script src="/js/wow.min.js"></script>
	<!--WOW Activated-->
	<script>
		new WOW().init();
	</script>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- Custom JavaScript-->
	<script src="/js/main.js"></script>
	
	</body>
</html>