<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%!String mid = "";%>
<%!String mname = "";%>
<%!String memail = "";%>
<%!String mgrade = "";%>
<%!HttpSession hs = null;%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>TripUs</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
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


<script type="text/javascript">
		function delete1(){
			location.href="/login/goDeleteNotice.do";
		}
	</script>




<style type="text/css">
.container2 {
	width: 870px;
	height: auto;
	margin-left: 50px;
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
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="social_icon text-right">
							<%
								hs = request.getSession(true);
								mid = (String) hs.getAttribute("mid");
								mname = (String) hs.getAttribute("mname");
								memail = (String) hs.getAttribute("memail");
								mgrade = (String) hs.getAttribute("mgrade");
								if (mid == null) {
							%>
							<a class="signup" href="/login/loginPage.do" role="button">
								<button type="button" class="btn btn-default btn-sm">
									로그인</button>
							</a> <a class="signup" href="/signup/insertForm.do" role="button">
								<button type="button" class="btn btn-default btn-sm">
									회원가입</button>
							</a>


							<ul class="nav navbar-nav">
							</ul>
							<%
								} else {
									if (mgrade.equals("1")) {
							%>
							<a class="signup" href="/admin.jsp" role="button">
								<button type="button" class="btn btn-default btn-sm">
									관리자페이지</button>
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
															<strong> <span id="name"></span>님
															</strong>
														</p>
														<p class="text-left small">
															<span id="email"></span>
														</p>
														<li class="divider"></li>

														<p class="text-left">
															<a href="/mypage/myPage.do" class="btn btn-default btn-sm"> My page</a> <a
																href="/login/logout.do" class="btn btn-default btn-sm">
																logout</a>
														</p>
													</div>
												</div>
											</div>
										</li>

									</ul></li>
							</ul>
							<%
								}
							%>
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
				<nav class="navbar navbar-default zero_mp "> <!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand custom_navbar-brand" href="/main.jsp"><img
						src="/img/trip.png" alt=""></a>
				</div>
				<!--End of navbar-header--><div class="w3-container">
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
						</div>
						<!-- /.navbar-collapse -->
					 </nav>
				<!--End of nav-->
			</div>
			<!--End of container-->
		</div>
		<!--End of header menu-->
	</div>
	<!--end of header area--> </section>
	<!--End of Hedaer Section-->





	<br>
	<br>
	<br>
	<div style="float: right; width: 70%;">

		<form method="POST" name="contentForm">
			<c:set var="viewno" value="${viewno}" />
			<input type="hidden" id="contentID" name="contentID" /> <input
				type="hidden" id="viewno" name="viewno" value="${viewno}" />

		</form>
		<div class="container2">
			<div class="List">
				<h2 style="font-size: 40px; font-family: 나눔고딕">축제</h2>
				<hr>
				<h3>마노르블랑 핑크뮬리축제 2019</h3>
				<br>
				<p>주소 : 제주 서귀포시</p>
				<hr>
				<div class="row" id="resInfo">
					<div class="col-md-7">
						<p class="">"대한민국 핑크뮬리 성지!!! 마노르블랑에서 핑크뮬리축제의 향연이 시작된다 " 마노르블랑은
							서귀포시에 위치한 가든 카페이다. 이곳은 작년에 이어 올해에도 핑크뮬리축제를 맞이하고 있다. 축제기간은 9월부터
							11월까지이다. 우리나라 최남단에 위치하고 있으며 핑크뮬리가 우리나라에서 가장 빨리 개화중이다. 9월에는 사랑과
							정성으로 가꾸어진 핑크뮬리와 유럽수국을 오직 마노르블랑에서만 함께 볼 수 있다. 또한 산방산과 송악산 사이로 형제섬과
							사계앞바다가 보이는 환상적인 조망은 마노르블랑에서만 볼 수 있다. 환상적인 조망과 함께 핑크뮬리 인생샷을 남길 수
							있는 다양한 산책로와 포토존이 준비되어 있고 야외 잔디정원에서는 피아노 연주 버스킹을 즐길 수 있다. 이곳
							마노르블랑은 지금 핑크뮬리축제의 향연이 펼쳐지고 있다.</p>
					</div>
					<div class="col-md-5">
						<img class="img-rounded" width="400px" height="400px"
							src="http://tong.visitkorea.or.kr/cms/resource/60/2616560_image2_1.jpg"
							alt="대표이미지">
					</div>
				</div>
			</div>



		</div>


		<!--  댓글  -->
		<div class="container2">
			<label for="content">댓글</label>
			<%-- <form name="commentInsertForm">
				<div class="input-group">
					<input type="hidden" name="bno" value="${detail.bno}" /> <input
						type="text" class="form-control" id="content" name="content"
						placeholder="내용을 입력하세요."> <span class="input-group-btn">
						<button class="btn btn-default" type="button"
							name="commentInsertBtn">등록</button>
					</span>
				</div>
			</form> --%>
		</div>

		<div class="container2">
			<div class="commentList"></div>
			<div align="center" style="margin: 40px">
				<a href="#" class="btn btn-primary" onclick="goback()">뒤로 가기</a>
			</div>
		</div>


		<%-- <%@ include file="/commentS.jsp"%> --%>


	</div>


	<!--지역 카테고리  -->
	<div class="container">
		<div class="row">
			<div class="col-sm-2 col-md-2">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=1">서울</a>
							</h4>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=31"> 경기</a>
							</h4>
						</div>

					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=6"> 부산</a>
							</h4>
						</div>

					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=4"> 대구</a>
							</h4>
						</div>

					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=3">대전</a>
							</h4>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=5">광주</a>
							</h4>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=32">강원</a>
							</h4>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--end of 지역 카테고리  -->



	<br>
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