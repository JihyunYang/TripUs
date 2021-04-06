<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.api.*"%>	
<%!String mid = "";%>
<%!String mname = "";%>
<%!String memail = "";%>
<%!String mgrade = "";%>
<%!HttpSession hs = null;%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>TripUs 홈페이지입니다 ^^</title>
<!--Animated CSS-->
<link rel="stylesheet" type="text/css" href="/css/animate.min.css">

<!-- Bootstrap -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

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
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7559504429da06478e439733fa3b3a"></script>
	<style type="text/css">
	.box {
		width: 100%;
		margin-left:25%;
	}
	
	.container2 {
		display: inline-block;
		width: 870px;
		height: auto;
		margin-left: 50px;
	}
	</style>
	
<script type="text/javascript">
	var no='';
	var item = '';
	var contentids ='';
	var output='';
	var mapx='';
	var mapy='';
	var title='';
	var myItem=null;
	var ii='';
	var i2='';
	$(function(){
		$("#update").click(function(){
			var result = confirm("코스를 수정하시겠습니까?");
			var mcno = document.mcBoardForm.mcno.value;
			var mcitem = document.mcBoardForm.mcitem.value;
			if(result){
				location.href = "/myCourse/goDIY.do?mccontentid="+contentids+"&mcno="+mcno+"&mcitem="+mcitem;
			}else{
				alert("수정을 취소합니다.");
			}
		});
	});
	function aa(id,i){
		$.ajax({
			url : '../PublicData2.do',
			type : 'get',
			data : {contentId:id},
			dataType : 'json',
			async : false,
			success : function(data) {
				
				console.log("DATA : "+data);
				console.log(data.response.body.items.item);
				myItem = data.response.body.items.item;
				ii = myItem.overview;
				i2 = ii.split("<br />");
				console.log("i2 : "+i2);
				console.log("myItem : "+myItem);
				title +=myItem.title+'#';
				
				
				output += '<div class="row">';
				output += '<div class="col-sm-3">';
				output +='<img src="' +myItem.firstimage+'"  style="width:100%;height:200px" onerror="this.src="../img/no_detail_img.gif"/></div>';
				output += '<div class="col-sm-9">';
				output +='<h3>'+(i+1)+'. '+myItem.title+'</h3>';
				
				output +='<h4>'+myItem.addr1+' '+myItem.addr2+'</h4>';
				output +='<p>'+i2[0]+'</p></div></div>';
				
				
				mapx +=myItem.mapy+'/';
				mapy +=myItem.mapx+'/';
				
				console.log("번째 mapx : "+mapx);
				console.log("번째 mapy : "+mapy);
				
				//homepage +=myItem.title+'#';
				//homehome +=myItem.homepage+'^';
				//console.log("homepage : "+homepage);
				//console.log("homehome : "+homehome);
				
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
				},
		});
	}
	
	$(document).ready(function(){
		no=document.mcBoardForm.mcno.value;
		item = document.mcBoardForm.mcitem.value;
		contentids = document.mcBoardForm.mccontentid.value;
		var contentid = contentids.split(',');
		console.log("contentid.length : "+contentid.length);
		console.log("no : "+no+" , item : "+item+" , contentid : "+contentid);
		var id = null;
		
		for(var i=0; i<item; i++){
			id=contentid[i];
			console.log("id : "+id);
			aa(id,i);
		}
		$(".commentList").html(output);
	});
	setTimeout(function(){
		$("#map").load("/myCourse/goMap.do",{'size':item ,'mapx':mapx,'mapy':mapy,'homepage':title});
		//$("#objectID").load("test.asp", { 'choices[]': ["Jon", "Susan"] } );

		//$("#map").load("map.jsp");
		
	},500);
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
						<!--End of navbar-header--> 
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

<div class="box">
<div class="container2">
	<div id="head" style="margin-left: 40px; margin-bottom: 20px;">
		<h1 style="font-family: 나눔고딕;">내 코스</h1>
		<br>
	</div>
	<c:set var="mcno" value="${mcno}"/>
	<c:set var="mcitem" value="${mcitem}"/>
	<c:set var="mccontentid" value="${mccontentid}"/>
	<hr>
	<h3></h3>
		<form  method="POST" name="mcBoardForm">
			<input type="hidden" id="mcno" name="mcno" value="${mcno}"/> 
			<input type="hidden" id="mcitem" name="mcitem" value="${mcitem}"/>
			<input type="hidden" id="mccontentid" name="mccontentid" value="${mccontentid}"/>
			<div align=right><input type="button" id="update" name="update" class="w3-button w3-round-large w3-black"  value="코스 수정하기"/>
			</div>
		
			<div class="commentList">
			</div>
			<hr>
			<div id="map" style="margin-bottom:100px;margin-top:30px;">
			</div>
			
		</form>
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