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

<title>Us</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<link href="/img/tripFavicons.png" rel="icon">

<style type="text/css">

.List{
   width:870px;
   height:auto;
   margin-left: 50px;
}

@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
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
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix')
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
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf')
		format('truetype');
}

.nanumbarungothic * {
	font-family: 'NanumBarunGothic', sans-serif;
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


<script type="text/javascript">
			
		$(document).ready(function(){
			var areaCode=${areaCode};
			//alert("areaCode : "+areaCode);
				$.ajax({
						url : '../FesPublicData.do',
						type : 'get',
						data : {areaCode:areaCode},
						dataType : 'json',
						success : function(data) {
							console.log("DATA : "+data);
							console.log(data);
							console.log(data.response.body.items.item);
							myItem = data.response.body.items.item;
							var areaCodeStr='';
							console.log(myItem[0].areacode);
							switch(myItem[0].areacode){
							case 1:
								areaCodeStr="??????";
								break;
							case 2:
								areaCodeStr="??????";
								break;
							case 31:
								areaCodeStr="??????";
								break;
							case 32:
								areaCodeStr="??????";
								break;
							case 6:
								areaCodeStr="??????";
								break;
							case 4:
								areaCodeStr="??????";
								break;
							case 3:
								areaCodeStr="??????";
								break;
							case 5:
								areaCodeStr="??????";
								break;
							default:
							areaCodeStr="??????????????????";
							
							}
							
							var output = '';
							output += '<h1 style="font-size:40px; font-family: ????????????">'  + areaCodeStr + '</h2>';
							for (var i = 0; i<myItem.length; i++) {
								
								var contentid=myItem[i].contentid;
								console.log(myItem.length);
								
								output += '<hr>';
								output += '<h2 onclick="detail('+myItem[i].contentid+')">' + myItem[i].title + '</h3>';
								output += '<br>';
								output += '<p> ?????? : ' + myItem[i].addr1 + '</p>';
								output += '<div class="row" id="resInfo">';
								output += '<div class="col-md-7">';
								output += '<p> ????????? : ' + myItem[i].readcount + '</p>';
								//if(){
									output += '<img id="offstar" align="right" onclick="onstar('+myItem[i].contenttypeid+', '+myItem[i].contentid+', &#39;'+myItem[i].title+'&#39;, &#39;'+myItem[i].addr1+'&#39;)" width="50px" height="50px" src="/img/??????.jpg" alt="???????????? ????????????.">';
								//}
								//else{
								//	output += '<img id="offstar" align="right" onclick="onstar('+myItem[i].contentid+', &#39;'+myItem[i].title+'&#39;, &#39;'+myItem[i].addr1+'&#39;)" width="50px" height="50px" src="/resources/img/??????.jpg" alt="???????????? ????????????.">';	
								//}
								output += '</div>';
								output += '<div class="col-md-5">';
								output += '<img class="img-rounded" onclick="detail('+myItem[i].contentid+')" width="400px" height="400px" src="' + myItem[i].firstimage  + '"alt="???????????? ????????????.">';
								output += '</div>';
								output += '</div>';
								
						
								//output += '<h4>' + myItem.firstimage + '</h4>';
								
							}

								console.log(output);
								$(".List").html(output);
							
								//document.body.innerHTML += output;
						},
						error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("Status: " + textStatus);
							alert("Error: " + errorThrown);
						}
					});
			});
		
			function detail(contentid) {
				//alert(contentid);
	  			location.href = "../fsBoard/goBoard.do?contentid="+contentid;
			}
			
			function onstar(contentTypeId,contentid,title,addr1){
				
				$.ajax({
					url : '../mypage/insertMyFavorite.do',
					type : 'get',
					data : {contentTypeId:contentTypeId,contentId:contentid,title:title,addr1:addr1},
					dataType : 'text',
					success : function(data) {
						alert(title+ "???(???) ??????????????? ?????????????????????.");
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("???????????? ????????? ?????? ???????????????.");
					}
				});
			
			}
			function offstar(contentid){
				location.href = "../mypage/deleteMyFavorite.do?contentId="+contentid;
					
			}
		</script>

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
									?????????</button>
							</a> <a class="signup" href="/signup/insertForm.do" role="button">
								<button type="button" class="btn btn-default btn-sm">
									????????????</button>
							</a>


							<ul class="nav navbar-nav">
							</ul>
							<%
								} else {
									if (mgrade.equals("1")) {
							%>
							<a class="signup" href="/admin.jsp" role="button">
								<button type="button" class="btn btn-default btn-sm">
									??????????????????</button>
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
										class="glyphicon glyphicon-user"></span>?? <span
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
															<strong> <span id="name"></span>???
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
				<!--End of navbar-header--> 
				<div class="w3-container">
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp navHeaderCollapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav navbar-right main_menu">
								<li>
									<a href="/notice/ntBoardList.nt">???????????????</a>
								</li>
									
								<li>
									<a href="/toBoard/toBoardList.to">????????????</a>
								</li>
										
								<li>
									<a href="/fsBoard/goFestivalMain.do">?????????</a>
								</li>
									
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">??????
										<span class="caret">???</span>
									</a>
										
									<ul class="dropdown-menu">
										<li>
											<a href="/coBoard/coRecommendMainBoard.do">?????? ??????</a>
										</li>
												
										<li>
											<a href="/myCourse/goDIY.do">DIY ??????</a>
										</li>
											
										<li>
											<a href="/myCourse/goMyCourseMain.do">??? ??????</a>
										</li>
									</ul>
								</li>
									
								<li>
									<a href="/restaurant/restaurantMain.do">?????????</a>
								</li>
										
								<li>
									<a href="/contact.html">???contact us</a>
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
	<div style="float: right; width: 70%; class="container">
		<div class="List"></div>
	</div>

	<!--?????? ????????????  -->
	<div class="container">
		<div class="row">
			<div class="col-sm-2 col-md-2">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=1">??????</a>
							</h4>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=31"> ??????</a>
							</h4>
						</div>

					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=6"> ??????</a>
							</h4>
						</div>

					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=4"> ??????</a>
							</h4>
						</div>

					</div>

					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=3">??????</a>
							</h4>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=5">??????</a>
							</h4>
						</div>
					</div>


					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a href="/fsBoard/fsAreaSub.do?areaCode=32">??????</a>
							</h4>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--end of ?????? ????????????  -->

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