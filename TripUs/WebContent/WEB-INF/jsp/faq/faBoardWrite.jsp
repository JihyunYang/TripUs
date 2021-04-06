<%--
FileName (파일명): faBoardWrite.jsp
Explanation (설명): FAQ Insert Page
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

<!--textarea br set-->
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
		
	<title>FAQ Write Page</title>
		
    <link href="/img/tripFavicons.png" rel="icon" />
		
	<!--FAQ header bootstrap and css START-->
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
	<!--FAQ header bootstrap and css END-->

	<!--Side navigation bootstrap and css START-->
	<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
	<script src="/js/jquery-1.12.3.min.js"></script>
         
    <!--Include all compiled plugins (below), or include individual files as needed-->
	<script src="/js/bootstrap.min.js"></script>
		
    <!--FAQ Bootstrap-->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<!--Side navigation bootstrap and css END-->
		
	<!--Basic form bootstrap and css START-->
	<!--Include libraries(jQuery, bootstrap)-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!--Basic form bootstrap and css END-->
	
	<!--faBoardWrite style group-->	
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
			
		.faRequired {
			color: #088deb;
		}
			
		.faSpan {
			float: right;
			margin: 10px 0px 0px 5px;
	    	font-weight: bold;
		}
			
		.faTbleOne {
			border-collapse: separate;
		 	border-spacing: 3px 2px;
		 	border-top: 1px solid #ddd;
		 	border-right: 1px solid #ddd;
		 	border-left: 1px solid #ddd;
		}
			
		.faTblOneTh {
			width: 6%;
			font-weight: bold;
		 	border: 1px solid #ddd; 
			font-size: 16px;
			color: #747070;
			background: #e9f2fa;
		}
			
		.faTblOneTd {
			width: 20%;
			color: #747070;
		}
			
		#faNo, #faId, #faType {
			width: 30%;
		}
			
		.textBytesSpan {
			float: right;
		}
		
		.col-sm-2 {
			margin-left: -23px;
		}
			
		#row {
			margin-left: 57px;
			margin-bottom: 2%;
    		margin-top: 3%;
    		color: #0b3a61;
		}
		 
		.col-sm-9 {
			margin-left: 9%;
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
			background: #f0f0f0; 
			left: 0px; 
			bottom: -200px; 
			height: 60px; 
			width: 100%; 
		}
			
		#footer .copyright p, #footer .copyright p span a, #footer .designer p, #footer .designer a  {
    		font-size: 16px;
    		color: #726565;
    		font-family: 'Open Sans', sans-serif;
    		padding-left: 3px;
		}
	</style>
		
	<script type="text/javascript">
		$(document).ready(function(){
			/* Button mode that changes in Situation Start*/
			var faMode = '${faMode}';
			console.log('faBoardWrite.jsp faMode value confirm >>> : ' + faMode);
				
			if(faMode == 'faInsert') {
				document.getElementById('faInsertButton').style.display='block';
				document.getElementById('faUpdateButton').style.display='none';
				document.getElementById('faDeleteButton').style.display='none';
				document.getElementById('faBackListButton').style.display='block';
				$('#faTitle').focus();
			} else if(faMode == 'faUpdate') {
				document.getElementById('faUpdateButton').style.display='block';
				document.getElementById('faDeleteButton').style.display='none';
				document.getElementById('faInsertButton').style.display='none';
				document.getElementById('faBackListButton').style.display='block';
				$('#faTitle').focus();
			} else if(faMode == 'faDelete'){
				document.getElementById('faUpdateButton').style.display='none';
				document.getElementById('faDeleteButton').style.display='block';
				document.getElementById('faInsertButton').style.display='none';
				document.getElementById('faBackListButton').style.display='block';
			};
			/* Button mode that changes in Situation End*/
				
			/* fixing textbytes value for update */
			if($('#faContent').val() != '' || $('#faContent').val() != null ) {
				faCutText($('#faContent'))
			}
				
			/* check the number of characters in the textarea Start */
			$('#faContent').keyup(function() {
				faCutText(this);
				console.log(this);
			});
				
			//check the number of characters in the korean
			function faGetTextLength(faText) {
				var faLen = 0;
					
				for (var i = 0; i < faText.length; i++) {
					if(escape(faText.charAt(i)).length == 6) {
						faLen++;
					}
					faLen++
				}
				return faLen;
			};
				
			//500 characters setting
			function faCutText(faTextValue) {
				var faTextVal = $(faTextValue).val();
				var faTextLen = faTextVal.length;
					
				while(faGetTextLength(faTextVal) > 1000) {
					faTextLen--;
					faTextVal = faTextVal.substring(0, faTextLen);
				}
				$(faTextValue).val(faTextVal);
				$('.textBytes').text(faGetTextLength(faTextVal));
			};
			/* check the number of characters in the textarea End */
				
			/* setting to fix the selected value */
			if($('#faTypeHidden').val() != "") {
				$('#faType option[value = ' + $('#faTypeHidden').val() + ' ] ').attr('selected', 'selected');
			};
				
			/* validation action on inputBox click Start */
			$('#faTitle').blur(function(){
				if($('#faTitle').val() == '') {
					$('#faWriteFaTitleCheck').text('문의 제목을 입력해주세요.');
					$('#faWriteFaTitleCheck').css('color', 'red');
					return false;
					 document.getElementById("faTitle").focus();   
				} else if($('#faTitle').val().length > 50) {
					$('#faWriteFaTitleCheck').text('문의 제목을 50자 이내로 입력해주세요.');
					$('#faWriteFaTitleCheck').css('color', 'red');
					return false;
					 document.getElementById("faTitle").focus();  
				} else if(!$('#faTitle').val() =='' || $('#faTitle').val().length < 50) {
					$('#faWriteFaTitleCheck').text("");
					return true;	
				}
			});
			/* validation action on inputBox click End */
				
			/* validation action on textareaBox click Start */
			$('#faContent').blur(function(){
				if($('#faContent').val() == '') {
					$('#faWriteFaContentCheck').text('문의 내용을 입력해주세요.');
					$('#faWriteFaContentCheck').css('color', 'red');
					return false;
				} else {
					$('#faWriteFaContentCheck').text('');
					return true;
				}
			});
			/* validation action on textareaBox click End */
				
			/*Push Button group Start*/
			$('#faInsertButton').click(function() {
				if(!faValidation()) return; 
					if($('#faNo').val() == '') {
				  	} if(confirm(' 게시물 등록을 계속 진행하시겠습니까? ')) {
					 	 $('#faWriteForm').attr('action', '/faq/faBoardInsert.fq'); 
					  	 $('#faWriteForm').submit();
				      } else {
				    return false;
				}
			});
				
			$('#faUpdateButton').click(function() { 
				if(!faValidation()) return; 
					if(confirm(' 게시물 수정을 계속 진행하시겠습니까? ')) {
						$('#faWriteForm').attr('action', '/faq/faBoardUpdate.fq'); 
						$('#faWriteForm').submit();
					} else {
					return false;
				}
			});
				
			$('#faDeleteButton').click(function() { 
				if(confirm(' 게시물 삭제를 계속 진행하시겠습니까? ')) {
					$('#faWriteForm').attr('action', '/faq/faBoardDelete.fq'); 
					$('#faWriteForm').submit();
				} else {
					return false;
				}
			});
				
			$('#faBackListButton').click(function() {
				if(confirm(' 게시물 목록으로 되돌아가시겠습니까? ')) {
					$('#faWriteForm').attr('action', '/faq/faBoardList.fq'); 
					$('#faWriteForm').submit();
				} else {
					return false;
				}
			});
			/*Push Button group End*/
				
			/* validation action on insertButton click Start */
			function faValidation() {
				var faChk = true;
					
				if($('#faTitle').val() == '') {
					$('#faWriteFaTitleCheck').text('문의 제목을 입력해주세요.');
					$('#faWriteFaTitleCheck').css('color', 'red');
					faChk = false;
					document.getElementById('faTitle').focus();   
					return  faChk;
				} 
					
				if($('#faTitle').val().length > 50) {
					$('#faWriteFaTitleCheck').text('문의 제목을 50자 이내로 입력해주세요.');
					$('#faWriteFaTitleCheck').css('color', 'red');
					faChk = false;
					document.getElementById('faTitle').focus();   
					return  faChk;
				}
					
				if(!$('#faTitle').val() =='' || $('#faTitle').val().length < 50) {
					$('#faWriteFaTitleCheck').text("");
					faChk = true;
				}
				
				if($('#faContent').val() == '') {
					$('#faWriteFaContentCheck').text('문의 내용을 입력해주세요.');
					$('#faWriteFaContentCheck').css('color', 'red');
					faChk = false;
					document.getElementById('faContent').focus();   
					return  faChk;
				}
					
				if(!$('#faContent').val() == ''){
					faChk = true;
				}
				return  faChk;
			}
		});
		/* validation action on insertButton click End */
	</script>
</head>
	
<body>
	<% System.out.println("faBoardWritet.jsp SUCCESS >>> : "); %>
	<%-- <p>${FaVo}</p> --%>
	
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
		
   	<div class='container'>
   		<div class="row" >
   			<h1 id="row">FAQ
	 			<small style="font-size:17px; padding-left: 166px;">FAQ를 이용해 보다 빠르게 문의사항을 해결하실 수 있습니다.</small>
			</h1>
		</div>
		 	
		<br>
			
		<div role="tabpanel">
        	<div class="col-sm-2">
                <ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
                	<li role="presentation" class="brand-nav">
                    	<a href="/notice/ntBoardList.nt" >공지사항</a>
                    </li>
                    	
                    <li role="presentation" class="brand-nav">
                    	<a href="/qna/qaBoardList.qa" >1:1문의하기</a>
                    </li>
                    	
                    <li role="presentation" class="brand-nav  active">
                    	<a href="/faq/faBoardList.fq">FAQ</a>
                    </li>
                </ul>
            </div>
	
			<div class="col-sm-9">
				<%--Start WriteForm--%>
				<form id='faWriteForm' method='post'>
				<input type='hidden' id='sessionIdHidden' value='${sessionScope.mid}'/>
					<table class='faTbleOne'>
						<tr>
							<th class='faTblOneTh'>
								<span class='faRequired'>&nbsp; *</span> &nbsp;&nbsp; NO
							</th>
										
							<td class='faTblOneTd'>
								<input type='text' class='form-control' id='faNo'  name='fano' value='${FaVo.fano}' readonly='readonly' />
							</td>
						</tr>
							
						<tr>
							<th class='faTblOneTh'>
								<span class='faRequired'>&nbsp; *</span>  &nbsp;&nbsp; 작성자
							</th>
								
							<td class='faTblOneTd'>
								<input type='text' class='form-control' id='faId' name='faid' value='${sessionScope.mid}' readonly='readonly' />
							</td>
						</tr>
							
						<tr>
							<th class='faTblOneTh'>
								<span class='faRequired'>&nbsp; *</span>  &nbsp;&nbsp; 문의 유형 분류
							</th>
									
							<td class='faTblOneTd'>
								<input type='hidden' id='faTypeHidden' value='${FaVo.fatype}'/>
									<select class='form-control' id='faType' name='fatype'>
							  			<option value='전체문의'selected>전체 문의</option>
							  			<option value='여행지문의'>여행지 문의</option>
							  			<option value='코스문의'>코스 문의</option>
							  			<option value='축제문의'>축제 문의</option>
							  			<option value='맛집문의'>맛집 문의</option>
							  			<option value='공지사항문의'>공지사항 문의</option>
									</select>
							</td>
						</tr>	
							
						<tr>
							<th class='faTblOneTh'>
								<span class='faRequired'>&nbsp; *</span>  &nbsp;&nbsp; 문의 제목
							</th>
								
							<td class='faTblOneTd'>
								<input type='text' class='form-control' id='faTitle' name='fatitle' value='${FaVo.fatitle}' />
								<div class='faWriteCheckFont' id='faWriteFaTitleCheck' ></div>
							</td>
						</tr>
							
						<tr>
							<th class='faTblOneTh'>
								<span class='faRequired'>&nbsp; * </span>  &nbsp;&nbsp; 문의 내용
							</th>
									
							<td class='faTblOneTd'>
								<span class='textBytesSpan'>
									<span class='textBytes'>0</span> bytes
								</span>
								<textarea class='form-control' id='faContent' name='facontent' rows='15'>${fn:replace(FaVo.facontent, br, cn)}</textarea>
								<div class='faWriteCheckFont' id='faWriteFaContentCheck'></div>
							</td>
						</tr>
						
						<tr>
							<th class='faTblOneTh'>
								<span class='faRequired'>&nbsp;&nbsp;</span>  &nbsp;&nbsp; 참고 사이트 주소
							</th>
								
							<td class='faTblOneTd'>
								<input type='text' class='form-control' id='faAddSite' name=faaddsite value='${FaVo.faaddsite}' />
							</td>
						</tr>
					</table>
				</form>
				<%--End WriteForm--%>
			
				<!--Push Button-->
				<span class='faSpan'><input type='button' class='form-control' id='faBackListButton' value='목록' /></span>
				<span class='faSpan'><input type='button' class='form-control' id='faDeleteButton' value='삭제' /></span>
				<span class='faSpan'><input type='button' class='form-control' id='faUpdateButton' value='수정' /></span>
				<span class='faSpan'><input type='button' class='form-control' id='faInsertButton' value='등록' /></span>
			</div>
		</div>
	</div>
		
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
	<script src="/js/isotope/scripts.js"></script>
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/js/bootstrap.min.js"></script>
	
	<!-- Custom JavaScript-->
	<script src="/js/main.js"></script>
</body>
</html>