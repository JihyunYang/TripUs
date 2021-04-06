<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.api.*" %>   
<%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs =null; %>
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>DIY 코스</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<style type="text/css">
	.box {
		margin-left:20%;
		margin-right:20%;
	}
	
	.container2 {
		width:500px; 

	}
	.thumbnail {
   font-family: 'Handon3gyeopsal300g';
   width: 235px;
   height: 240px;
   margin-left: 20px;
   
}

.card-body{
   font-family: 'Handon3gyeopsal600g';
}

.img1 {
   width: 228px;
   height: 150px;
}

.img1 img {
   position: absolute;
   top: 0;
   left: 0;
   width: 224px;
   height: auto;
}

	</style>
<title>TripUs</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--Animated CSS-->
<link rel="stylesheet" type="text/css" href="/css/animate.min.css">

<!-- Bootstrap -->
<link href="/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="/css/isotope/style.css">

<!--Main Stylesheet-->
<link href="/css/style.css" rel="stylesheet">
<!--Responsive Framework-->
<link href="/css/responsive.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/css/common.css" />
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js">
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7559504429da06478e439733fa3b3a&libraries=services,clusterer,drawingS"></script>
	<script type="text/javascript">
	var no='';
	var item='';
	var contentid='';
	var myItem=null;
	var output='';
	var title='';
	var mapx='';
	var mapy='';
	function update(id){
		item = $("#mcitem").val();
		var split = contentid.split(',');
		contentid='';
		for(var i=0; i<item; i++){//이 반복문은 삭제할 관광지의 contentid를 빼는 과정
			if(i!=id){
				contentid+=split[i];
			}
			if(i!=item-1 && i!=id){
				contentid+=",";
			}
		}
		item--;	//item 갯수 -1
		document.diyForm.mcitem.value=item;	//hidden값들 바뀐값으로 변경해주기
		document.diyForm.mccontentid.value=contentid;
		
		//var div = $("#f5").replaceWith($("#f5",$(html)));
		//var div1 = $(".contentList").replaceWith($(".contentList",$(html)));
		$(".commentList").html('');	//항목들과 map 초기화
		$("#map").html('');
		ff();
		map1();
	}
	function pp(id){//여행지 추가하는 함수
		item = $("#mcitem").val();
		var split = contentid.split(',');
		console.log("pp에서의 split : "+split+" , item : "+item);
		if(item!=0){ contentid+=',';}
		contentid+=id;// 추가할 관광지의 contentid를 추가한다.
		item++;	//item 갯수 +1
		console.log("관광지 추가 후 contentid : "+contentid+" , item : "+item);
		document.diyForm.mcitem.value=item;	//hidden값들 바뀐값으로 변경해주기
		document.diyForm.mccontentid.value=contentid;
		alert("코스에 추가하였습니다.");
		//var div = $("#f5").replaceWith($("#f5",$(html)));
		//var div1 = $(".contentList").replaceWith($(".contentList",$(html)));
		$(".commentList").html('');	//항목들과 map 초기화
		$("#map").html('');
		ff();
		map1();
	}
	$(function(){
		$("#save").click(function(){
			var title = prompt ("내 코스에 저장할 코스 이름을 입력하세요.","DIY 코스");
		
			if(title!=null){
				//alert("코스이름 : "+title);
				var cont = document.diyForm.mccontentid.value;
				var items = document.diyForm.mcitem.value;
				$.ajax({		//코스를 내 코스에 저장한다. 
					url:"/myCourse/plusCourse.do",
					type:"GET",
					data: {mcitem:items ,	//관광지 개수
						mctitle:title ,		//내코스 제목
						mccontentid : cont},//관광지 contentid들
					dataType : "text",
					success:function(data){
						console.log("data : "+data);
						if(data=="false"){//코스 추가 실패
							alert("코스 추가 실패.");
						}
						else{//코스 추가 성공
							alert("내 코스에 추가하였습니다.");
							location.href = "../myCourse/goMyCourseMain.do";
						}
					},
					error:function(data){
						console.log("에러발생");				
					}
				});
			}
		});
	});
	function aa(id,i,item){
		$.ajax({
			url : '../PublicData2.do',
			type : 'get',
			data : {contentId:id}, 
			dataType : 'json',
			async : false,
			success : function(data) {
				console.log(data.response.body.items.item);
				myItem = data.response.body.items.item;
				title +=myItem.title+'#';//+'<input type="hidden" name="hh" id="hh" value='+i+'>
				output +='<h3 id=title>'+(i+1)+'. '+myItem.title;
				
				//output +='<img src="' +myItem.firstImage+'" width ="300" height="250" alt="대표이미지">';
				output +='&nbsp<img src="https://image.flaticon.com/icons/svg/262/262555.svg" width="24" height="20" alt="대표이미지" onclick="update('+i+')"></h3><br>';
				
				mapx +=myItem.mapy+'/';
				mapy +=myItem.mapx+'/';
				console.log("번째 mapx : "+mapx);
				console.log("번째 mapy : "+mapy);
				
				if(i==item-1){
					output +='<center><img src="https://image.flaticon.com/icons/svg/334/334004.svg" width="20" height="20" alt="대표이미지"></center><br>';
				}
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
				},
		});
	}
	function ff(){
		no = $("#mcno").val();
		item = $("#mcitem").val();
		contentid = $("#mccontentid").val();
		console.log("mcno : "+no+" mcitem : "+item+" mccontentid : "+contentid);
		output='';	//output, mapx,mapy,title 모두 null로 초기화하여 새로운 값 받기
		mapx='';		//위도, 경도, 제목 null로 초기화
		mapy='';
		title='';
		var split = new Array();
		split = contentid.split(',');
		var id = '';
		if(item==0){
			output +='<center><img src="https://image.flaticon.com/icons/svg/334/334004.svg" width="20" height="20" alt="대표이미지"></center><br>';
			$(".commentList").html(output);
			$("#mcitem").val('0');
			console.log("no : "+no);
			console.log("item : "+item);
			console.log("contentid : "+contentid);		
		}
		for(var i=0; i<item; i++){ 
			id=split[i];
			console.log("id : " +id);
			aa(id,i,item);
		}
		$(".commentList").html(output);
	}
	$(function(){
		ff();
	})
	
	setTimeout(function(){
		if(item!=0){	//항목 있을때
			$("#map").load("/myCourse/goMap.do",{'size':item ,'mapx':mapx,'mapy':mapy,'homepage':title});
		}else{
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.56782, 126.97765), // 지도의 중심좌표
				level : 3, // 지도의 확대 레벨
				mapTypeId : kakao.maps.MapTypeId.ROADMAP
			// 지도종류
			};
			
			// 지도를 생성한다 
			var map = new kakao.maps.Map(mapContainer, mapOption);
		}
		
		//$("#objectID").load("test.asp", { 'choices[]': ["Jon", "Susan"] } );
		//$("#map").load("map.jsp");
	},500);
	function map1(){	//항
		$("#map").load("/myCourse/goMap.do",{'size':item ,'mapx':mapx,'mapy':mapy,'homepage':title});
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

					<div class="w3-container">
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
		<!--end of header area-->
	</section>
	<!--End of Hedaer Section-->
	<div class="box" style="width:80%;height:auto;">
		<div class="w3-row-padding" style="margin-top:50px">
			<div id="head" style="margin-left: 40px; margin-bottom: 20px;">
				<h1 style="font-family: 나눔고딕;">DIY 코스</h1><br>
			</div>
			<div style="width:1110px;">
			<hr></div>
			<br>
			<h3></h3>
			<form name="diyForm" method="POST">
					
					<c:set var="mcno" value="${mcno}"/>
					<c:set var="mcitem" value="${mcitem}"/>
					<c:set var="mccontentid" value="${mccontentid}"/>
					<input type="hidden" id="mcno" name="mcno" value="${mcno}"/> 
					<input type="hidden" id="mcitem" name="mcitem" value="${mcitem}"/>
					<input type="hidden" id="mccontentid" name="mccontentid" value="${mccontentid}"/>
				
			<div id="container2" class="w3-twothird" style="width:25%; margin-right:10px;">
				<div class="commentList" style="border:2px;padding:10px; border-color:#80AAD4;">
				
				</div>
					<center><br><br><input type="button" id="save" name="save" class="w3-button w3-round-large w3-black" value="코스 저장"/></center>
			</div>
			 </form> 
			<div class="w3-third" id="map" style="width:48%; height:60%;">
			</div>	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div id="head" style="margin-left: 40px; margin-bottom: 20px;">
				<h3 style="font-family: 나눔고딕;"># 추천 여행지</h3><br>
			</div>
			<div style="width:1110px;">
			<hr></div>
			<br>
			<form name="diyForm1" method="POST">
			<div class="row" style="margin-left: 50px;">
	     		<div class="col-md-3">
	     			<div class="thumbnail">
	     				<div class="img1"><img src="http://tong.visitkorea.or.kr/cms/resource/30/610730_image2_1.jpg" style="margin-left: 40px; margin-top:5px" alt="이미지 없음">
	               		</div>  
				     	<input type="hidden" id="mccontentid" name="mccontentid" value="250147"/>
				     	
				     	<div class="card-body" style="padding: 10px;">
				     	<input type="button"  style="float: right;" onclick="pp('250147')" class="w3-button w3-small w3-white w3-border w3-round-large" value="추가"/> 
	               			<div id="content"><b>삼청동길</b>
	               			</div>
	               			
	               			<div id="addr">주소 : 서울특별시 종로구 삼청로 107</div>
	               		</div>
	               	</div>
	       		</div>
	       		<div class="col-md-3">
	     			<div class="thumbnail">
	     				<div class="img1"><img src="http://tong.visitkorea.or.kr/cms/resource/81/1075281_image2_1.jpg" style="margin-left: 40px; margin-top:5px" alt="이미지 없음">
	               		</div>  
				     	<input type="hidden" id="mccontentid" name="mccontentid" value="126512"/>
				     	
				     	<div class="card-body" style="padding: 10px;">
				     	<input type="button"  style="float: right;" onclick="pp('126512')" class="w3-button w3-small w3-white w3-border w3-round-large" value="추가"/> 
	               			<div id="content" ><b>광화문</b> 
	               			</div>
	               			<div id="addr">주소 : 서울특별시 종로구 사직로 161</div>
	               		</div>
	               	</div>
	       		</div>
	       		<div class="col-md-3">
	     			<div class="thumbnail">
	     				<div class="img1"><img src="http://tong.visitkorea.or.kr/cms/resource/72/2363672_image2_1.jpg" style="margin-left: 40px; margin-top:5px" alt="이미지 없음">
	               		</div>  
				     	<input type="hidden" id="mccontentid" name="mccontentid" value="126537"/>
				     
				     	<div class="card-body" style="padding: 10px;"> 
				     		<input type="button"  style="float: right;" onclick="pp('126537')" class="w3-button w3-small w3-white w3-border w3-round-large" value="추가"/>
	               			<div id="content" ><b>북촌한옥마을</b> 
	               			</div>
	               			<div id="addr">주소 : 서울특별시 종로구 계동길 37</div>
	               		</div>
	               	</div>
	       		</div>
	       		
			</div>
			</form>
		</div>
		
	</div>
	<div style="margin-bottom:150px;"></div>


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