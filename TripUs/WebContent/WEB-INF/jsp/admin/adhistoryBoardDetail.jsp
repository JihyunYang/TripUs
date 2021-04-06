<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta name="description" content="">
  		<meta name="author" content="Dashboard">
  		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  		
		<title> Admin Q&A Write page </title>
		
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
  		 		
		<!--basic form bootstrap and css START-->
		<!-- include libraries(jQuery, bootstrap) -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
		<!--basic form bootstrap and css END-->

		<!-- adhistoryBoardDetail style group -->
		<style type="text/css">
			.containerOne {
					padding-left : 15%;
					padding-top : 5%;
			   		width : 100%;
			    	margin-bottom : -20px;
			}
			
			.adhistoryUpdateDivButton {
				float : right;
				margin-right : 3px;
			}
			
			.adhistoryTbl {
				border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border : 1px solid #ddd;
			}
			
			
			.adhistoryTbl .adhistoryTd {
				width: 1%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : white;
				background: #2f323a;
			}
			
			.adhistoryfile {
				width: 2%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
			}
			
			#adhistoryNo, #adhistoryId{
			width : 30%;
			}
			
			textarea {
				width : 100%;
				height : 100%;
			}
				
			.form-control[readonly], .form-control[disabled] {
			    background-color : white;
			    opacity : 1;
			}
			
			
			.adhistoryfile {
				border-bottom  :1px solid #ddd; 	
			}
			
			.row {
				margin-top: 4%;
				margin-left : 25%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				width :60%;
				margin-left: 0%;
			}
			.adhistoryButton{
				float: right;
				margin-left: 5px; 
			}
		</style>
		
		<script type="text/javascript">

			/*Push Button group Start*/
			function adhistoryBoardUpdateButton(adhistoryno) {
				if(confirm(' 게시물 수정을 진행하시겠습니까? ')) { 
		  			$('#adhistoryBoardDetailForm').attr('action', '/admin/adhistoryBoardSelect.ad');
					$('#adhistoryBoardDetailForm').submit();
				} else {
					return false;
				}
			} 
			function adhistoryBoardDeleteButton(adhistoryno) {
				if(confirm(' 게시물 삭제를 진행하시겠습니까? ')) { 
		  			$('#adhistoryBoardDetailForm').attr('action', '/admin/adhistoryBoardDelete.ad');
					$('#adhistoryBoardDetailForm').submit();
				} else {
					return false;
				}
			} 
				
			function adhistoryBoardListButton() {
				if(confirm(' 게시물 목록으로 되돌아가시겠습니까? ')) {
					$('#adhistoryBoardDetailForm').attr('action', '/admin/adhistoryBoardList.ad');
					$('#adhistoryBoardDetailForm').submit();
				} else {
					return false;
				}
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
				 			<h1 id="row">관리자 활동 내역 상세페이지</h1>
						</div>
		 	
		 				<br>
			
						<div role="tabpanel">
            				<div class="col-sm-2">
            			</div>
		
						<div class="col-sm-9">
							<%-- Start DetailForm --%>
							<form id='adhistoryBoardDetailForm'>
								<input type='hidden' name="adhistoryno" value='${adhistoryBoardDetail.adhistoryno}' />
		   				 	</form>
		     			
							<table class='adhistoryTbl'>
								<tr> 
									<td class='adhistoryTd'>번호</td>
								
									<td> 
										<input type='text' class='form-control' id='adhistoryNo' readonly='readonly' value='${adhistoryBoardDetail.adhistoryno}' />
									</td>
								</tr>
							
								<tr>
									<td class='adhistoryTd'>작성자</td>
									
									<td> 
										<input type='text' class='form-control'  id='adhistoryId' readonly='readonly' value='${adhistoryBoardDetail.adhistoryid}' />
									</td>
								</tr>
								<tr>
									<td class='adhistoryTd'>제목</td>
									<td>
										<input type='text' class='form-control' id='adhistoryTitle' name='adhistorytitle' value='${adhistoryBoardDetail.adhistorytitle}' readonly="readonly"/>
									</td>
								</tr>
					
								<tr> 
									<td class='adhistoryTd'>등록일</td>
									<td> 
										<input type='text' class='form-control' readonly='readonly' value='${adhistoryBoardDetail.adhistoryinsertdate}'>
									</td>
								</tr>
					
					
								<tr>
									<td class='adhistoryTd'>내용</td>
									
									<td> 
										<textarea class='form-control' readonly='readonly'  rows='5' >${adhistoryBoardDetail.adhistorycontent}</textarea>
									</td>
								</tr>
					
								<tr>
									<td class='adhistoryTd'>첨부 파일</td>
									
									<td colspan='2'  class='adhistoryfile' >
										<!-- Usually name property have used to vo file , but MultipartFile property use different file name for collision avoid -->
										<c:if test="${adhistoryBoardDetail.adhistoryfile != null}">
											<a href='/fileupload/${adhistoryBoardDetail.adhistoryfile}' download><img src='/fileupload/${adhistoryBoardDetail.adhistoryfile}' alt="사진없음" onError="this.src='/img/boardfile.png';" /></a>
											<p>${adhistoryBoardDetail.adhistoryfile}</p>
										</c:if>
										<input type='hidden' id='adhistoryFile' name='adhistoryfile' value='${adhistoryBoardDetail.adhistoryfile}' />
									</td>
								</tr>
								
								<tr>
									<td class='adhistoryTd'>비고</td>
										<td>
											<input type='text' class='form-control' id='adhistoryEtc' name='adhistoryetc' value='${adhistoryBoardDetail.adhistorytitle}' readonly="readonly"/>
										</td>
								</tr>
								<tr>
									<td></td>
								</tr>
							  </table>
							  <br>
							  
							  <span class="adhistoryButton"><button class='btn btn-default' onclick='adhistoryBoardListButton()'> 목록 </button></span>
						  	  <!-- only authors use -->
							  <c:if test='${sessionScope.mid == adhistoryBoardDetail.adhistoryid}'>
								<span class="adhistoryButton"><button class='btn btn-default' onclick='adhistoryBoardDeleteButton("${adhistoryBoardDetail.adhistoryno}")'>삭제</button></span>
								<span class="adhistoryButton"><button class='btn btn-default' onclick='adhistoryBoardUpdateButton("${adhistoryBoardDetail.adhistoryno}")'>수정</button></span>
							  </c:if>
					
							  
   		 					
   		 					<br>
   		 					<br>
   		 					<br>
   		 					<br>
   		 		
	
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