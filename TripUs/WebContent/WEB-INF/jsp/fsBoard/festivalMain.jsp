<%--
파일명 : festivalMain.jsp
설명 : 축제 메인페이지
작성일 : 2019.9.20
작성자 : YJH
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs =null; %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags-->

		<title>Festival Main Page</title>

		<link href="/img/tripFavicons.png" rel="icon" />
		
		<!--TripUs header bootstrap and css START-->
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
		<!--TripUs header bootstrap and css END-->
		
		<!--Side navigation bootstrap and css START-->
		<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
		<script src="/js/jquery-1.12.3.min.js"></script>

		<!--Include all compiled plugins (below), or include individual files as needed-->
		<script src="/js/bootstrap.min.js"></script>
		
       	<!--Festival Bootstrap-->
		<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<!--Side navigation bootstrap and css END-->

		<!--Basic form bootstrap and css START-->
		<!--Include libraries(jQuery, bootstrap)-->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!--Basic form bootstrap and css END-->
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.9.1.js"></script>

		<!--festivalMain style group-->
		<style type="text/css">
			@media (min-width: 1200px) {
					.container {
				   		width: 1190px;
				    	margin-bottom: -20px;
				    	padding-right: 20px;
					}
			}
			
			body { 
	        font-family: Arial, Helvetica, Sans-Serif; 
            height: 100%;
	   		}
				
			#header .top_header {
	    	min-height: 66px;
	   		}
	   		
	   		/* #header .header_menu .main_menu {
    		padding-right: 15px;
    		padding-top: 20px;
			} */
	   			
	   		.social_icon {
   			padding-right: 19px;
   			}
		
			#row {
			margin-left : 8px;
			margin-bottom: 2%;
    		margin-top: 3%; 
			}

			.col-sm-9 {
			margin-left : 8%;
			}
			
			#festivalmain {
    		float: left;
    		width: 26%;
    		padding-left: 156px;
    		margin-top: 9px;
			}
			
			.col-sm-2 col-md-2 {
			width :30px;
			
			}
			
			#pageContent {
    		float: left;
    		width: 60%;
    		padding-left: 87px;
    		margin-top: -67px;
    		}
    		
    		.carousel-inner>.item>a>img {
    		height:350px;
    		}
    		
			.nav-pills>li.active>a, .nav-pills>li.active>a:focus, 
			.nav-pills>li.active>a:hover {
	    	color: #0b3a61;
	    	background-color: #9ECFFF;
	    	font-weight: bold;
	    	width: 157px;
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

			#footer {
			background: #f0f0f0;
			width: 100%;
			height: 60px;
			margin-top:50%;
			}
			
			#footer .copyright p, #footer .copyright p span a, #footer .designer p, #footer .designer a  {
    		font-size: 16px;
    		color: #726565;
    		font-family: 'Open Sans', sans-serif;
    		padding-left: 3px;
			}

			@font-face {
			font-family: 'NanumBarunGothic';
			font-style: normal;
			font-weight: 400;
			src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
			src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
				 format('embedded-opentype'),
				 url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
				 format('woff'),
				 url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
				 format('truetype');
			}

			@font-face {
			font-family: 'NanumBarunGothic';
			font-style: normal;
			font-weight: 700;
			src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
			src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix')
				 format('embedded-opentype'),
				 url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff')
				 format('woff'),
				 url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf')
				 format('truetype')
			}

			@font-face {
			font-family: 'NanumBarunGothic';
			font-style: normal;
			font-weight: 300;
			src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
			src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix')
				 format('embedded-opentype'),
				 url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff')
				 format('woff'),
				 url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf')
				 format('truetype');
			}

			@font-face {
			font-family: 'Handon3gyeopsal300g';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff')
				 format('woff');
			font-weight: normal;
			font-style: normal;
			}

			@font-face {
			font-family: 'Handon3gyeopsal600g';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff')
				 format('woff');
			font-weight: normal;
			font-style: normal;
			}

			.carousel-caption{
			font-family: 'Handon3gyeopsal600g';
			}

			.tab {
			font-family: 'Handon3gyeopsal300g';
			display: inline;
			font-size: 15pt;
			}

			.carousel-inner>.item>img, .carousel-inner>.item>a>img {
			width: 70%;
			margin: auto;
			}

			.thumbnail {
			font-family: 'Handon3gyeopsal300g';
			width: 228px;
			height: 270px;
			margin-left: 20px;
			margin-bottom: 50px;
			}

			.fsBoardForm{
			font-family: 'Handon3gyeopsal600g';
			}

			.img1 {
			width: 228px;
			height: 190px;
			}

			.img1>img {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: auto;
			}
			
			.carousel-inner>.item>a>img {
			width: 100%;
 	   		margin: auto;
			}
			
			#title {
			font-size: 36px;
			color: #0b3a61;
    		margin-bottom: 10px;
    		padding-top: 19px;
			}
		</style>

		<script type="text/javascript">
			var img = new Array();
			//var title = new Array();
			var content = new Array();
			var addr = new Array();

			function detail(viewno) {
				//alert("클릭");
				location.href = "/fsBoard/goDetail.do?viewno=" + viewno;
				}

			function aa(id, i) {
				$.ajax({
					url: '/PublicData3.do',
					type: 'get',
					data: { contentID : id },
					dataType: 'json',
					async: false,
					success: function(data) {
							  console.log(data.response.body.items.item);
							  myItem = data.response.body.items.item;

							  img[i] = '<img src="'+myItem.firstimage+'" class="img-rounded" alt="대표이미지">';
							  //title[i] = '<h4>' + myItem.title + '</h1>';
							  //title[i] += '<p>' + myItem.overview + '</p>';
							  addr[i] = '<p>' + myItem.addr1 + '<p>';
							  console.log("img[" + i + "] : " + img[i]);
							  //console.log("title[" + i + "] : " + title[i]);
							  //$(".commentList").html(output);
							  //$("#img").html(img[i]);
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						   console.log(textStatus);
						   console.log(errorThrown);
						   //alert("Status: " + textStatus);
						   //alert("Error: " + errorThrown);
					}
				});
			}

			$(document).ready(function() {
				$('input').filter("#contentID").each(function(index, element) {
					var contentid = $(element).val();
					console.log((index + 1) + "번째 contentID  :" + contentid);
					aa(contentid, index);
					//$(element).val(index+1);
				});

				$('div').filter("#img1").each(function(index, element) {
					console.log(">>>" + img[index]);
					console.log(">>>" + index);
					$(element).html(img[index]);
				});
	
				$('div').filter("#content").each(function(index, element) {
					$(element).html(addr[index]);
				});
	
				// Activate Carousel
				$("#myCarousel").carousel({
					interval : 2000,
					pause : "hover"
				});
	
				// Enable Carousel Indicators
				$(".item1").click(function() {
					$("#myCarousel").carousel(0);
				});
			
				$(".item2").click(function() {
					$("#myCarousel").carousel(1);
				});
			
				$(".item3").click(function() {
					$("#myCarousel").carousel(2);
				});
			
				$(".item4").click(function() {
					$("#myCarousel").carousel(3);
				});
	
				// Enable Carousel Controls
				$(".left").click(function() {
					$("#myCarousel").carousel("prev");
				});
				
				$(".right").click(function() {
					$("#myCarousel").carousel("next");
				});
			});
		</script>
	</head>
	
	<body>
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
				
									if(mid==null){
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
										$(document).ready(function(){
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
									<img src="/img/trip.png" alt=""></a>
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
		<div id="festivalmain">
			<!--지역 카테고리  -->
			<div class="container">
				<div role="tabpanel">
	            	<div class="col-sm-2">
	            		<div class="row">
	            			<div class="col-sm-2 col-md-2">
		                		<ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
			                    	<li role="presentation" class="brand-nav active">
			                    		<a href="/fsBoard/fsAreaSub.do?areaCode=1">서울</a>
			                    	</li>
			                    	
			                    	<li role="presentation" class="brand-nav">
			                    		<a href="/fsBoard/fsAreaSub.do?areaCode=31">경기</a>
			                    	</li>
			                    	
			                    	<li role="presentation" class="brand-nav">
			                    		<a href="/fsBoard/fsAreaSub.do?areaCode=6">부산</a>
			                    	</li>
			                    	
			                    	<li role="presentation" class="brand-nav">
			                    		<a href="/fsBoard/fsAreaSub.do?areaCode=4">대구</a>
			                    	</li>
			                    	
			                    	<li role="presentation" class="brand-nav">
			                    		<a href="/fsBoard/fsAreaSub.do?areaCode=3">대전</a>
			                    	</li>
			                    	
			                    	<li role="presentation" class="brand-nav">
			                    		<a href="/fsBoard/fsAreaSub.do?areaCode=5">광주</a>
			                    	</li>
			                    	
			                    	<li role="presentation" class="brand-nav">
			                    		<a href="/fsBoard/fsAreaSub.do?areaCode=32">강원</a>
			                    	</li>
		                		</ul>
	            			</div>
	            		</div>
	           		</div>
				</div>
			</div>
		</div>
		
		<br>
		<br>
		<br>

		<!--Page Content-->
		<div id="pageContent">
			<div class="container2">
				<div id="head">
					<h1 id="title">축 제</h1>
					<p id=menuTap>
						<a href="#"> #전체&nbsp&nbsp&nbsp </a>
						<a href="#"> #공연&nbsp&nbsp&nbsp </a>
						<a href="#"> #전시회&nbsp&nbsp&nbsp </a>
						<a href="#"> #나들이&nbsp&nbsp&nbsp </a>
						<a href="#"> #가을여행 </a>
					</p>
				</div>
				
				<!--carousel images-->
				<div class="row">
					<div class="col-lg-12">
					<!--col-lg-12사이즈-->
						<div id="myCarousel" class="carousel slide my-4" data-ride="carousel">
							<!--Indicators-->
							<ol class="carousel-indicators">
								<li class="item1 active"></li>
								<li class="item2"></li>
								<li class="item3"></li>
							</ol>
							
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<a href="#"> <img src="/img/festival_main1.jpg" alt="First slide">
									</a>
									<div class="carousel-caption">
										<h1>제주도</h1>
										<p style="font-size: 20px;">아름다운 핑크빛 물결</p>
									</div>
								</div>
								
								<div class="item">
									<a href="#"> <img src="/img/festival_main2.jpg" alt="Second slide">
									</a>
									<div class="carousel-caption">
										<h1>강진청자축제</h1>
										<p style="font-size: 20px;">이색축제를 즐겨보세요</p>
									</div>
								</div>
								
								<div class="item">
									<a href="#"> <img src="/img/festival_main3.jpg" alt="Third slide">
									</a>
									<div class="carousel-caption">
										<h1>황룡강 노란꽃잔치</h1>
										<p style="font-size: 20px;">꽃의 향연으로 화려한 가을</p>
									</div>
								</div>
							</div>
					
							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> 
							
							<a class="right carousel-control" href="#myCarousel" role="button">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
	
						<br>
						<br>
						
						<div class="row">
							<c:forEach var="fsList" items="${fsBoardList}">
							<div class="col-md-4">
								<div class="thumbnail">
									<div id="img1"></div>
									<div class="card-body">
										<h4 class="fsBoardForm" onclick="detail('${fsList.viewno}')">${fsList.viewname}</h4>
										<input type="hidden" id="contentID" name="contentID" value="${fsList.contentid}" />
										<input type="hidden" id="viewno" name="viewno" value="${fsList.viewno}" /> 
										<input type="hidden" id="viewname" name="viewname" value="${fsList.viewname}" />
										<div id="content"></div>
									</div>
									<!--/.card-body-->
								</div>
								<!--/.card h-100-->
							</div>
							</c:forEach>
						</div>
					</div>
					<!--/.col-lg-9-->
				</div>
				<!--/.row-->
			</div>
			<!--/.container2-->
		</div>
		<!--Page Content-->

		<!--Start of footer-->
		<section id="footer">
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
		</section>
		<!--End of footer-->
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
		<script src="/js/jquery-1.12.3.min.js"></script>
	
		<!--Isotope-->
		<script src="/js/isotope/min/scripts-min.js"></script>
		<script src="/js/isotope/cells-by-row.js"></script>
		<script src="/js/isotope/isotope.pkgd.min.js"></script>
		<script src="/js/isotope/packery-mode.pkgd.min.js"></script>

		<!--Back To Top-->
		<script src="/js/backtotop.js"></script>

		<!--Include all compiled plugins (below), or include individual files as needed-->
		<script src="/js/bootstrap.min.js"></script>
		
		<!-- Custom JavaScript-->
		<script src="/js/main.js"></script>
</body>
</html>