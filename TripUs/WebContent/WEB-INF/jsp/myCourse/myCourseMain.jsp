<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%!String mid = "";%>
<%!String mname = "";%>
<%!String memail = "";%>
<%!String mgrade = "";%>
<%! HttpSession hs =null; %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>TripUs 홈페이지입니다 ^^</title>
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

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
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


.thumbnail {
   font-family: 'Handon3gyeopsal300g';
   width: 235px;
   height: 220px;
   margin-left: 20px;
}

.card-body{
   font-family: 'Handon3gyeopsal600g';
}

.img1 {
   width: 228px;
   height: 160px;
}

.img1 img {
   position: absolute;
   top: 0;
   left: 0;
   width: 224px;
   height: auto;
}

.box{
	width:100%;
	text-align:center;
}

.container2 {
	display: inline-block;
	width: 870px;
	height: auto;
	margin-left: 50px;
}

</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript">
			var image = new Array();
			var myItem = null;
			function detail(mcno,mcitem,mccontentid) {
	  			location.href = "../myCourse/goMcBoard.do?mcno="+mcno+"&mcitem="+mcitem+"&mccontentid="+mccontentid;
			}
			function aa(id,i){
				$.ajax({
					url : '../PublicData2.do?',
					type : 'get',
					data : {contentId: id },
					dataType : 'json',
					async : false,
					success : function(data) {
						myItem = data.response.body.items.item;
						console.log("myItem : "+myItem);
						image[i] +='<img src="' +myItem.firstimage+'" style="margin-left: 40px; margin-top:5px;" alt="대표이미지">';
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){
						alert("Status: " + textStatus);
						alert("Error: " + errorThrown);
						},
				});
			}
			$(document).ready(function(){
				$('input').filter("#mccontentid").each(function(index,element){
					var contentids =$(element).val();
					console.log((index+1)+"번째 contentID들  :" +contentids);	
					var contentid = new Array(); 
					contentid = contentids.split(',');
					console.log("contentid[0] : "+contentid[0]);
					aa(contentid[0],index);
				});
				$('div').filter(".img1").each(function(index,element){
					$(element).html(image[index]);	
				});
			});
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
															<a href="#" class="btn btn-default btn-sm"> My page</a> <a
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
				<!--End of navbar-header--> <!-- Collect the nav links, forms, and other content for toggling -->
				
				<div class="w3-container">
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse zero_mp"
							id="bs-example-navbar-collapse-1">
							
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
							
						</div></div>
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
	<%
		hs = request.getSession(true);
		mid =(String)hs.getAttribute("mid");
		if(mid!=null){
	%>
	<br>
	<br>
<div class="box">
	<div class="container2">
		<div id="head" style="margin-bottom: 20px;">
			<h1 style="font-family: 나눔고딕;">내 코스</h1>
			<br>
		</div>
		<hr>
		<form name="mcListForm" method="POST">
	      	<div class="row">
		     	<c:forEach var="mcList" items="${myCourseList}">
		     		<div class="col-md-4">
		     			<div class="thumbnail">
		     				<div class="img1" onclick="detail('${mcList.mcno}','${mcList.mcitem}','${mcList.mccontentid}')">
		               		</div>  
					     	<input type="hidden" id="mcno" name="mcno" value="${mcList.mcno}"/>
					     	<input type="hidden"  id="mcitem" name="mcitem"  value="${mcList.mcitem}"/>
					     	<input type="hidden" id="mccontentid" name="mccontentid" value="${mcList.mccontentid}"/>
					     	<div class="card-body"> 
		               			<div id="content" onclick="detail('${mcList.mcno}','${mcList.mcitem}','${mcList.mccontentid}')">${mcList.mctitle} 
		               			</div>
		               		</div>
		               	</div>
		       		</div>
		        </c:forEach>
			</div>
		</form>
	</div>
</div>	
<div style="margin-bottom:200px;"></div>
	<%
		}else{
	%>	
	<script>
		alert("로그인이 필요한 페이지입니다. 로그인 페이지로 이동합니다.");
		location.href ="/login/loginPage.do";
	</script>
	<%
		}
	%>

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