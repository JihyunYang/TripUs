<%--
FileName (파일명): qaBoardDetail.jsp
Explanation (설명): Q&A Detail Page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("UTF-8");%>

<%! String mid=""; %>
<%! String mname=""; %>
<%! String memail=""; %>
<%! String mgrade=""; %>
<%! HttpSession hs=null; %>

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
		
	<title>Q&A Detail Page</title>
		
	<link href="/img/tripFavicons.png" rel="icon" />
		
	<!--Q&A header bootstrap and css START-->
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
	<!--Q&A header bootstrap and css END-->
		
	<!--Side navigation bootstrap and css START-->
	<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
	<script src="/js/jquery-1.12.3.min.js"></script>
         
    <!--Include all compiled plugins (below), or include individual files as needed-->
	<script src="/js/bootstrap.min.js"></script>
		
    <!--QnA Bootstrap-->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<!--Side navigation bootstrap and css END-->
		
	<!--Basic form bootstrap and css START-->
	<!--Include libraries(jQuery, bootstrap)-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!--Basic form bootstrap and css END-->

	<!--qaBoardList style group-->
	<style type="text/css">
		@media (min-width: 1200px){
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
	        font-family: Arial, Helvetica, Sans-Serif;
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
   		
   		.nav>li>a:focus, .nav>li>a:hover {
    		text-decoration: none;
   			color: #9ECFFF;
   			background-color: transparent;
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
			
		.qaUpdateDivButton {
			float: right;
			margin-right: 3px;
		}
			
		.qaTbl {
			border-collapse: separate;
		 	border-spacing: 3px 2px;
		 	border: 1px solid #ddd;
		}
			
		.qaTbleDetailReply {
			border-collapse: separate;
		 	border-spacing: 3px 2px;
		 	border: 1px solid #ddd;
		}
			
		.qaTbl .qaTd {
			width: 1%;
			text-align: center;
			font-weight: bold;
		 	border: 1px solid #ddd; 
			font-size: 16px;
			color: #747070;
			background: #e9f2fa;
		}
			
		.qafile {
			width: 2%;
			text-align: center;
			font-weight: bold;
		 	border: 1px solid #ddd; 
			font-size: 16px;
			color: #747070;
		}
			
		.TdDetailReply {
			font-weight: bold;
			font-size: 16px;
			color: #747070;
			width: 32%;
    		text-align: center;
    		border: 1px solid #ddd;
   			background: #e9f2fa; 
   			margin-right: 2%;
		}
			
		.secretText {
			padding-left: 1%;
			text-align: right;
			font-weight: bold;
			color: #747070;
		}
			
		#qaNo, #qaId, #qaType, #qaAnsertType {
			width: 30%;
		}
			
		textarea {
			width: 100%;
			height: 100%;
		}
				
		.form-control[readonly], .form-control[disabled] {
			background-color: white;
			opacity: 1;
		}
			
		#qaTitleSecret {
			width: 80%;
			display: inline;
		}
			
		.qafile {
			border-bottom: 1px solid #ddd; 	
		}
			
		.qaReImg {
			vertical-align: middle;
			width: 200px;
			height: 150px;
		}
			
		.qaImg{
			vertical-align: middle;
    		width: 60px;
    		height: 60px;
    	}
		
		.col-sm-2 {
			margin-left: -23px;
		}
		
		#row {
			margin-left: 29px;
			margin-bottom: 2%;
    		margin-top: 3%;
    		color: #0b3a61;
		}
			
		.col-sm-9 {
			margin-left: 9%;
		}
			
		#topHr {
			width: 73%;
    		margin-left: 23%;
		}
			
		.nav-pills>li.active>a, .nav-pills>li.active>a:focus, 
		.nav-pills>li.active>a:hover {
	    	color: #0b3a61;
	    	background-color: #9ECFFF;
	    	font-weight: bold;
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
			position: absolute;
			width: 100%;
			height: 60px; 
			background: #f0f0f0;  
			bottom: -270px; 
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
			/* Secret box check value fix*/
			if($('#qasecretyn').val() == 'Y') {
				$('#qasecretyn1').attr('checked', true);
				$('#qasecretyn1').attr('disabled', true);
			} else if($('#qasecretyn').val() == 'N') {
				$('#qasecretyn1').attr('checked', false);
				$('#qasecretyn1').attr('disabled', true);
			}
		});
	
		/*Push Button group Start*/
		function qaBoardUpdateButton(qano) {
			if(confirm('게시물 수정을 진행하시겠습니까?')) { 
	 			$('#qaNo').val(qano);
		  		$('#qaBoardDetailForm').attr('action', '/qna/qaBoardSelect.qa');
				$('#qaBoardDetailForm').submit();
			} else {
				return false;
			}
		} 
				
		function qaBoardListButton() {
			if(confirm('게시물 목록으로 되돌아가시겠습니까?')) {
				$('#qaReplyForm').attr('action', '/qna/qaBoardList.qa');
				$('#qaReplyForm').submit();
			} else {
				return false;
			}
		} 
	
		function qaRePlyInsertButton(qano){
			if(confirm('게시물에 대한 답변 등록을  진행하시겠습니까?')) {
				$('#qaNoOne').val(qano);
				$('#qaReplyContent').val('');
				$('#qaReplyForm').attr('action', '/qna/qaBoardReplySelect.qa');
				$('#qaReplyForm').submit();
			} else {
				return false;
			}
		}
			   
		function qaRePlyUpdateButton(qano) {
			if(confirm('게시물에 대한 답변 수정을  진행하시겠습니까?')) {
				$('#qaNoOne').val(qano);
				$('#qaReplyForm').attr('action', '/qna/qaBoardReplySelect.qa');
				$('#qaReplyForm').submit();
			} else {
				return false;
			}
		}
			   
		function qaRePlyDeleteButton(qano) {
			if(confirm('게시물 삭제를 진행하시겠습니까?')) {
				$('#qaNoOne').val(qano);
				$('#qaReplyForm').attr('action', '/qna/qaBoardDelete.qa');
				$('#qaReplyForm').submit();
			} else {
				return false;
			}
		}
		/*Push Button group End*/
	</script>
</head>
	
<body>
	<% System.out.println("qaBoardDetail.jsp 진입 성공 >>> : "); %>
	<%-- <p>${qaBoardDetail}</p> --%>
		
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
					<!--Brand and toggle get grouped for better mobile display-->
						
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
		
	<div class="container">
		<div class="row" >
	 		<h1 id="row">1:1문의
	 			<small style="font-size:17px; padding-left: 142px;">관리자에게 1:1문의를 하는 공간입니다.</small>
	 		</h1>
		</div>
		 	
		 <br>
			
		<div role="tabpanel">
            <div class="col-sm-2">
               	<ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                	<li role="presentation" class="brand-nav">
                    	<a href="/notice/ntBoardList.nt" >공지사항</a>
                    </li>
                    	
                    <li role="presentation" class="brand-nav active">
                    	<a href="/qna/qaBoardList.qa" >1:1문의하기</a>
                    </li>
                    	
                    <li role="presentation" class="brand-nav">
                    	<a href="/faq/faBoardList.fq">FAQ</a>
                    </li>
                </ul>
            </div>
		
			<div class="col-sm-9">
				<%-- Start DetailForm --%>
				<form id='qaBoardDetailForm'>
	   				<input type='hidden'  id='qaNo' name='qano' value='${qaBoardDetail.qano}' />
	   			</form> 
     			
				<table class='qaTbl'>
					<tr> 
						<td class='qaTd'>문의번호</td>
						<td> 
							<input type='text' class='form-control' id='qaNo' readonly='readonly' value='${qaBoardDetail.qano}' />
						</td>
					</tr>
					
					<tr>
						<td class='qaTd'>작성자</td>
						<td> 
							<input type='text' class='form-control'  id='qaId' readonly='readonly' value='${qaBoardDetail.qaid}' />
						</td>
					</tr>
					
					<tr>
						<td class='qaTd'>문의유형</td> 
						<td> 
							<input type='text' class='form-control' id='qaType' readonly='readonly' value='${qaBoardDetail.qatype}' />
						</td>
					</tr>
				
					<tr>
						<td class='qaTd'>답변상태</td> 
						<td> 
							<input type='text' class='form-control'  id='qaAnsertType' readonly='readonly' value='${qaBoardDetail.qaanswertype}' />
						</td>
					</tr>
					
					<tr> 
						<td class='qaTd'>등록일</td>
						<td> 
							<input type='text' class='form-control' readonly='readonly' value='${qaBoardDetail.qainsertdate}'>
						</td>
					</tr>
							
					<tr>
						<td class='qaTd'>문의제목</td>
						<td>
							<input type='hidden' id='qasecretyn' name='qasecretyn' value='${qaBoardDetail.qasecretyn}'>
							<span>
								<input type='text' class='form-control' readonly='readonly' value='${qaBoardDetail.qatitle}' id='qaTitleSecret' />
							</span>
							<span class='secretText'>비밀글 
								<input type='checkbox' id='qasecretyn1' value='Y'>
							</span>
						</td>
					</tr>
					
					<tr>
						<td class='qaTd'>문의내용</td>
						<td> 
							<textarea class='form-control' readonly='readonly'  rows='5' >${qaBoardDetail.qacontent}</textarea>
						</td>
					</tr>
					
					<tr>
						<td class='qaTd'>첨부파일</td>
						<td colspan='2'  class='qafile' >
							<!--Usually name property have used to vo file , but MultipartFile property use different file name for collision avoid-->
							<c:if test="${qaBoardDetail.qaimage != null}">
								<a href='/fileupload/${qaBoardDetail.qaimage}' download><img  class="qaImg" src='/fileupload/${qaBoardDetail.qaimage}'  alt='사진없음' onError="this.src='/img/boardfile.png';"/></a>
								<p>${qaBoardDetail.qaimage}</p>
							</c:if>
							<input type='hidden' id='qaImage' name='qaimage' value='${QaBoardUpdate.qaimage}' />
						</td>
					</tr>
				</table>
				
   		 		<br>
   		 		
   		 		<!--Push Button-->
   		 		<c:if test='${qaBoardDetail.qastep == 0}'>
	   		 		<div class='qaUpdateDivButton'>
	   		 			<!--only admin use-->
	   		 			<c:if test='${sessionScope.mgrade=="1"}'>
		   		 			<span><button class='btn btn-default' onclick='qaRePlyInsertButton("${qaBoardDetail.qano}")'>답글등록</button></span>
						</c:if>
							
						<!--only authors use-->
						<c:if test='${sessionScope.mid==qaBoardDetail.qaid}'>
							<span><button class='btn btn-default' onclick='qaBoardUpdateButton("${qaBoardDetail.qano}")'>수정</button></span>
						</c:if>
						<span><button class='btn btn-default' onclick='qaBoardListButton()'> 목록 </button></span>
	     			</div>
     			</c:if>
     			<%--End DetailForm--%>
	     			
	     		<br>
	     		<hr>
     				
     			<div>
     				<%--Start DetailReplyForm--%>	
	         		<form id='qaReplyForm'>
	    		   		<input type='hidden'  id='qaNoOne' name='qano' value='${qaBoardDetail.qano}' />
		       			<c:choose>
		       				<c:when test='${qaBoardDetail.qastep == 0}'>
		       					<input type='hidden' id='qaReplyContent' name='qareplycontent' />
		       				</c:when>
		       				
		       				<c:otherwise>
		       					<table class='qaTbleDetailReply'>
		       						<tr>
		       							<td class='TdDetailReply'>답변</td>		       					
		       							<td>
		       								<textarea id='qaReplyContent' name='qareplycontent' readonly='readonly' rows='5' cols='100'>${qaBoardDetail.qareplycontent}</textarea>
		       							</td>
		       						</tr>
								</table>
								
								<!--Push Reply Button-->
		       					<div class='qaUpdateDivButton'>
		       						<!--only admin use-->
		       						<c:if test='${sessionScope.mgrade=="1"}'>
										<span><button class='btn btn-default' onclick='qaRePlyUpdateButton("${qaBoardDetail.qano}")'>답글수정</button></span>
										<span><button class='btn btn-default' onclick='qaRePlyDeleteButton("${qaBoardDetail.qano}")'>문의글 삭제</button></span>
									</c:if>
										<span><button class='btn btn-default' onclick='qaBoardListButton()'> 목록 </button></span>
								</div>
		       				</c:otherwise>
						</c:choose>
	       			</form>
       				<br>
       			</div>
     			<hr>
   				<%--End DetailReplyForm--%>
   			</div>
   		</div>
   	</div>
   		
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
	<script src="/js/isotope/scripts.js"></script>
	
	<!--Include all compiled plugins (below), or include individual files as needed-->
	<script src="/js/bootstrap.min.js"></script>
	
	<!--Custom JavaScript-->
	<script src="/js/main.js"></script>
</body>
</html>