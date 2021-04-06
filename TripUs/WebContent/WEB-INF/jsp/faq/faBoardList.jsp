<%--
FileName (파일명): faBoardList.jsp
Explanation (설명): FAQ Main Page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		
	<title>FAQ Main Page</title>
		
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
    <link href="/css/responsive.css" rel="stylesheet">
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
		
	<!--faBoardList style group-->
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
   			
	    body { 
	        font-family: Arial, Helvetica, Sans-Serif; 
            height: 100%;
	   	}
	        
	   	#faBoardList { 
	   		width: 100%;
	    }
	        
	   	#faBoardList ul { 
	    	margin: 10px 0 10px 40px; 
	        padding: 0px;
	    }
	        
	    #faBoardList th { 
	        background: #9ECFFF repeat-x scroll center left; 
	        color: black;
	        padding: 7px 15px; 
	        text-align: left;
	   	}
	       
	    #faBoardList td { 
	        background: #ecf3f8 none repeat-x scroll center left; 
	        color: #454343; 
	        padding: 7px 15px;
	        border-bottom: 1px solid #ddd;
	    }
	        
	   	#faBoardList tr.odd td { 
	        background: #fff repeat-x scroll center left; 
	        cursor: pointer;
		}
			
	    #faBoardList div.up { 
	        background-position: 0px 0px;
	    }
	        
	    #faBoardButton {
			width: 10%;
			text-align: right;
			margin-bottom: 5%;
		} 
			
		#faSearchButtonOne {
			width: 10%;
			text-align: left;
		}
			
		.faSearchSelectDiv {
			float: left;
			margin-right: 1%;
		}
			
		.fqInputGroup {
			height: 30px;
			width: 190px;
			border: 1px solid #ddd;
			background: #ffffff;
			float: left;
		}
			
		.faInput {
			font-size: 11px;
			width: 120px;
			padding: 5px;
			border: 0px;
			outline: none;
			float: left;
		}
			
		.fqButton {
			width: 50px;
			height: 100%;
			border: 0px;
			float: right;
			background:  #9ECFFF;
		}
			
		#faSearchCondition {
			height: 30px;
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
    		
    	#paging {
    		margin-top: 3%;
    		margin-left: 11%;
    	}
    		
    	.faDetail {
    		color: #D52D09;
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
    		width:100%;
			height:60px;
			background: #f0f0f0; 
			bottom: -100px; 
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
			/* setting for jquery Arcordian*/
			$('#faBoardList tr:odd').addClass('odd');
           	$('#faBoardList tr:not(.odd)').hide();
           	$('#faBoardList tr:first-child').show();
            
           	$('#faBoardList tr.odd').click(function() {
               	$(this).next('tr').toggle();
               	$(this).find('.arrow').toggleClass('up');
           	});
            	
           	$(function() {
    			/* Searching <select> option value fix*/
    			if( $('#faSelectHidden').val() != '') {
    				$('#faSearchCondition option[value='+ $('#faSelectHidden').val() +']').attr('selected', true);
    			}
       		});
    	
			/*Push Button group Start*/
	  		$('#faInsertButton').click(function() {
	  			if(confirm('게시물 작성을 진행하시겠습니까?')) {
		  			$('#faNo').val("");
		  			$('#faboardListForm').attr('action', '/faq/faBoardSelect.fq');
					$('#faboardListForm').submit();
	  			} else {
	  				return false;
	  			}
	  	 	});
				
	  		$('#faAllListButton').click(function() {
	  			if(confirm('전체리스트 보기를 진행하시겠습니까?')) {
		  			$('#faNo').val('');
		  			$('#faboardListForm').attr('action', '/faq/faBoardList.fq');
					$('#faboardListForm').submit();
	  			} else {
	  				return false;
	  			}
	  		 });
		});	

		function faUpdateButton(fano, faUpdate) {
			if(confirm('게시물 수정을 진행하시겠습니까?')) { 
		 		$('#faNo').val(fano);
		  		$('#faMode').val(faUpdate);
		  		$('#faboardListForm').attr('action', '/faq/faBoardSelect.fq');
				$('#faboardListForm').submit();
			} else {
				return false;
			}
		};
			
		function faDeleteButton(fano, faDelete) {
			if(confirm('게시물 삭제를 진행하시겠습니까?')) {
		  		$('#faNo').val(fano);
		  		$('#faMode').val(faDelete);
		  		$('#faboardListForm').attr('action', '/faq/faBoardSelect.fq');
				$('#faboardListForm').submit();
			} else {
				return false;
			}
		}; 
			
		function faSearchButtonOneForm() {
			if(confirm('검색을 진행하시겠습니까?')) {
		 		$('#faSearchCondition').val();
		  		$('#faSearchForm').attr('action', '/faq/faBoardList.fq');
				$('#faSearchForm').submit();
			} else {
				return false;
			}
		};
			
		/* $(function() {
			$('.pbutton').click(function() {
				$('[name=START_NUM]').val($(this).val());
				$('#faboardListForm').attr('action', '/faq/faBoardList.fq');
				$('#faboardListForm').submit();
			});
		}); */
			
		function goPage(num) {
			$("#page").val(num);
			$('#pageForm').attr('action', '/faq/faBoardList.fq');
			$('#pageForm').submit();		
		}
		/*Push Button group End*/
	</script>
</head>
	
<body>
	<% System.out.println("faBoardList.jsp SUCCESS >>> : "); %>
	
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
				<%--Start search--%>
				<div id='faButtonDiv'>
					<form id='faSearchForm' method='get'>
						<table>
							<tr>
								<td id='faSearchButtonOne'>
									<div class='faSearchSelectDiv'>
										<input type='hidden' id='faSelectHidden' value='${fasearchcondition}' />
										<select id='faSearchCondition' name='fasearchcondition'>
											<option value='all'>전체</option>
											<option value='faType'>문의종류</option>
											<option value='faTitle'>제목</option>
											<option value='faContent'>내용</option>
										</select>
									</div>
				
									<div class='fqInputGroup'>	
										<input type='text' class='faInput' id='faSearchKeyword' name='fasearchkeyword' placeholder='검색어를 입력하세요.' value='${fasearchkeyword}' />
							            <button type='button' class='fqButton' onclick='faSearchButtonOneForm()'>
					                		<i class='glyphicon glyphicon-search'></i>
					                 	</button>
						 			</div>
								</td>
							 
								<%--push button--%>
								<td id='faBoardButton'>
								
									<!--only admin use-->
									<c:if test='${sessionScope.mgrade=="1"}'>
										<input type='button' class='btn btn-default' id='faInsertButton' value='글쓰기' />
									</c:if>
									
									<input type='button' class='btn btn-default' id='faAllListButton' value='전체보기' />	
								</td>
							</tr>
						</table>
					</form>
				</div>
				<%--End search--%>
		
				<br>
					
				<%--Start List--%>
				<form id='faboardListForm' method='post'>
					<input type='hidden' id='faNo' name='fano' value='${FaqVo.fano}' />
					<input type='hidden' id='faMode' name='faMode' value='' />
							
					<table id='faBoardList' summary='FAQ게시판 리스트'>
						<thead>
							<tr>
								<th>NO</th>
								<th id='thType'>문의종류</th>
								<th id='thTitle'>제목</th>
							</tr> 
						</thead>
				
						<tbody>
							<!--Data information in list-->
							<c:set var='index' value='${index}' />
								<c:choose>
									<c:when test='${not empty faBoardLists}'>
										<c:forEach items='${faBoardLists}' var='row' >
											<tr>
												<td>
													<fmt:formatNumber value='${fn:replace(row.fano,"FA","")}' />
												</td>
												<td>${row.fatype}</td>
												<td align='left'>
													<span class='faDetail'>Q. ${row.fatitle}</span>
												</td>	
											</tr>
								
											<tr>
												<td colspan='4'>
													<p>${fn:replace(row.facontent, cn, br)}</p>
													<ul>
														<li style="text-align:left"> <a href='http://${row.faaddsite}' target='blank'>${row.faaddsite}</a></li>
													</ul>
										
													<span style='float:right'>
														<!--only admin use-->
														<c:if test='${sessionScope.mgrade=="1"}'>
															<input type='button' class='btn btn-default' class='faUpdateButton' value='수정' onclick='faUpdateButton("${row.fano}", "faUpdate")' />
															<input type='button' class='btn btn-default' class='faDeleteButton' value='삭제' onclick='faDeleteButton("${row.fano}", "faDelete")' />
														</c:if>
													</span>
								    			</td>			
											</tr>
										</c:forEach>
									</c:when>
								
								<c:otherwise>
									<tr>
										<td colspan='4' align='center'>등록된 게시물이 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
		    					</c:choose>
						</tbody>
					</table>
				</form>
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
						<li>
							<a onclick="goPage(${startPage})">  << </a>
						</li>
						<li>
							<a onclick="goPage(${pageVal-1})"> < </a>
						</li>
					
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