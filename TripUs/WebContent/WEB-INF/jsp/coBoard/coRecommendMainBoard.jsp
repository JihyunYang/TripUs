<%--
FileName: coRecommendMainBoard.jsp
Explanation: Course recommend Main Page
Date Written: 2019.9.20
Writer: KHW
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%!String mid="";%>
<%!String mname="";%>
<%!String memail="";%>
<%!String mgrade="";%>
<%!HttpSession hs=null;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags-->

	<title>Tour Main Page</title>

	<link href="/img/tripFavicons.png" rel="icon" />
	
	<!--Tour header bootstrap and css START-->
	<!--Animated CSS-->
	<link rel="stylesheet" type="text/css" href="/css/animate.min.css" />
	
	<!--Bootstrap-->
	<link href="/css/bootstrap.min.css" rel="stylesheet" />
	
	<!--Bootstrap Carousel-->
	<link type="text/css" rel="stylesheet" href="/css/carousel.css" />
	<link rel="stylesheet" href="/css/isotope/style.css" />
	
	<!--Main Stylesheet-->
	<link href="/css/style.css" rel="stylesheet" />
	
	<!--Responsive Framework-->
	<link href="/css/responsive.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	
	<!--Custom JavaScript-->
	<script src="/js/main.js"></script>
	<!--Tour header bootstrap and css END-->
		
	<!--Side navigation bootstrap and css START-->
	<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
	<script src="/js/jquery-1.12.3.min.js"></script>
	
	<!--Include all compiled plugins (below), or include individual files as needed-->
	<script src="/js/bootstrap.min.js"></script>
		
	<!--Tour Bootstrap-->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<!--Side navigation bootstrap and css END-->
	
	<!--Basic form bootstrap and css START-->
	<!--Include libraries(jQuery, bootstrap)-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!--Basic form bootstrap and css END-->
			
	<!--toBoardList style group-->
	<style type="text/css">
		
		@media (min-width: 1200px) {
			.container {
				width: 1190px;
				margin-bottom: -20px;
			    padding-right: 20px;
			}
		} 
		
		.col-md-12{
			font-family: Arial, Helvetica, Sans-Serif; 
		}
		
		body { 
	        font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
	        color: #333;
            height: 100%;
            overflow: auto;
	   	}
		
		#header .top_header {
	    	min-height: 66px;
	   	}
	   	
	   	.social_icon {
   			padding-right: 19px;
   		}
   		
   		a.dropdown-toggle {
   			color: black;
   		}
   		
   		.signup>button:hover {
   			background-color: #9ECFFF;
   		}
   		
   		.nav>li>a:focus, .nav>li>a:hover {
    		text-decoration: none;
   			color: #9ECFFF;
   			background-color: transparent;
		}
   		
   		.nav>li>a:focus, .nav>li>a:hover {
    		text-decoration: none;
   			color: #9ECFFF;
   			background-color: transparent;
		}
			
		.nav .open>a, .nav .open>a:focus, .nav .open>a:hover {
 			text-decoration: none;
   			color: #9ECFFF;
   			background-color: transparent;
   			pointer-events: none;
		}
		
		/*tabpanel settings css*/
		.col-sm-2 {
    		margin-top: 1.6%;
    		padding-left:0%;
    		font-size: 12px;
    		letter-spacing: -1px;
		}

		.col-sm-2>ul>li>a {
		     position: relative;
		    display: inline;
		    padding: 10px 21px;
		    float: left;
		}
		
    	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, 
		.nav-pills>li.active>a:hover {
	    	color: #0b3a61; 
	    	background-color: #9ECFFF;
	    	font-weight: bold;
	    	text-align: center;
	    	font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
    	}
    	
    	.brand-nav {
    		width: 157px;
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
		
		.tab {
			font-family: 'Handon3gyeopsal300g';
			display: inline;
			font-size: 15pt;
		}
		
		#pageContent {
    		float: left;
    		width: 100%;
    		margin-right: 1%;
    	}

		#footer {
			position: absolute;
			width:100%;
			height:60px;
			background: #f0f0f0;
		}
			
		#footer .copyright p, #footer .copyright p span a, #footer .designer p, #footer .designer a  {
    		font-size: 16px;
    		color: #726565;
    		font-family: 'Open Sans', sans-serif;
    		padding-left: 3px;
		}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function() {
		/* Searching <select> option value fix*/
		$("col-sm-2").tabs({
			select: function(event, ui) {
				window.location.replace(ui.tab.hash);
			}
		})
	});	
	
		function delete1() {
			location.href="/login/goDeleteNotice.do";
		}
	</script>
</head>

<body>
	<% System.out.println("toBoardList.jsp SUCCESS >>> : "); %>
	
	<!--Start Hedaer Section-->
	<section id="header">
		<div class="header-area">
			<div class="top_header">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="social_icon text-right">
								<%
									hs=request.getSession(true);
									mid=(String)hs.getAttribute("mid");
									mname=(String)hs.getAttribute("mname");
									memail=(String)hs.getAttribute("memail");
									mgrade=(String)hs.getAttribute("mgrade");
									
									if(mid==null) {
								%>
									<a class="signup" href="/login/loginPage.do" role="button">
										<button type="button" class="btn btn-default btn-sm">로그인</button>
									</a>
										
									<a class="signup" href="/signup/insertForm.do" role="button">
										<button type="button" class="btn btn-default btn-sm">회원가입</button>
									</a>	
									
									<ul class="nav navbar-nav"></ul>
								<%
									} else {
										if(mgrade.equals("1")) {
								%>
											<a class="signup" href="/admin.jsp" role="button">
												<button type="button" class="btn btn-default btn-sm" style="margin-top:4px;">관리자페이지</button>
											</a>
								<%
									}
								%>
										<script>
											$(document).ready(function() {
												$("#name").html("<%=mname%>");
												$("#email").html("<%=memail%>");
											});
										</script>
							
										<ul class="nav navbar-nav navbar-right">
											<li class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">
													<span class="glyphicon glyphicon-user"></span>
													<span class="glyphicon glyphicon-chevron-down"></span>
												</a>
									
												<ul class="dropdown-menu">
													<li>
														<div class="navbar-login">
															<div class="row">
																<div class="col-lg-8">
																	<p class="text-center" style="margin-left:55px;">
																		<span class="glyphicon glyphicon-user icon-size"></span>
																	</p>
																</div>
														
																<div class="col-lg-10">
																	<p>
																		<strong style="text-align:center; margin-left:10px;"> 
																			<span id="name" ></span >님
																		</strong>
																	</p>
															
																	<p style="text-align:center; margin-left:10px;">
																		<span id="email"></span>
																	</p>	
															
																	<li class="divider"></li>
													
																	<p class="text-center" >
																		<a href="/mypage/myPage.do" class="btn btn-default btn-sm">MyPage</a>
																		<a href="/login/logout.do" class="btn btn-default btn-sm">Logout</a>
																	</p>
																</div>
															</div>
														</div>
													</li>
												</ul>
											</li>
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
				
			<div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav">
				<div class="container">
					<nav class="navbar navbar-default zero_mp ">
					<!--Brand and toggle get grouped for better mobile display -->
						
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							
							<a class="navbar-brand custom_navbar-brand" href="/main.jsp">
								<img src="/img/trip.png" alt="">
							</a>
						</div>
						<!--End of navbar-header-->
						
						<!--Collect the nav links, forms, and other content for toggling-->
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
						<!--.navbar-collapse-->
					</nav>
					<!--End of nav-->
				</div>
				<!--End of container-->
			</div>
			<!--End of header menu-->
		</div>
		<!--End of header area-->
	</section>
	<!--End of header section-->
	
	<br>
	
	<div class="container">
		<!--Regional category-->
		<div role="tabpanel">
	        <div class="col-sm-2">
				<ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
					<li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=99">서&nbsp;&nbsp;울</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=99">인&nbsp;&nbsp;천</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=3&sigunguCode=99">대&nbsp;&nbsp;전</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=8&sigunguCode=99">세&nbsp;&nbsp;종</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=5&sigunguCode=99">광&nbsp;&nbsp;주</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=99">대&nbsp;&nbsp;구</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=99">부&nbsp;&nbsp;산</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=7&sigunguCode=99">울&nbsp;&nbsp;산</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=99">경&nbsp;&nbsp;기</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=99">강&nbsp;&nbsp;원</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=99">충&nbsp;&nbsp;북</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=99">충&nbsp;&nbsp;남</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=99">전&nbsp;&nbsp;북</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=99">전&nbsp;&nbsp;남</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=99">경&nbsp;&nbsp;북</a>
			        </li>
				
					<li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=99">경&nbsp;&nbsp;남</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=39&sigunguCode=99">제&nbsp;&nbsp;주</a>
			        </li>
				</ul>
			</div>
		</div>
		<!--End of Regional category-->
			
		<!--Page Content-->	
		<div class="col-md-10">
			<div id="pageContent">
				<h1>연습</h1>
			</div>
			<!--End of Page Content-->	
		</div>
		<!--End of col-md-10-->	
	</div>
	<!--End of container-->
	
	<!--Start of footer-->
	<div id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-6">
					<div class="copyright">
						<p>
							@ 2019-09-23 Mon <span><a href="">&#9798;</a></span>
						</p>
					</div>
				</div>
					
				<div class="col-md-6">
					<div class="designer">
						<p>
							A Design by <a href="#">Hanttam</a>
						</p>
					</div>
				</div>
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->
	</div>
	<!--End of footer-->
	
	<!--Scroll to top-->
	<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
	<!--End of Scroll to top-->
	
	<!--Back To Top-->
	<script src="/js/backtotop.js"></script>
	
	<!--JQuery Click to Scroll down with Menu-->
	<script src="/js/jquery.localScroll.min.js"></script>
	<script src="/js/jquery.scrollTo.min.js"></script>

	<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
	<script src="/js/jquery-1.12.3.min.js"></script>
		
	<!--Isotope-->
	<script src="/js/isotope/min/scripts-min.js"></script>
	<script src="/js/isotope/cells-by-row.js"></script>
	<script src="/js/isotope/isotope.pkgd.min.js"></script>
	<script src="/js/isotope/packery-mode.pkgd.min.js"></script>

	<!--Include all compiled plugins (below), or include individual files as needed-->
	<script src="/js/bootstrap.min.js"></script>
		
	<!-- Custom JavaScript-->
	<script src="/js/main.js"></script>
</body>
</html>