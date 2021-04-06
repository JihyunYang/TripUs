<%--
파일명 : restaurant.jsp
설명 : 맛집 메인페이지
작성일 : 2019.9.1
작성자 : LHJ
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

    <%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs =null; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TripUs 홈페이지입니다 ^^</title>
<link href="/img/tripFavicons.png" rel="icon">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!--Animated CSS-->
<link rel="stylesheet" type="text/css" href="/css/animate.min.css">

<!-- Bootstrap -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!--Bootstrap Carousel-->
<link type="text/css" rel="stylesheet" href="/css/carousel.css" />

<link rel="stylesheet" href="/css/isotope/style.css">

<!--Main Stylesheet-->
<link href="/css/style.css" rel="stylesheet">
<!--Responsive Framework-->
<link href="/css/responsive.css" rel="stylesheet">


<link rel="stylesheet" type="text/css"
	href="https://korean.visitkorea.or.kr/resources/css/swiper.min.css">
<link rel="stylesheet" type="text/css"
	href="https://korean.visitkorea.or.kr/resources/css/common.css?v=20190905002" />
<link rel="stylesheet" type="text/css"
	href="/css/common.css" />


<link rel="stylesheet" type="text/css"
	href="https://korean.visitkorea.or.kr/resources/css/swiper.min.css">
<link rel="stylesheet" type="text/css"
	href="https://korean.visitkorea.or.kr/resources/css/common.css?v=20190905002" />
<link rel="stylesheet" type="text/css"
	href="/css/common.css" />

<!-- bootstrap 3.4.0 -->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


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

<script type="text/javascript">
		function delete1(){
			location.href="/login/goDeleteNotice.do";
		}
</script>
<style type="text/css">
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
								<li>
									<a href="/notice/ntBoardList.nt">공지사항　</a>
								</li>
									
								<li>
									<a href="/toBoard/toBoardList.to">여행지　</a>
								</li>
										
								<li>
									<a href="/fsBoard/goFestivalMain.do">축제　</a>
								</li>
									
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">코스
										<span class="caret">　</span>
									</a>
										
									<ul class="dropdown-menu">
										<li>
											<a href="/coBoard/coRecommendMainBoard.do">추천 코스</a>
										</li>
												
										<li>
											<a href="/myCourse/goDIY.do">DIY 코스</a>
										</li>
											
										<li>
											<a href="/myCourse/goMyCourseMain.do">내 코스</a>
										</li>
									</ul>
								</li>
									
								<li>
									<a href="/restaurant/restaurantMain.do">　맛집</a>
								</li>
										
								<li>
									<a href="/contact.html">　contact us</a>
								</li>
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
        <!--End of Header Section-->



<div class="container">

		<div id="tag" style="margin-top:30px;margin-left:10px">
			<h3 class="text-info">인기태그</h3>
			<a href="#">#삼계탕&nbsp&nbsp</a> <a href="#">#라멘&nbsp&nbsp</a> <a href="#">#마라탕&nbsp&nbsp</a>
		</div>

		<h2> 지역별 맛집</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>


    <!-- Wrapper for slides -->
    <div class="carousel-inner">
	
      <div class="item active" >
      <a href="/restaurant/resAreaSub.do?areaCode=31">
        <img src="/resources/img/경기도맛집.jpg"  alt="이미지 1" style=" height:420px; width:100%;">
        </a>
        <div class="carousel-caption">
          <h3 >경기도</h3>
          <p>경기도의 다양한 음식점들~!</p>
        </div>
      </div>

      <div class="item">
          <a href="/restaurant/resAreaSub.do?areaCode=1">
            <img src="/resources/img/서울맛집.jpg" alt="이미지 2" style="height:420px; width:100%;">
          </a>
          <div class="carousel-caption">
          <h3>서울</h3>
          <p>서울의 전통적인 음식점들</p>
        </div>
      </div>
    
      <div class="item">
        <a href="/restaurant/resAreaSub.do?areaCode=2">
          <img src="/resources/img/인천맛집.jpg" alt="이미지 3" style="height:420px; width:100%;">
        </a>
            <div class="carousel-caption">
          <h3>인천</h3>
          <p>해안도시 인천의 수산물 음식점들</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

<br>
<br>
<br>
<br>


<h2> 맛집 요리 분류</h2>
  <div id="myCarousel2" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
      <li data-target="#myCarousel2" data-slide-to="3"></li>
    </ol>


    <!-- Wrapper for slides -->
    <div class="carousel-inner">
	
      <div class="item active" >
      	<a href="/restaurant/resCatSub.do?foodCat=A05020100">
        <img src="/resources/img/한식.gif"  alt="한식" style="height:420px; width:100%;">
        </a>
        <div class="carousel-caption">
          <h3>한식</h3>
          <p>한국의 전통적인 음식들~!</p>
        </div>
      </div>

      <div class="item">
       <a href="/restaurant/resCatSub.do?foodCat=A05020300">
        <img src="/resources/img/일식.jpg" alt="일식" style="height:420px; width:100%;">
        </a>
        <div class="carousel-caption">
          <h3>일식</h3>
          <p>싱싱한 스시와 깊이있는 전통음식들 </p>
        </div>
      </div>
    
      <div class="item">
      <a href="/restaurant/resCatSub.do?foodCat=A05020200">
        <img src="/resources/img/서양식.jpg" alt="서양식" style="height:420px; width:100%;">
       </a>
        <div class="carousel-caption">
          <h3>서양식</h3>
          <p>서양의 고급스러운 맛</p>
        </div>
      </div>
      
      <div class="item">
        <a href="/restaurant/resCatSub.do?foodCat=A05020400">
        <img src="/resources/img/중식.jpg" alt="중식" style="height:420px; width:100%;">
        </a>
        <div class="carousel-caption">
          <h3>중식</h3>
          <p>중국의 풍미를 느낄 수 있는 음식들</p>
        </div>
      </div>
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel2" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel2" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
    </div>

<br>
<br>
		<div id="blank" style="margin-bottom:100px"></div>

</div>
	
	
	
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