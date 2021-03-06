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

		<!-- qaBoardList style group -->
		<style type="text/css">
			.containerOne {
					padding-left : 15%;
					padding-top : 5%;
			   		width : 100%;
			    	margin-bottom : -20px;
			}
			
			.qaUpdateDivButton {
				float : right;
				margin-right : 3px;
			}
			
			.qaTbl {
				border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border : 1px solid #ddd;
			}
			
			.qaTbleDetailReply {
			    border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border : 1px solid #ddd;
			}
			
			.qaTbl .qaTd {
				width: 1%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : white;
				background: #2f323a;
			}
			
			.qafile {
				width: 2%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
			}
			
			.TdDetailReply {
				font-weight : bold;
				font-size : 16px;
				color : white;
				width: 28%;
    			text-align : center;
    			border : 1px solid #ddd;
   				background: #2f323a; 
   				margin-right: 2%;
			}
			
			.secretText {
				padding-left : 1%;
				text-align : right;
				font-weight : bold;
				color : #747070;
			}
			
			#qaNo, #qaId, #qaType, #qaAnsertType {
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
			
			#qaTitleSecret {
				width : 80%;
				display : inline;
			}
			
			.qafile {
				border-bottom  :1px solid #ddd; 	
			}
			
			.qaReImg {
				vertical-align: middle;
			    width: 200px;
			    height: 150px;
			}

			.qaImg {
				vertical-align: middle;
			    width: 60px;
			    height: 60px;
			}
			
			#topHr {
				width: 73%;
    			margin-left: 23%;
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
				if(confirm(' ????????? ????????? ????????????????????????? ')) { 
		  			$('#qaNo').val(qano);
		  			$('#qaBoardDetailForm').attr('action', '/admin/adqaBoardSelect.ad');
					$('#qaBoardDetailForm').submit();
				} else {
					return false;
				}
			} 
				
			function qaBoardListButton() {
				if(confirm(' ????????? ???????????? ???????????????????????????? ')) {
					$('#qaReplyForm').attr('action', '/admin/adqaBoardList.ad');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			} 
	
			function qaRePlyInsertButton(qano){
				if(confirm(' ???????????? ?????? ?????? ?????????  ????????????????????????? ')) {
					$('#qaNoOne').val(qano);
					$('#qaReplyContent').val('');
					$('#qaReplyForm').attr('action', '/admin/adqaBoardReplySelect.ad');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			}
			   
			function qaRePlyUpdateButton(qano) {
				if(confirm(' ???????????? ?????? ?????? ?????????  ????????????????????????? ')) {
					$('#qaNoOne').val(qano);
					$('#qaReplyForm').attr('action', '/admin/adqaBoardReplySelect.ad');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			}
			   
			function qaRePlyDeleteButton(qano) {
				if(confirm(' ????????? ????????? ????????????????????????? ')) {
					$('#qaNoOne').val(qano);
					$('#qaReplyForm').attr('action', '/admin/adqaBoardDelete.ad');
					$('#qaReplyForm').submit();
				} else {
					return false;
				}
			}
			/*Push Button group End*/
			
			/* ???????????? */	
	  		 function adListMemberButton1() {
	  			$('#adListMemberForm1').attr('action', '/admin/adlistMember.ad');
	 			$('#adListMemberForm1').submit();
	   		 }
				
			/* ????????? ???????????? */	
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
		                		<p class="green">????????? ????????? 3?????? ????????????.</p>
		              		</li>
              
		              		<li>
		                		<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/jingoo.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">?????????</span>
		                  				<span class="time">Just now</span>
		                  			</span>
		                  			<span class="message">
		                  				?????? ????????? ???????
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
		                 				10?????? ???????????? ????????????!
		                  			</span>
		                 		 </a>
		              		</li>
              
		              		<li>
		               			<a href="/admin.jsp#">
		                  			<span class="photo"><img alt="avatar" src="/admin/img/gong.JPG"></span>
		                  			<span class="subject">
		                  				<span class="from">??????</span>
		                  				<span class="time">2 hrs.</span>
		                  			</span>
		                  			<span class="message">
		                  				???????????? ?????? ?????? ??????.
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
                					<p class="green">2?????? ????????? ????????????.</p>
              					</li>
              		
              					<li>
                					<a href="/admin.jsp#">
	                  					<span class="label label-warning"><i class="fa fa-bell"></i></span>
	                  						???????????? ?????? ?????????
	                  					<span class="small italic">30 mins.</span>
                  					</a>
              					</li>
              
				              	<li>
				                	<a href="/admin.jsp#">
				                  		<span class="label label-success"><i class="fa fa-plus"></i></span>
				                 			????????? ???????????? ????????????
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
	              						<span>???????????? ??????</span>
              						</a>
            						
            						<ul class="sub">
						            	<li><a href="/admin/adntBoardList.ad">????????????</a></li>
						            	<li><a href="/admin/adqaBoardList.ad">Q&A</a></li>
						              	<li><a href="/admin/adfaBoardList.ad">FAQ</a></li>
						            </ul>
          						</li>
          						
          						<li class="sub-menu">
           							<a href="javascript:;">
              							<i class="fa fa-cogs"></i>
              							<span>????????????</span>
              						</a>
			            
			            			<ul class="sub">
				            			<form id="adListMemberForm1">
			              					<input type="hidden" name="mdeleteyn" value="Y">
			              				</form>
			              				
			              				<form id="adListMemberForm2" >
			              					<input type="hidden" name="mdeleteyn" value="N">
			            				</form>
		             	 				
		             	 				<li onclick="adListMemberButton1()"><a>?????? ??????</a></li>
		              					<li onclick="adListMemberButton2()"><a>?????? ?????? ??????</a></li>
			            			</ul>
          						</li>

          						<li class="sub-menu">
            						<a href="javascript:;">
              							<i class=" fa fa-bar-chart-o"></i>
              							<span>??????</span>
              						</a>
              						
						            <ul class="sub">
						               <li><a href="/admin/html/adChart.html">tripUs ??????</a></li>
						            </ul>
         						</li>
          	
          						<li class="sub-menu">
            						<a href="javascript:;">
              							<i class="fa fa-comments-o"></i>
              							<span>????????? ??????</span>
              						</a>
              						
						            <ul class="sub">
						            	<li><a href="/admin/adhistoryBoardList.ad">????????? ????????????</a></li>
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
				 			<h1 id="row">??????????????? 1:1????????? ?????? ???????????????.</h1>
						</div>
		 	
		 				<br>
			
						<div role="tabpanel">
            				<div class="col-sm-2">
            			</div>
		
						<div class="col-sm-9">
							<%-- Start DetailForm --%>
							<form id='qaBoardDetailForm'>
			   					<input type='hidden'  id='qaNo' name='qano' value='${qaBoardDetail.qano}' />
			   				</form> 
		     			
							<table class='qaTbl'>
								<tr> 
									<td class='qaTd'>????????????</td>
								
									<td> 
										<input type='text' class='form-control' id='qaNo' readonly='readonly' value='${qaBoardDetail.qano}' />
									</td>
								</tr>
							
								<tr>
									<td class='qaTd'>?????????</td>
									
									<td> 
										<input type='text' class='form-control'  id='qaId' readonly='readonly' value='${qaBoardDetail.qaid}' />
									</td>
								</tr>
					
								<tr>
									<td class='qaTd'>????????????</td> 
									
									<td> 
										<input type='text' class='form-control' id='qaType' readonly='readonly' value='${qaBoardDetail.qatype}' />
									</td>
								</tr>
						
								<tr>
									<td class='qaTd'>????????????</td> 
									
									<td> 
										<input type='text' class='form-control'  id='qaAnsertType' readonly='readonly' value='${qaBoardDetail.qaanswertype}' />
									</td>
								</tr>
					
								<tr> 
									<td class='qaTd'>?????????</td>
									<td> 
										<input type='text' class='form-control' readonly='readonly' value='${qaBoardDetail.qainsertdate}'>
									</td>
								</tr>
					
								<tr>
									<td class='qaTd'>????????????</td>
									
									<td>
										<input type='hidden' id='qasecretyn' name='qasecretyn' value='${qaBoardDetail.qasecretyn}'>
										<span>
											<input type='text' class='form-control' readonly='readonly' value='${qaBoardDetail.qatitle}' id='qaTitleSecret' />
										</span>
										<span class='secretText'>????????? 
											<input type='checkbox' id='qasecretyn1' value='Y'>
										</span>
									</td>
								</tr>
					
								<tr>
									<td class='qaTd'>????????????</td>
									
									<td> 
										<textarea class='form-control' readonly='readonly'  rows='5' >${qaBoardDetail.qacontent}</textarea>
									</td>
								</tr>
					
								<tr>
									<td class='qaTd'>????????????</td>
									
									<td colspan='2'  class='qafile' >
										<!-- Usually name property have used to vo file , but MultipartFile property use different file name for collision avoid -->
										<c:if test="${qaBoardDetail.qaimage != null}">
											<img class="qaImg" src='/fileupload/${qaBoardDetail.qaimage}'  alt='????????????' onError="this.src='/img/boardfile.png';" />
											<p>${qaBoardDetail.qaimage}</p>
										</c:if>
										<input type='hidden' id='qaImage' name='qaimage' value='${QaBoardUpdate.qaimage}' />
									</td>
								</tr>
							</table>
				
   		 					<br>
   		 		
		   		 			<!-- Push Button -->
		   		 			<c:if test='${qaBoardDetail.qastep == 0}'>
			   		 			<div class='qaUpdateDivButton'>
			   		 				<!-- only admin use -->
			   		 				<c:if test='${sessionScope.mgrade=="1"}'>
				   		 				<span><button class='btn btn-default' onclick='qaRePlyInsertButton("${qaBoardDetail.qano}")'>????????????</button></span>
									</c:if>
									
									<!-- only authors use -->
									<c:if test='${sessionScope.mid==qaBoardDetail.qaid}'>
										<span><button class='btn btn-default' onclick='qaBoardUpdateButton("${qaBoardDetail.qano}")'>??????</button></span>
									</c:if>
									<span><button class='btn btn-default' onclick='qaBoardListButton()'> ?????? </button></span>
			     				</div>
		     				</c:if>
		     				<%-- End DetailForm --%>
			     			<br>
			     			<hr>
     				
     						<div>
			     				<%-- Start DetailReplyForm --%>	
			         			<form id='qaReplyForm'>
			    		   			<input type='hidden'  id='qaNoOne' name='qano' value='${qaBoardDetail.qano}' />
				       					<c:choose>
				       						<c:when test='${qaBoardDetail.qastep == 0}'>
				       							<input type='hidden' id='qaReplyContent' name='qareplycontent' />
				       						</c:when>
				       				
				       					<c:otherwise>
				       						<table class='qaTbleDetailReply'>
				       							<tr>
				       								<td class='TdDetailReply'>??????</td>
				       					
				       								<td>
				       									<textarea id='qaReplyContent' name='qareplycontent' readonly='readonly' rows='5' cols='100'>${qaBoardDetail.qareplycontent}</textarea>
				       								</td>
				       							</tr>
											</table>
										
											<!-- Push Reply Button -->
				       						<div class='qaUpdateDivButton'>
				       							<!-- only admin use -->
				       							<c:if test='${sessionScope.mgrade=="1"}'>
													<span><button class='btn btn-default' onclick='qaRePlyUpdateButton("${qaBoardDetail.qano}")'>????????????</button></span>
													<span><button class='btn btn-default' onclick='qaRePlyDeleteButton("${qaBoardDetail.qano}")'>????????? ??????</button></span>
												</c:if>
												<span><button class='btn btn-default' onclick='qaBoardListButton()'> ?????? </button></span>
											</div>
				       					</c:otherwise>
									</c:choose>
			       				</form>
			       				
			       				<br>
			       			</div>
			     				
			     			<hr>
			   				<%-- End DetailReplyForm --%>
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