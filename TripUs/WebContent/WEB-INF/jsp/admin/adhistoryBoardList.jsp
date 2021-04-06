<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
			
		<title> Admin Notice page </title>
		
		<!--Favicons-->
  		<link href="/admin/img/tripFavicons.png" rel="icon">

  		<!--Bootstrap core CSS-->
  		<link href="/admin/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
 		<!--external css-->
 		<!--for font-->
  		<link href="/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  		<!--for calendar-->
  		<link rel="stylesheet" type="text/css" href="/admin/css/zabuto_calendar.css">
  
  		<!--Custom styles for this template-->
  		<link href="/admin/css/style.css" rel="stylesheet">
  		<link href="/admin/css/style-responsive.css" rel="stylesheet">
  		<script src="/admin/lib/chart-master/Chart.js"></script>
  		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
	
		<!--ntBoardList style group-->
		<style>
			.containerOne {
					padding-left: 15%;
					padding-top: 5%;
			   		width: 100%;
			    	margin-bottom: -20px;
			}
		
			body { 
                font-family:Arial, Helvetica, Sans-Serif; 
                font-size:13px;
	        }

			table, th, td {
				border-top: 1px solid #e4e6e7;
   				border-bottom: 1px solid #e4e6e7;
  				height: 27px;
  				border-collapse : collapse;
  				text-align : center;
			}
			
			#adhistoryBoardList th {
				background : #2f323a none repeat-x scroll center left; 
				color : white;
			}
			
			#adhistoryBoardList {
	             width : 100%;
			}
			
			.adhistoryBoardInsertOne, .adhistoryAllList, 
			.adhistoryBoardInsertWrite {
   				float : right;
   				color : black;
			}
			
			#adhistorySearchSelectDiv {
				float : left;
				margin-right : 1%;
			}
			
			#adhistorySearchCondition {
				width : 80px; 
				height : 30px;
			}
			
			.adhistoryInputGroup {
				height : 30px;
				width : 190px;
				border : 1px solid #ddd;
				background : #ffffff;
				float : left;
			}
			
			 .adhistoryInput {
				font-size : 11px;
				width : 120px;
				padding : 5px;
				border : 0px;
				outline : none;
				float : left;
			} 
			
			.input-group {
				 float : left;
				 width : 20%;
			}
			
			 .adhistoryButton {
				width : 50px;
				height : 100%;
				border : 0px;
				float : right;
				background :  #2f323a;
			}
			
			#adhistoryBoardDetailForm {
				color : black; 
				text-decoration : none;
			}
			
			.row {
				margin-top: 4%;
				margin-left : 23%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				margin-left: -6%;
			}
			
			.glyphicon-search:before {
			    content: "\e003";
			    color: white;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function() {
				/* Searching <select> option value fix*/
   				if($('#adhistorySearchSelectHidden').val() != '') {
   					$('#adhistorySearchCondition option[value='+ $('#adhistorySearchSelectHidden').val()+']').attr('selected',true);
   				}
			});
			
			/*Push Button group Start*/
			function adhistorySearchButtonOneForm() {
				if(confirm(' 검색을 진행하시겠습니까? ')) {
		  			$('#adhistorySearchCondition').val();
		  			$('#adhistorySearchForm').attr('action', '/admin/adhistoryBoardList.ad');
					$('#adhistorySearchForm').submit();
				} else {
					return false;
				};
			};
			
			function adhistoryAllList() {
				if(confirm(' 전체리스트 보기를 진행하시겠습니까? ')) {
					$('#adhistoryNo').val('');
		  			$('#adhistoryListform').attr('action', '/admin/adhistoryBoardList.ad');
					$('#adhistoryListform').submit();
				} else {
					return false;
				};
			};
			
			function adhistoryInsertForm() {
				if(confirm(' 게시물 작성을 진행하시겠습니까? ')) {
					$('#adhistoryNo').val('');
		  			$('#adhistoryListform').attr('action', '/admin/adhistoryBoardSelect.ad');
					$('#adhistoryListform').submit();
				} else {
					return false;
				};
			};
			
			function adhistoryBoardDetailForm(ntno) {
				if(confirm(' 게시물 상세페이지로  이동하시겠습니까? ')) { 
					$('#adhistoryNo').val(ntno);
		  			$('#adhistoryListform').attr('action', '/admin/adhistoryBoardDetail.ad');
					$('#adhistoryListform').submit();
				} else {
					return false;
				};
			};
			
			function goPage(num) {
				$("#page").val(num);
				$('#pageForm').attr('action', '/admin/adhistoryBoardList.ad');
				$('#pageForm').submit();
				
			}
			/*Push Button group End*/
			
			/* 회원목록 */	
	  		 function adListMemberButton1() {
	  			$('#adListMemberForm1').attr('action', '/admin/adlistMember.ad');
	 			$('#adListMemberForm1').submit();
	   		 }
				
			/* 탈퇴한 회원목록 */	
	   		 function adListMemberButton2() {
	  			$('#adListMemberForm2').attr('action', '/admin/adlistMember.ad');
	 			$('#adListMemberForm2').submit();
	   		 }
		</script>
	</head>
	
	<body>
		<section id="container">
  		<!--TOP BAR CONTENT & NOTIFICATIONS-->
    
    	<!--header start-->
    	<header class="header black-bg">
      		<div class="sidebar-toggle-box">
       			<div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      		</div>
      		
      		<!--logo start-->
      		<a href="/admin.jsp" class="logo"><b>trip<span>Us</span></b></a>
      		<!--logo end-->
      
      		<div class="nav notify-row" id="top_menu">
        		<!--  notification start -->
       			<ul class="nav top-menu">
        			<!--inbox dropdown start-->
        			<li id="header_inbox_bar" class="dropdown">
	            		<a data-toggle="dropdown" class="dropdown-toggle" href="/admin.jsp#">
	              			<i class="fa fa-envelope-o"></i>
	              			<span class="badge bg-theme">3</span>
	              		</a>
            
            			<ul class="dropdown-menu extended inbox">
              			<div class="notify-arrow notify-arrow-green"></div>
		              		<li>
		                		<p class="green">새로운 메세지 3개가 있습니다.</p>
		              		</li>
              
		              		<li>
		                		<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/jingoo.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">여진구</span>
		                  				<span class="time">Just now</span>
		                  			</span>
		                  			<span class="message">
		                  				점심 몇시에 먹어?
		                  			</span>
		                  		</a>
		              		</li>
              		
		              		<li>
		                		<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/iu.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">IU</span>
		                 				<span class="time">40 mins.</span>
		                  			</span>
		                  			<span class="message">
		                 				10시에 공지사항 수정예정!
		                  			</span>
		                 		 </a>
		              		</li>
              
		              		<li>
		               			<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/gong.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">공유</span>
		                  				<span class="time">2 hrs.</span>
		                  			</span>
		                  			<span class="message">
		                  				오늘안에 업무 보고 바람.
		                  			</span>
		                 		</a>
		              		</li>
		              
		              		<li>
		                		<a href="/admin.jsp#">See all messages</a>
		              		</li>
            			</ul>
          			</li>
          			<!--inbox dropdown end-->
          	
          			<!-- notification dropdown start-->
          			<li id="header_notification_bar" class="dropdown">
            			<a data-toggle="dropdown" class="dropdown-toggle" href="/admin.jsp#">
              				<i class="fa fa-bell-o"></i>
              				<span class="badge bg-warning">2</span>
              			</a>
            
            			<ul class="dropdown-menu extended notification">
              				<div class="notify-arrow notify-arrow-yellow"></div>
              					<li>
                					<p class="green">2개의 알림이 있습니다.</p>
              					</li>
              		
              					<li>
                					<a href="/admin.jsp#">
	                  					<span class="label label-warning"><i class="fa fa-bell"></i></span>
	                  						결제서류 보고 받는날
	                  					<span class="small italic">30 mins.</span>
                  					</a>
              					</li>
              
				              	<li>
				                	<a href="/admin.jsp#">
				                  		<span class="label label-success"><i class="fa fa-plus"></i></span>
				                 			새로운 관리자가 등록완료
				                  		<span class="small italic">3 hrs.</span>
				                  	</a>
				              	</li>
             		
			             		<li>
			                		<a href="/admin.jsp#">See all notifications</a>
			              		</li>
            				</ul>
          				</li>
          				<!--notification dropdown end-->
       				</ul>
       				<!--notification end-->
      			</div>
     
      			<div class="top-menu">
        			<ul class="nav pull-right top-menu">
          				<li><a class="logout" href="/admin/html/login.html">Logout</a></li>
        			</ul>
      			</div>
    		</header>
    		<!--header end-->
    
    		<!--MAIN SIDEBAR MENU-->
    		
    		<!--sidebar start-->
    		<aside>
      			<div id="sidebar" class="nav-collapse ">
        			<!-- sidebar menu start-->
       				<ul class="sidebar-menu" id="nav-accordion">
          				<p class="centered"><a href="/admin/html/profile.html"><img src="/admin/img/jeonjihyun.JPG" class="img-circle" width="80"></a></p>
          					<h5 class="centered">admin</h5>
	          					<li class="mt">
	            					<a class="active" href="admin.jsp">
		              					<i class="fa fa-dashboard"></i>
		              					<span>Admin page</span>
	              					</a>
	          					</li>
          
          						<li class="sub-menu">
            						<a href="javascript:;">
	              						<i class="fa fa-cogs"></i>
	              						<span>공지사항 관리</span>
              						</a>
            						
            						<ul class="sub">
						            	<li><a href="/admin/adntBoardList.ad">공지사항</a></li>
						            	<li><a href="/admin/adqaBoardList.ad">Q&A</a></li>
						              	<li><a href="/admin/adfaBoardList.ad">FAQ</a></li>
						            </ul>
          						</li>
          						
          						<li class="sub-menu">
           							<a href="javascript:;">
              							<i class="fa fa-cogs"></i>
              							<span>회원관리</span>
              						</a>
			            
			            			<ul class="sub">
				            			<form id="adListMemberForm1">
			              					<input type="hidden" name="mdeleteyn" value="Y">
			              				</form>
			              				
			              				<form id="adListMemberForm2" >
			              					<input type="hidden" name="mdeleteyn" value="N">
			            				</form>
		             	 				
		             	 				<li onclick="adListMemberButton1()"><a>회원 목록</a></li>
		              					<li onclick="adListMemberButton2()"><a>탈퇴 회원 목록</a></li>
			            			</ul>
          						</li>

          						<li class="sub-menu">
            						<a href="javascript:;">
              							<i class=" fa fa-bar-chart-o"></i>
              							<span>통계</span>
              						</a>
              						
						            <ul class="sub">
						               <li><a href="/admin/html/adChart.html">tripUs 통계</a></li>
						            </ul>
         						</li>
          	
          						<li class="sub-menu">
            						<a href="javascript:;">
              							<i class="fa fa-comments-o"></i>
              							<span>관리자 관리</span>
              						</a>
              						
						            <ul class="sub">
						            	<li><a href="/admin/adhistoryBoardList.ad">관리자 활동내역</a></li>
						            </ul>
         						</li>
          
          						<li>
           							<a href="/admin/html/google_maps.html">
              							<i class="fa fa-map-marker"></i>
              							<span>Google Maps </span>
              						</a>
          						</li>
        			</ul>
       				<!-- sidebar menu end-->
      			</div>
    			</aside>
    				<!--sidebar end-->
        	
					<div class="containerOne">
						<div class="row" >
	 						<h1 id="row"> 관리자 활동내역 목록</h1>
						</div>
			
						<br>
			
					<div role="tabpanel">
            			<div class="col-sm-2">
            			</div>
		
					<div class="col-sm-9">
						<%-- Start search --%>
			      		<form id='adhistorySearchForm' method='get'>
							<input type='hidden' id='adhistorySearchSelectHidden' value='${adhistorysearchcondition}' />
			        	
					        <div id='adhistorySearchSelectDiv'>
						    	<select id='adhistorySearchCondition' name='adhistorysearchcondition'>
						        	<option value='all' selected>전체</option>
						            <option value='adhistorytitle'>제목</option>
						            <option value='adhistoryinsertdate'>등록일</option>
						    	</select>
					        </div>
			         	   
					        <div class='adhistoryInputGroup'>
					        	<input class='adhistoryInput' type='text' name='adhistorysearchkeyword' placeholder='검색어를 입력하세요.' value='${adhistorysearchkeyword}' />
					            
					            <button class='adhistoryButton' type='button' onclick='adhistorySearchButtonOneForm()'>
					            	<i class='glyphicon glyphicon-search'></i>
					            </button>
							</div>
						</form>
      					<%-- End search --%>
      
      					<%-- push button --%>
						<span class='adhistoryBoardInsertOne'>
							<button onclick='adhistoryAllList()' class='btn btn-default' >
								<span class='adhistoryAllList'>전체보기</span>
							</button>
				
							<!--only admin use-->
							<c:if test='${sessionScope.mgrade=="1"}'>
								<button onclick='adhistoryInsertForm()' class='btn btn-default' >
									<span class='adhistoryBoardInsertWrite'>글쓰기</span>
								</button>
							</c:if>
						</span>

		      			<br>
		      			<br>
		      			<br>
      
      					<%-- Start List --%>
						<form id='adhistoryListform' name='adhistoryListform' method='post'>
 							<input type='hidden' id='adhistoryNo' name='adhistoryno' value='' /> 
	
	      					<table id='adhistoryBoardList' summary='관리자 활동내역 게시판 리스트'>
						      	<colgroup>
						      		<col width='10%' />
						      		<col width='60%' />
						      		<col width='20%' />
						      	</colgroup>
	      	
		      					<thead>
		        					<tr>
						            	<th>NO</th>
						            	<th>제목</th>
						            	<th>작성자</th>
						            	<th>등록일</th>
		         					</tr>
		      					</thead>
	      	
	      						<tbody> 
		      						<!-- Data information in list -->
		      						<c:choose> 
	      								<c:when test='${not empty adhistoryBoardList}'>
	        								<c:forEach var='list' items='${adhistoryBoardList}'>
	            			
		            							<tr>
						               				<td><fmt:formatNumber value='${fn:replace(list.adhistoryno,"AD","")}' /></td>
						               				<td id='adhistoryBoardDetailForm' onclick='adhistoryBoardDetailForm("${list.adhistoryno}")'>${list.adhistorytitle}</td>
						               				<td>${list.adhistoryid}</td>
						               				<td>${list.adhistoryinsertdate}</td>
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
	      				<div id="paging" class="text-center">
								<form id="pageForm" >
									<input type="hidden" id="page" name="pageno" value=''/>
								</form>	
								<%-- log  
								<c:out value="${startPage}"/>
								<c:out value="${endPage}"/>
								<c:out value="${totalPage}"/>
								<c:out value="${page}"/>
								--%>
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
										
										if(cnt1 >=4){
											
											break;
										}
										cnt1++;
										System.out.println("cnt1: "+cnt1);
									}
									
								%>
									<c:if test="${pageVal<totalPage}">
									<li><a onclick="goPage(${pageVal+1})"> > </a></li>
									</c:if>
									<li><a onclick="goPage(${endPage})"> >> </a></li>
									</ul>
									</c:if>
								</div>
								
								</div>
							</div>
						</div>
	      				
	     				<%-- End List --%>
   					</div>	
   				</div>
			</div>
 	 	</section> 
 	 	
 	 	
	 	<!-- js placed at the end of the document so the pages load faster -->
	  	<script src="/admin/lib/jquery/jquery.min.js"></script>
	 	<script src="/admin/lib/bootstrap/js/bootstrap.min.js"></script>
	  	<script class="include" type="text/javascript" src="/admin/lib/jquery.dcjqaccordion.2.7.js"></script>
	  	<script src="/admin/lib/jquery.scrollTo.min.js"></script>
	  	<script src="/admin/lib/jquery.nicescroll.js" type="text/javascript"></script>
	  	<script src="/admin/lib/jquery.sparkline.js"></script>
	  
	  	<!--common script for all pages-->
	  	<script src="/admin/lib/common-scripts.js"></script>
	  
	  	<!--script for this page-->
	  	<script src="/admin/lib/sparkline-chart.js"></script>
	  	<script src="/admin/lib/zabuto_calendar.js"></script>
	  	<script type="text/javascript"></script>
	</body>
</html>