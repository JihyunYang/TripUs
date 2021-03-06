<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta name="description" content="">
  		<meta name="author" content="Dashboard">
  		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  		
		<title> Admin Notice Detail page </title>
		
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
		 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		 <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
		 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
		 <!--basic form bootstrap and css END-->
  		 
  		 <!-- ntBoardList style group -->
		 <style type="text/css">
			.containerOne {
					padding-left: 15%;
					padding-top: 5%;
			   		width: 100%;
			    	margin-bottom: -20px;
			}
			
			.ntUpdateDivButton {
				float : right;
			}
			
			#row {
				margin-left : 3px;
				margin-bottom: 2%;
    		 	margin-top: 3%; 
			}
			
			.col-sm-9 {
				margin-left: -6%;
			}
			
			#topHr {
				width: 73%;
    			margin-left: 23%;
			}
			
			.row {
				margin-top: 4%;
				margin-left : 23%;
				margin-bottom : 2%;
			}
			
			.ntinfo{
		        background: white;
		    	padding: 10px;
		    	border-bottom: 2px solid #555;
    		}
		</style>
		
		<script type="text/javascript">
			/*Push Button group Start*/
		   function ntBoardUpdateButton(ntno) {
				if(confirm(' ????????? ????????? ????????????????????????? ')) { 
	  				$('#ntNo').val(ntno);
	  				$('#ntSummerDetailForm').attr('action', '/admin/adntBoardSelect.ad');
					$('#ntSummerDetailForm').submit();
				} else {
					return false;
				}
			};
		     
		   function ntBoardDeleteButton(ntno) {
			  if(confirm(' ????????? ????????? ????????????????????????? ')) {
		      	 $('#ntNo').val(ntno);
		     	 $('#ntSummerDetailForm').attr('action', '/admin/adntBoardDelete.ad');
		     	 $('#ntSummerDetailForm').submit();
			  } else {
				  return false;
			  }
		   };
		   
			function ntBoardListButton() {
				if(confirm(' ????????? ???????????? ???????????????????????????? ')) {
					$('#ntSummerDetailForm').attr('action', '/admin/adntBoardList.ad'); 
					$('#ntSummerDetailForm').submit();
				} else {
					return false;
				}
			};
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
						
		 	
			
						<div role="tabpanel">
            				<div class="col-sm-2">
            			</div>
				
						<div class="col-sm-9">
					<%--Start DetailForm--%>
	   				<form id='ntSummerDetailForm'>
			   			<input type='hidden'  id='ntNo' name='ntno' value='${ntBoardDetail.ntno}'>
			   		<%-- 	<input type='hidden'  id='ntTitle' name='nttitle' value='${ntBoardDetail.nttitle}'>
			   			<input type='hidden'  id='ntId' name='ntid' value='${ntBoardDetail.ntid}'>
			   			<input type='hidden'  id='ntContent' name='ntcontent' value='${ntBoardDetail.ntcontent}' >--%>
   					</form>
     			<br>
     			
     				<div class='ntinfo'>
             			<h1><b><span>${ntBoardDetail.nttitle}</span></b></h1>
             			<br>
            			????????? &nbsp;&nbsp; <span>${ntBoardDetail.ntid}</span>
            			<br>
            			????????? &nbsp;&nbsp; <span>${ntBoardDetail.ntinsertdate}</span>
    					
    					<span style='float: right;'>
           					????????? &nbsp;&nbsp; ${ntBoardDetail.nthit}
     					</span>
     					<br>
     					<br>
      				</div>
   <br>     			
     				<div class='form-group'>
       				<!-- 	<label for='ntcontent'>??????</label> -->
       				<br>
       				<br>
       					<div class="ntcontent">
       				  		${ntBoardDetail.ntcontent}
       				  	</div>
     				</div>
		     			<br>
     				<br>
					<hr>     				
     				<!-- Push Button -->
     				<div class='ntUpdateDivButton'>
     					<!-- only admin use -->
     					<c:if test='${sessionScope.mgrade=="1"}'>
							<button class='btn btn-default' onclick='ntBoardUpdateButton("${ntBoardDetail.ntno}")'>??????</button>
							<button class='btn btn-default' onclick='ntBoardDeleteButton("${ntBoardDetail.ntno}")'>??????</button>
						</c:if>
						<button class='btn btn-default' onclick='ntBoardListButton()'> ?????? </button>
						<br>
						<br>
						<br>
						
     				</div>
     		
   				</div>
   			</div> 
   					<%--End DetailForm--%>
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