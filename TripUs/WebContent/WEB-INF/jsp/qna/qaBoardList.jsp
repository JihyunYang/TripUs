<%--
FileName (파일명): qaBoardList.jsp
Explanation (설명): Q&A Main Page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		
	<title>Q&A Main Page</title>
		
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
	<!--Q$A header bootstrap and css END-->
		
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
	<style>
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
			
		table, th, td {
  			border-top: 1px solid #e4e6e7;
   			border-bottom: 1px solid #e4e6e7;
  			height: 27px;
  			border-collapse: collapse;
  			text-align: center;
		}
			
		#qaBoardList {
			width: 100%;  
		}
			
		#qaBoardList th {
			background: #9ECFFF none repeat-x scroll center left;
		}
			
		.qaDeleteButton, .qaInsertButtonOne, .qaInsertButtonOneone,
		.qaMySerchButton, .qaAllSerchButton {
   			float: right;
   			color: black;
		}
			
		#qaSearchSelectDiv {
			float : left;
			margin-right: 1%;
		}
			
		#qaSearchCondition {
			width: 80px; 
			height: 30px;
		}
			
		.qaInputGroup {
			height: 30px;
			width: 190px;
			border: 1px solid #ddd;
			background: #ffffff;
			float: left;
		}
			
		.qaInput {
			font-size: 11px;
			width: 120px;
			padding: 5px;
			border: 0px;
			outline: none;
			float: left;
		}
			
		.qaButton {
			width: 50px;
			height: 100%;
			border: 0px;
			float: right;
			background:  #9ECFFF;
		}
			
		#qaDetailForm {
			color: black; 
			text-decoration: none;
			text-align: left;
		}	
			
		.qaReImg {
			width: 16px;
		}
			
		.qaReColor {
			color: #ddd;
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
			
		#paging {
    		margin-top: 3%;
    		margin-left: 11%;
    	}
			
		#footer {
			position:absolute;
			width: 100%;
			height: 60px;
			background: #f0f0f0; 
			bottom: -30px; 	
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
			if($('#qaSearchSelectHidden').val() != ''){
   				$('#qaSearchCondition option[value = ' + $('#qaSearchSelectHidden').val() + ']').attr('selected',true);
   			}
		});
		
		/*Push Button group Start*/
		function qaSearchForm() {
			if(confirm('검색을 진행하시겠습니까?')) {
				$("#page").val(1);
				$('#qaSearchCondition').val();
				$('#qaSearchForm').attr('action', '/qna/qaBoardList.qa');
				$('#qaSearchForm').submit();
			} else {
				return false;
			}
		};
				
		function qaInsertForm(mgrade) {
			if(mgrade=="1" ||mgrade=="2"||mgrade=="3") {
				if(confirm('1:1문의 게시물 작성을 진행하시겠습니까?')) {
					$('#qaNo').val('');
			  		$('#qaListform').attr('action', '/qna/qaBoardSelect.qa');
					$('#qaListform').submit();
				} else {
					return false;
				}
			} else {
				if(confirm('로그인을 하신 회원만 이용가능합니다. 로그인하시겠습니까?')) {
					location.href = "/login/loginPage.do";
				} else {
					return false;
				}
			}				
		};
			
		function qaMySerchForm(qaid) {
			if(qaid != '') {
				if(confirm('내가 작성한 문의 게시물을 보시겠습니까?')) {
					$('#qaNo').val('');
					$('#qaId').val(qaid);
			  		$('#qaListform').attr('action', '/qna/qaBoardList.qa');
					$('#qaListform').submit();
				} else {
					return false;
				}
			} else {
				if(confirm('로그인을 하신 회원만 이용가능합니다. 로그인하시겠습니까?')) {
					location.href = "/login/loginPage.do";
				} else {
					return false;
				}
			}
		};
			
		function qaAllSerchForm() {
			if(confirm('게시물 전체 리스트를 보시겠습니까?')) {
				location.href = '/qna/qaBoardList.qa';
			} else {
				return false;
			}
		};
			
		function qaDetailForm(qano) {
			if(confirm('게시물 상세페이지로  이동하시겠습니까?')) { 
				$('#qaNo').val(qano);
		  		$('#qaListform').attr('action','/qna/qaBoardDetail.qa'); 
				$('#qaListform').submit();
			} else {
				return false;
			}
		};
			
		function goPage(num) {
			$("#page").val(num);
			$('#pageForm').attr('action', '/qna/qaBoardList.qa');
			$('#pageForm').submit();			
		}
		/*Push Button group End*/
	</script>
</head>

<body>
	<% System.out.println("qaBoardList.jsp SUCCESS >>> : "); %>
		
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
											<button type="button" class="btn btn-default btn-sm" id="signupBtn">로그인</button>
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
		
	<div class="container">
		<div class="row" >
			<h1 id="row">1:1문의
	 			<small style="font-size:17px; padding-left: 141px;">관리자에게 1:1문의를 하는 공간입니다.</small>
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
				<%--Start search--%>
      			<form id='qaSearchForm' method='get'>
					<input type='hidden' id='qaSearchSelectHidden' value='${qasearchcondition}' />
        			<div id='qaSearchSelectDiv'>
			            <select id='qaSearchCondition' name='qasearchcondition' >
			            	<option value='all' selected>전체</option>
			               	<option value='qaType'>문의종류</option>
			               	<option value='qaTitle'>제목</option>
			               	<option value='qaId'>작성자</option>
			            </select>
		         	</div>
         	   
           			<div class='qaInputGroup'>
            			<input class='qaInput' type='text' name='qasearchkeyword' placeholder='검색어를 입력하세요.' value='${qasearchkeyword}' />	
               			<button class='qaButton' type='button' onclick='qaSearchForm()'>
                			<i class='glyphicon glyphicon-search'></i>
                 		</button>
         			</div>
      			</form>
      			<%--End search--%>
      
      			<%--push button--%>
				<span class='qaInsertButtonOne'>
					<button onclick='qaInsertForm("${sessionScope.mgrade}")' class='btn btn-default' >
						<span class='qaInsertButtonOneone'>문의하기</span>
					</button>
						
					<button onclick='qaMySerchForm("${sessionScope.mid}")' class='btn btn-default'>
						<span class='qaMySerchButton'>내문의보기</span>
					</button>
						
					<button onclick='qaAllSerchForm()' class='btn btn-default' >
						<span class='qaAllSerchButton'>전체문의보기</span>
					</button>
				</span>

			    <br>
			    <br>
			    <br>
      
      			<%--Start List--%>
				<form id='qaListform' name='qaListform' method="post">
					<input type='hidden' id='qaNo' name='qano' value='${QaBoardVo.qano}' />
					<input type='hidden' id='qaId' name='qaid' value='' />
						
					<table id='qaBoardList' summary='QnA 게시판 리스트'>
				      	<colgroup>
					    	<col width='7%' />
					      	<col width='15%' />
					      	<col width='15%' />
					      	<col width='40%' />
				      	</colgroup>
	      	
				      	<thead>
				        	<tr>
				            	<th>NO</th>
				            	<th>문의종류</th>
				            	<th>답변상태</th>
				            	<th>제목</th>
				            	<th>작성자</th>
				            	<th>등록일</th>
				         	</tr>
				      	</thead>
	      	
	      				<tbody> 
	      					<!--Data information in list-->
	      					<c:choose> 
	      						<c:when test='${not empty qaBoardList}'>
	      							<c:forEach var='qalist' items='${qaBoardList}'>
	            						<tr>
		            						<c:choose>
			            						<c:when test='${qalist.qastep == 0}'>
			            							<!--Save qano, qaid value of parent post-->
			            							<c:set var='qanoset' value='${qalist.qano}'/>
			            							<c:set var='qaidset' value='${qalist.qaid}'/>
			            									
							               			<td><fmt:formatNumber value='${fn:replace(qalist.qano,"QA","")}' /></td>
							               			<td>${qalist.qatype}</td>
							               			<td>${qalist.qaanswertype}</td>
							               			<td id='qaDetailForm' class='qaDetailForm'>
							               				<c:choose>
							               					<c:when test='${sessionScope.mid==qalist.qaid || sessionScope.mgrade == "1" || qalist.qasecretyn != "Y"}'>
							               						<span onclick='qaDetailForm("${qalist.qano}")'>
							               							${qalist.qatitle} 
							               						</span>
							               					</c:when>
							               							
							               					<c:otherwise>
							               						<span>
							               							<img class='qaReImg' src='/img/qaSecret.png' alt='tripUs'> 비밀글
							               						</span>
							               					</c:otherwise>
							               				</c:choose>
							               			</td>	
				               					</c:when>
				               				
				               					<c:otherwise>
							               			<td><fmt:formatNumber value='${fn:replace(qalist.qano,"QA","")}' /></td>
							               			<td>${qalist.qatype}</td>
							               			<td>${qalist.qaanswertype}</td>
													<td id='qaDetailForm' class='qaDetailForm'>	
														<!--set of secret-->
														<c:if test='${qalist.qasecretyn == "Y"}'>
															<c:choose>
																<c:when test='${(qaidset == sessionScope.mid && qanoset == qalist.qaref) || sessionScope.mgrade == "1"}'>
																	<!--You can view the post only if the administrator or 
																		session ID is the same as the creator of the parent post.-->
																	&nbsp;&nbsp;&nbsp;
																	<span class='qeRe' onclick='qaDetailForm("${qalist.qano}")'>
																		<img class='qaReImg' src='/img/qaReListImg.gif' alt='tripUs'/>
																		<span class='qeReColor'> [re] </span> ${qalist.qatitle}
																	</span>
																</c:when>
																
																<c:otherwise>
																	<!--Set up non-login users or You can view the post only if the administrator or 
																		session ID is the same as the creator of the parent post-->
																	<span class='qeRe'>
																		<img class='qaReImg' src='/img/qaReListImg.gif' alt='tripUs'>
																		<span class='qeReColor'> [re] </span>
																		<img class='qaReImg' src='/img/qaSecret.png' alt='tripUs'> 비밀글
																	</span>
																</c:otherwise>
															</c:choose>
														</c:if>
															
														<!--Non-secret setting-->
														<c:if test='${qalist.qasecretyn != "Y"}'>
															&nbsp;&nbsp;&nbsp;
															<span class='qeRe' onclick='qaDetailForm("${qalist.qano}")'>
																<img class='qaReImg' src='/img/qaReListImg.gif' alt='tripUs'/>
																<span class='qeReColor'> [re] </span> ${qalist.qatitle}
															</span>
														</c:if>
							               			</td>
				               					</c:otherwise>
				               				</c:choose>
				               						
						               		<td>${qalist.qaid}</td>
						               		<td>${qalist.qainsertdate}</td>
	            						</tr>
	         						</c:forEach>
	      						</c:when>
	        				
	         					<c:otherwise>
									<tr>
										<td colspan='6' align='center'>등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
	      				</tbody>   
					</table>
				</form>
	  			<%--End List--%>
   			</div>
   		</div>
   	</div>
   		
   	<center>
		<div id="paging" class="text-center">
			<form id="pageForm" >
				<input type="hidden" id="page" name="pageno" value=''/>
			</form>	
				
			<c:if test="${not empty page}">
				<c:set var="pageVal" value="${page}"/>
					
				<ul class="pagination">
					<li><a onclick="goPage(${startPage})"> << </a></li>
					<li><a onclick="goPage(${pageVal-1})"> < </a></li>
					
					<%
						String startPageStr = String.valueOf(request.getAttribute("startPage"));
						System.out.println("startPageStr: "+startPageStr);
						int startPage = Integer.valueOf(startPageStr);
							
						String endPageStr = String.valueOf(request.getAttribute("endPage"));
						System.out.println("endPageStr: "+endPageStr);
						int endPage = Integer.valueOf(endPageStr);
							
						String totalPageStr = String.valueOf(request.getAttribute("totalPage"));
						System.out.println("totalPageStr: "+totalPageStr);
						int totalPage = Integer.valueOf(totalPageStr);
						int cnt1 = 0;
						
						for(int cnt = startPage; cnt<=totalPage; cnt++){	
					%>
						<li><a onclick="goPage(<%=cnt%>)" class="pageNo"><%=cnt%></a></li>
					<% 
								
							if(cnt1 >=10){
								break;
							}
							cnt1++;
							System.out.println("cnt1: "+cnt1);
						}
							
					%>
					<c:if test="${pageVal < totalPage}">
						<li><a onclick="goPage(${pageVal+1})"> > </a></li>
					</c:if>
						<li><a onclick="goPage(${endPage})"> >> </a></li>
				</ul>
			</c:if>
		</div>
	</center>
		
	<br>
	<br>
	<br>
	<br>
	<br>
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
	<script src="/js/isotope/scripts.js"></script>
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/js/bootstrap.min.js"></script>
		
	<!--Custom JavaScript-->
	<script src="/js/main.js"></script>
</body>
</html>