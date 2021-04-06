<%--
파일명 : myfavorite.jsp
설명 : 즐겨찾기 목록보기
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
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>TripUs</title>
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
	
	function deletefav(title,mno,mycno){
		
		$.ajax({
			url:'../mypage/deleteMyFavorite.do',
			type:'get',
			data:{mno:mno,mycno:mycno},
			dataType:'text',
			success : function(data){
				console.log("즐겨찾기에서 삭제됫엉");
				alert(title + "이(가) 즐겨찾기에서 삭제되었습니다.");
				location.reload();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
				alert("오류가 발생했습니다.");
			}
			
		});
		
	}
	
	function backspace(){
		location.href="/mypage/myPage.do";
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
	<div style="padding:50px;">
	<h1 align="center" style="font-family: 나눔고딕">즐겨찾기</h1>

		<div class="container" align="center" style="padding:20px">
	
			<div class="btn-group" align="center">
				<form>
					<a class="btn btn-info btn-active" href="/mypage/myfavorite.do?mygrade=0" id="all" name="all" >전체</a>
					<a class="btn btn-info" href="/mypage/myfavorite.do?mygrade=1" id="trip" name="trip">여행지</a>
					<a class="btn btn-info" href="/mypage/myfavorite.do?mygrade=2" id="res" name="res">맛집</a>
					<a class="btn btn-info" href="/mypage/myfavorite.do?mygrade=3" id="fes" name="fes">축제</a>
					<br>
					<p style="padding:10px; font-family: 나눔고딕">즐겨찾기는 최대 100개까지 등록가능합니다.</p>
				</form>
				</div>
			</div>
				<div class="viewfav" id="viewfav" align="center" style="height:60%; padding: 0px, 20%, 0px, 20%">
		
				<c:if test="${empty myFavorite}">
				<b style="font: bold; color: red; font-size: 15px; font-family: 나눔고딕 ">저장한 즐겨찾기가 없습니다.</b>
				</c:if>
				<c:forEach items="${myFavorite}" var="fav" varStatus="i">
						<hr>		
						<h3>제목 : ${fav.mytitle}</h3>
						<p>위치 : ${fav.mylocation}</p>
							<div style="display: inline-block;">
								<p>링크 :
								
								 </p>
							</div>
							<div style="display: inline-block;">
								<a href="${fav.mylink}" style="display: inline-block;">해당 게시물로 이동</a>
							</div>
						<div id="delfav">
						<a class="btn btn-primary" onclick="deletefav('${fav.mytitle}','${fav.mno}',${fav.mycno})">삭제</a>
						</div>
				</c:forEach>
				
		
			</div>
		</div>
					<div align="center" style="padding:130px">
					
					<div class="btn btn-info btm-sm" onclick="backspace();">
					<h6>마이페이지</h6>
					</div>
			
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