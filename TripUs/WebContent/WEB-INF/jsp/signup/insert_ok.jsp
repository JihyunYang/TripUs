<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mail.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, initial-scale=1, shrink-to-fit=no">
	
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	<title>TripUs</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<link href="/img/tripFavicons.png" rel="icon">
	
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
	
	<link rel="stylesheet" type="text/css" href="https://korean.visitkorea.or.kr/resources/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="https://korean.visitkorea.or.kr/resources/css/common.css?v=20190905002" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<style>
	    .header1{
	        font-size:2em;      
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
	    
	</style>

</head>
<body>
	<!--Start Hedaer Section-->
	<section id="header">
		<div class="header-area">
			<div class="top_header">
				
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
						<a class="navbar-brand custom_navbar-brand" href="/login/goIndex.do"><img
							src="/img/trip.png" alt=""></a>
					</div>
					<!--End of navbar-header-->


					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse zero_mp navHeaderCollapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right main_menu">
							<li><a href="/notice/ntBoardList.nt">????????????</a></li>
							<li><a href="/tour.jsp">?????????</a></li>
							<li class="dropdown">
								<a href="/cource.html" class="dropdown-toggle" data-toggle="dropdown">??????
								<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/course.html">?????? ??????</a></li>
									<li><a href="/myCourse/goDIY.do">DIY ??????</a></li>
									<li><a href="/myCourse/goMyCourseMain.do">?????????</a></li>
								</ul>
							</li>
							<li><a href="/restaurant/restaurantMain.do">??????</a></li>
							<li><a href="/festival.html">??????</a></li>
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
	<!--End of Hedaer Section-->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<table class="table"style="margin-left:400px; width:55%;">
	<thead><th>
		<div class="header1">???????????? ??????</div><br>
		
	</th></thead>
	<tbody><tr><td><br><br>
		<div id="idFind" style="margin-bottom:100px;margin-left:300px; width:40%;">
		<form name="idFindForm" method="POST">
		<input type="hidden" id="results" name="results"/>
		
			<div class="form-group" style="align:center">
			<h2 style="font-family: ????????????; font-size:25px;margin-top: 40px;">TripUs??? ???????????????  ???????????????!</h2>
			
          		</div>
			
			<br>
			<center style="margin-top:30px;">
				<a href="/login/loginPage.do" role="button">
				<input type="button" class="btn btn-secondary btn-sm" value="???????????????"/>
				</a>
			</center>
		</form>
		</div>
	</td></tr></tbody></table>
	<div id="result"></div>	
	
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
							A Design By <a href="#">??????</a>
						</p>
					</div>
				</div>
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</section>
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