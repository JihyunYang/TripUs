<%--
FileName (파일명): toBoardDetail.jsp
Explanation (설명): Tour Detail Page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%!String mid="";%>
<%!String mnick="";%>
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
	<!--
		The above 3 meta tags *must* come first in the head. (위의 3 가지 메타 태그가 맨 앞에 와야합니다.)
		any other head content must come *after* these tags. (다른 헤드 콘텐츠는이 태그 뒤에 와야합니다.)
	-->
	
	<title>Tour Detail Page</title>
	
	<link href="/img/tripFavicons.png" rel="icon">

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

	<!--toBoardDetail style group-->
	<style type="text/css">
		@media (min-width: 1200px) {
			.container {
  				width: 1190px;
				margin-bottom: -20px;
				padding-right: 20px;
			}
		}
		
		html { 
            height: 100%;
            overflow: auto;
	    }
	    
	    body { 
	        font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
	        color: #333;
	   	}

		#header .top_header {
	    	min-height: 66px;
	    	font-family: Arial, Helvetica, Sans-Serif; 
	   	}
		
		.social_icon {
   			padding-right: 19px;
   		}
   		
   		.signup>button:hover {
   			background-color: #9ECFFF;
   		}
   		
   		a.dropdown-toggle {
   			color: black;
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
		    font-size: 15px;
		}
				
    	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, 
		.nav-pills>li.active>a:hover {
	    	color: #0b3a61; 
	    	background-color: #9ECFFF;
	    	font-weight: bold;
	    	text-align: center;
	    	font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
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
    	
    	/*output List div*/
    	.List {
    		    width: 91%;
			    float: left;
			    margin-top: 11px;
			    margin-left: 8.5%;
    	}
    	
    	.aBtn {
    		color: #899eb0;
    	}
    	
    	.container2 {
			margin-left: 8.5%;
    	}
    	
    	.col-md-5 {
    		width: 100%;
    		text-align: center;
    	}
    	
    	.img-rounded {
    		border-radius: 8px;
   	 		width: 61%;
    		height: 330px;
    	}
    	
    	.col-md-7 {
    		width: 100%;
    		text-align: justify;
    	}
    	
    	em.commentNumber {
	    	padding-right: 10px;
	    	margin-right: 7px;
	    	background: url(/img/line_tit.png) 100% 50% no-repeat;
	    	font-style: normal;
	    	font-weight: normal;
    	}
    	
    	.overviewP {
    		width: 90%;
    		display: inline-block;
    		padding-top: 7%;
    		padding-bottom: 5%;
    		margin: 0px 0px 0px 51px;
    		word-break: keep-all;
		}
    	
    	#gobackBtn {
    		display: flex;
    		justify-content: center;
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
    		 
    		<%--Using EL to use values contained in ModelAndView(Controller에 ModelAndView값을 사용하기 위해서 EL(=${})을 사용)--%>
    	 	var contentid=${contentid};
    	 		console.log("toBoardDetail.contentid confirm >>> : " + contentid);
    	 	
    	 	<%--API information is output in an asynchronous manner (API정보를 비동기방식으로 출력한다.)--%>
    	 	$.ajax({
    	    	url : '/PublicData2.do',
    	        type : 'get',
    	        data : {contentId:contentid},
    	        dataType : 'json',
    	        success : function(data) {
    	                  	console.log("toBoardDetail.jsp data type confirm >>> : " + data);
    	                  	console.log("toBoardDetail.jsp data value confirm >>> : " , data);
    	                  	console.log("toBoardDetail.jsp data.response.body.items.item confirm >>> : " , data.response.body.items.item);
    	                  
    	                  	myItem = data.response.body.items.item;
    	                  		console.log("resAreaSub.jsp myItem confirm >>> : " , myItem);
    	              		
    	                  	/*This is a statement that displays the imported API information (가져온 API정보를 출력하는 구문이다.)*/
	    	                var output='';
	    	                    
    	                  	output += '<hr>';
	    	                output += '<p style="font-size:21px; font-family: 나눔고딕"><img class="mainTopImg" src=\"/img/tourImg.png\" alt="등록된 이미지가 없습니다." width="25px" height="25px"> '+ myItem.title + '</p>';
	    	                output += '<hr style="border: dashed 1px #eee">';
	    	                
	    	                if(myItem.addr1!=null){
	    	                	output += '<p style="color:#666">ㆍ주 소 : ' + myItem.addr1 + '</p>';	    	                    	
	    	                } else {
	    	                    output += '<p style="color:#666">ㆍ주 소 : 미등록 상태입니다.</p>';
	    	                }
	    	                
	    	                if(myItem.tel!=null){
	    	                	output += '<p style="color:#666">ㆍ전화번호 : ' + myItem.tel + '</p> '	    	                    	
	    	                } else {
	    	                    output += '<p style="color:#666">ㆍ전화번호 : 미등록 상태입니다.</p> '
    	                    }
	    	                    
	    	                if(myItem.homepage!=null){
	    	                	brforeHomepage = myItem.homepage;
	    	                	afterHomepage = brforeHomepage.split('<br />');
		    	            	output += '<p style="color:#666">ㆍ홈페이지 : ' + afterHomepage[0] + '</p> '	    	                    	
		    	            } else {
		    	                output += '<p style="color:#666">ㆍ홈페이지 : 미등록 상태입니다.</p> '
		    	            }
	    	                
	    	                output += '<hr style="border: dashed 1px #eee">';
	    	                output += '<div class="row" id="resInfo">';
	    	                output += '<div class="col-md-5">';
	    	                output += '<img class="img-rounded" src="' + myItem.firstimage  + '"alt="등록된 이미지가 없습니다." onerror="this.src=\'/img/DetailOnerror.png\'">';
	    	                output += '</div>';
	    	                output += '<br/><br/><br/><br/><br/>';
	    	                output += '<div class="col-md-7">';
	    	                output += '<p class="overviewP">' + myItem.overview + '</p>';
	    	                output += '</div>';
	    	       	    	output += '</div>'; 
    	                     
    	                   	console.log("toBoardDetail.jsp All output confirm  >>> : " , output);
    	                    $(".List").html(output);
    	                    //document.body.innerHTML += output;
    	                     	
    	                    /*When you click on an area, (지역을 클릭하면,)
                    		  the corresponding class is applied and fixed using addClass (해당하는 클래스가 addClass를 이용해서 active가 적용되어 고정된다)
                    		  It is a variable declaration to hold an index to distinguish 
                    		  a tag to execute this event. (이 이벤트를 실행할 태그를 구별하기 위해 인덱스를 보유하는 변수 선언입니다.)*/
    	                    var index;
    	                     	
    	                    switch(myItem.areacode) {
			                    case 1:
			                    	areaCodeStr="서 울 (Seoul)";
			                    	index = 0;
			                        break;
			                     case 2:
			                        areaCodeStr="인 천 (Incheon)";
			                        index = 1;
			                        break;
			                     case 3:
				                    areaCodeStr="대 전 (Daejeon)";
				                    index = 2;
				                    break;
			                     case 8:
				                    areaCodeStr="세 종 (Sejong)";
				                    index = 3;
				                    break;
			                     case 5:
					                areaCodeStr="광 주 (Gwangju)";
					                index = 4;
					                break;
			                     case 4:
			                   		areaCodeStr="대 구 (Daegu)";
				                    index = 5;
				                    break;
			                     case 6:
			                   		areaCodeStr="부 산 (Busan)";
				                    index = 6;
				                    break;
			                     case 7:
			                   		areaCodeStr="울 산 (Ulsan)";
				                    index = 7;
				                    break;
			                     case 31:
			                   		areaCodeStr="경 기 (Gyeonggi)";
				                    index = 8;
				                    break;
				                 case 32:
			                        areaCodeStr="강 원 (Gangwon)";
			                        index = 9;
			                        break;
				                 case 33:
			                   		areaCodeStr="충 북 (Chungbuk)";
				                    index = 10;
				                    break;
				                 case 34:
			                   		areaCodeStr="충 남 (Chungnam)";
				                    index = 11;
				                    break;
			                 	 case 37:
			                   		areaCodeStr="전 북 (Jeonbuk)";
				                    index = 12;
				                    break;
			                 	 case 38:
			                   		areaCodeStr="전 남 (Jeonnam)";
				                    index = 13;
				                    break;
			                 	 case 35:
			                   		areaCodeStr="경 북 (Gyeongbuk)";
				                    index = 14;
				                    break;
				                 case 36:
			                        areaCodeStr="경 남 (Gyeongnam)";
			                        index = 15;
			                        break;
				                 case 39:
			                   		areaCodeStr="제 주 (Jeju)";
				                    index = 16;
				                    break;
			              		 default:
			                     	areaCodeStr="지역 분류 없음"; 
		               	 	}//End of switch block
    	                    
		               	 	/*Syntax for setting the active class specified in the previous page (이전 페이지에 지정된 활성 클래스를 설정하기위한 구문)*/	
    	                    $("ul.nav-pills>li").eq(index).addClass("active");
    	        		  },
				error : function(XMLHttpRequest, textStatus, errorThrown) {
    	                	alert("error Status >>> : " + textStatus);
    	                  	alert("Error confirm >>> : " + errorThrown);
    	               	}
			});//End of ajax block
		});//End of document.ready block
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
		                        	mnick = (String) hs.getAttribute("mnick");
		                        	if (mid == null) {
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
                           				if (mgrade.equals("1")) {
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
			<div class="List"></div>

		    <!--Comment Area-->
        	<div class="container2">
        		<label for="content">Comments</label>
            	<form name="commentInsertForm">
              		<div class="input-group">
              			<input type="hidden" name="contentid" id="contentid" value="${contentid}" />
                        <input type="hidden" name="commentid" id="commentid" value="${sessionScope.mid}" />
                  		<%-- >>>>>>>>>>>>> + ${sessionScope.mid} --%>
                  		<input type="hidden" name="commentnick" id="commentnick" value="${sessionScope.mnick}" />
                  		<input type="text" class="form-control" id="commentContent" name="commentcontent" placeholder="댓글을 남겨주세요.">
                  		<span class="input-group-btn">
                    		<button class="btn btn-info" type="button" name="commentInsertBtn">등 록</button>
                 		</span>
              	 	</div>
              	 	<br>
            	</form>
        	</div>

      		<div class="container2">
        		<div class="commentList"></div>
         		<div id="gobackBtn">
         			<a href="javascript:history.back()" class="btn btn-info"">Back</a>
         		</div>
      		</div>
      			
      		<%@ include file="/WEB-INF/jsp/comment/commentS.jsp"%>
      	</div>
		<!--End of col-md-10-->
    </div>
    <!--End of container--> 
  
  <br>
  <br>
  <br>

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