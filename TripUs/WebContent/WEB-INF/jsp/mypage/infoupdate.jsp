<%--
파일명 : infoupdate.jsp
설명 : 내 정보수정
작성일 : 2019.9.1
작성자 : LHJ
 --%>


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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>tripUs</title>
	<link href="/img/tripFavicons.png" rel="icon">
	
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
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


<!-- bootstrap 3.4.0 -->	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

		
	
	
	

	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<script type="text/javascript">
	
	
	
	
	function nickCheck(){
		
		
		var mnick=document.getElementById("mnick").value;
		
		//alert("mnick : "+ mnick);

		$.ajax({
			url:"/mypage/infoNickCheck.do",
			type:"GET",
			data:{mnick:mnick},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "text",
			success:function(resultStr){
				console.log("resultStr : " + resultStr);
				if(resultStr=="nicktrue"){
					alert("별명을 사용할수 있습니다.");
				}
				else if(resultStr=="nickfail"){
					alert("해당 별명을 사용할 수 없습니다.");
				}
				else{
					console.log("data : " + resultStr);
					alert("data에 잘못된 값 들어감");
				}
			},
			error:function(resultStr){
				console.log("data : " + resultStr);
				alert("예기치못한 오류발생");
			}
		});


		
	}
	
	function pwCheck(){
		var npw = document.getElementById("npw");
		var mpw = document.getElementById("mpw");
		var checkmpw = document.getElementById("checkmpw");
		if(npw.value==null){
			alert("현재 비밀번호를 입력하세요.");
			npw.value = "";
			npw.focus();
			return false;
		}
		if(mpw.value.length>7&&mpw.value.length<15){
			if(mpw.value == checkmpw.value) {
				
				return true;
			} else {
				alert("비밀번호가 다릅니다.");
				checkmpw.value = "";
				checkmpw.focus();
				
				return false;
			}
		}else{
			alert("비밀번호를 8자 이상 14자 이하로 입력하세요.");
			document.getElementById("mpw").focus();
			return false;
		}
	}
	
	function updateInfo(){
		
		var mprofile=$("#mprofile").val();
		var mpw=$("#mpw").val();
		var mhp=$("#mhp").val();
		var mnick=$("#mnick").val();
		
		if( !$("#npw").val() )   
		{
			alert( "현재 [비밀번호]를 적어주세요." ); 
			 document.getElementById("npw").focus();   
			 return;
		}
		/*if( !$("#mprofile").val() )   
		{
			 alert( "수정할 [이미지]을 넣어주세요." ); 
			 document.getElementById("mprofile").focus();   
			 return;
		}*/
		if( !$("#mnick").val() )   
		{
			 alert( " 수정할 [별명]을 적어주세요" ); 
			 document.getElementById("mnick").focus();   
			 return;
		}
		if( !$("#mhp").val() )   
		{
			 alert( "수정할 [휴대전화]를 적어주세요" ); 
			 document.getElementById("mhp").focus();   
			 return;
		}else{
			
			var mhpcheck= /[0-9]/g;
			var mhplang = /^(010)\d{4}\d{4}$/;
			
			if(!mhpcheck.test(document.getElementById("mhp").value)){
				alert("핸드폰 번호 오류 - 숫자를 입력하세요.");
				document.getElementById("mhp").focus();
				return false;
			}
			
			if(!mhplang.test(document.getElementById("mhp").value)){
				alert("핸드폰 번호를 잘못 입력했습니다. 입력양식 : 01000000000");
				document.getElementById("mhp").focus();
				return false;
			}
		}
		
		if( !$("#mpw").val())   
		{
			 alert( "수정할 [비밀번호]를 적어주세요" ); 
			 document.getElementById("mpw").focus();   
			 return false;
		}
		
		if(pwCheck()==false){
		return false;	
		}
		
		//alert("mprofile : " + mprofile);
		//alert("mpw : " + mpw);
		//alert("mhp : " + mhp);
		//alert("mnick : " + mnick);
		$.ajax({
			url:"/mypage/memberInfoUpdate.do",
			type:"GET",
			data:{mpw:mpw,
				 mhp:mhp,
				 mprofile:mprofile,
				 mnick:mnick},
			dataType : "text",
			success:function(data){
				console.log("data : " + data);
				if(data=="infocomple"){
					alert("정보 수정을 완료하였습니다.");
					document.updateinfo.action="/mypage/myPage.do";
					document.updateinfo.submit();
				}
				else if(data=="infofail"){
				alert("잘못 입력했습니다. 다시입력하세요.");
				}
				else{
					console.log("data : " + data);
					alert("이상한 오류");
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
		
	}
	</script>

	<style type="text/css">
		td{
			border: deepskyblue 1.5px solid;
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
	<!--End of Hedaer Section-->
	
		<div class="container">	
		<div style="margn-left:130px">
		
		<h2 align="center"> 정보수정 </h2>
		
		<form name="updateinfo" method="POST" action="/mypage/myPage.do">
		
			<div class="signup-form" id="infoform" align="center">
				<!--
				<div id="img">
				<label class="control-label" style="margin:30px;">이미지 :  </label>
				 
				<img class="img-fluid rounded mb-4 mb-lg-0" src="${mprofile}" width="200px" height="200px" alt="">
				
				 <input class="btn btn-info btn-sm" style="width: 80px; height: 30px; margin:30px" type="button" id="mprofile" name="mprofile"  value="사진 변경"/>
			
				</div>
				 -->
				<br>
				<br>
				<br>
				<br>
				<div class="signup-form" id="nick">
				<label class="control-label">별명 : </label>
				<input type="text" class="form-control" id="mnick" name="mnick" style="width:300px" placeholder="* 한글 10자" value="${memberVO.mnick}"/>
				<input type="button" class="btn btn-info btn-sm" style="width: 80px; height: 30px; margin:10px" id="checknick" name="checknick" value="중복확인" onclick="nickCheck()"/>
				</div>
				<br>
				<br>
				<div class="signup-form" id="hp">
				<label class="control-label">전화번호 : </label>
					<input type="text" class="form-control" id="mhp" name="mhp"  style="width:300px" placeholder="* 예) 01077771111" value="${memberVO.mhp}"/>
				</div>
				<div class="signup-form" id="pw" style="margin:30px;">
				<label class="control-label">현재 비밀번호 : </label>
					<input type="password" class="form-control" id="npw" name="npw" style="width:300px" placeholder="* 소문자 + 특수문자 + 숫자 / 8 ~15자" value="${memberVO.mpw}"/>
				</div>
				<div class="signup-form" id="pw" style="margin:30px;">
				<label class="control-label">변경할 비밀번호 : </label>
					<input type="password" class="form-control" id="mpw" name="mpw" style="width:300px" placeholder="* 소문자 + 특수문자 + 숫자 / 8 ~15자" value="${memberVO.mpw}"/>
				</div>
				<div class="signup-form" id="cpw" style="margin:30px;">
				<label class="control-label">비밀번호 확인 : </label>
					<input type="password" class="form-control" id="checkmpw" name="checkmpw" placeholder="비밀번호와 동일하게 작성하세요." style="width:300px" value=""/> <br>
				</div>
				<div class="signup-form" style="margin:30px;">
					<input type="button" class="btn btn-info btn-sm" style="width: 60px; height: 30px" id="mupdate" name="mupdate" onclick="updateInfo()" value="수정"/>
				</div>
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