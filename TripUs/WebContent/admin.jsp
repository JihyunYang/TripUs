<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<meta name="description" content="">
  		<meta name="author" content="Dashboard">
  		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  		
		<title> admin page </title>
		
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
  		 
  		<script type="text/javascript">
	  		function adListMemberButton1() {
	  			$('#adListMemberForm1').attr('action', '/admin/adlistMember.ad');
	 			$('#adListMemberForm1').submit();
	 		}
				
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
          				<li><a class="logout" href="/login/logout.do">Logout</a></li>
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
        
       			<!-- MAIN CONTENT -->
    			<!--main content start-->
    			<section id="main-content">
      				<section class="wrapper">
						<div class="row">
          					<div class="col-lg-9 main-chart">
            						
            					<!--CUSTOM CHART START -->
            					<div class="border-head">
              						<h3>USER VISITS</h3>
            					</div>
            						
            					<div class="custom-bar-chart">
              						<ul class="y-axis">
							        	<li><span>1.000</span></li>
							            <li><span>800</span></li>
							            <li><span>600</span></li>
							            <li><span>400</span></li>
							            <li><span>200</span></li>
							            <li><span>0</span></li>
									</ul>
              					
              						<div class="bar">
						                <div class="title">Mon</div>
						                <div class="value tooltips" data-original-title="850" data-toggle="tooltip" data-placement="top">85%</div>
              						</div>
					              
					              	<div class="bar ">
					                	<div class="title">Tue</div>
					                	<div class="value tooltips" data-original-title="500" data-toggle="tooltip" data-placement="top">50%</div>
					              	</div>
					              	
					              	<div class="bar ">
					                	<div class="title">Wed</div>
					                	<div class="value tooltips" data-original-title="600" data-toggle="tooltip" data-placement="top">60%</div>
					              	</div>
					              	
					              	<div class="bar ">
					                	<div class="title">Thu</div>
					                	<div class="value tooltips" data-original-title="450" data-toggle="tooltip" data-placement="top">45%</div>
					             	</div>
					             	 
					              	<div class="bar">
					                	<div class="title">Fri</div>
					                	<div class="value tooltips" data-original-title="320" data-toggle="tooltip" data-placement="top">32%</div>
					              	</div>
					              	
					              	<div class="bar ">
					                	<div class="title">Sat</div>
					                	<div class="value tooltips" data-original-title="620" data-toggle="tooltip" data-placement="top">62%</div>
					              	</div>
					              	
					              	<div class="bar">
					                	<div class="title">Sun</div>
					                	<div class="value tooltips" data-original-title="750" data-toggle="tooltip" data-placement="top">75%</div>
					              	</div>
								</div>
            					<!--custom chart end-->
            
            					<div class="row mt">
             						<!-- SERVER STATUS PANELS -->
              						<div class="col-md-4 col-sm-4 mb">
                						<div class="darkblue-panel pn">
                  							<div class="darkblue-header">
                    							<h5>공지사항 게시글</h5>
                  							</div>
                 							
                 							<canvas id="serverstatus01" height="120" width="120"></canvas>
								            <script>
								            	var doughnutData = [{
								                	value: 60,
								                    color: "#1c9ca7"
								               	}, {
													value: 40,
								                    color: "#f68275"
								                   }
								               	];
								                var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
											</script>
                  								
                  							<p>R : 비로그인 / G : 로그인</p>
							                
							                <footer>
							                	<div class="pull-left">
							                    	<h5><i class="fa fa-hdd-o"></i>Update</h5>
							                    </div>
							                    	
							                    <div class="pull-right">
							                      	<h5>2019.09.23</h5>
							                   	</div>
											</footer>
										</div>
                						<!--/darkblue panel-->
              						</div>
              						<!--/col-md-4-->
              
									<div class="col-md-4 col-sm-4 mb">
                						<div class="darkblue-panel pn">
                  							<div class="darkblue-header">
                    							<h5>여행지 게시글</h5>
                  							</div>
                 							
                 							<canvas id="serverstatus02" height="120" width="120"></canvas>
								            <script>
								            	var doughnutData = [{
								                    value: 80,
								                    color: "#1c9ca7"
								               	}, {
								                    value: 20,
								                    color: "#f68275"
								                   }
								                ];
								                var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
											</script>
                  								
                  							<p>R : 비로그인 / G : 로그인</p>
							                
							                <footer>
							                    <div class="pull-left">
							                     	<h5><i class="fa fa-hdd-o"></i>Update</h5>
							                    </div>
							                    	
							                    <div class="pull-right">
							                      	<h5>2019.09.23</h5>
							                   	 </div>
											</footer>
										</div>
                					  	<!--/darkblue panel-->
									</div>
              					   	<!--/col-md-4-->
              
									<div class="col-md-4 col-sm-4 mb">
										<div class="darkblue-panel pn">
                  							<div class="darkblue-header">
                    							<h5>코스 게시글</h5>
                  							</div>
                 							
                 							<canvas id="serverstatus03" height="120" width="120"></canvas>
								            
								            <script>
								            	var doughnutData = [{
								                	value: 50,
								                   	color: "#1c9ca7"
								                }, {
								                    value: 50,
								                    color: "#f68275"
								                   }
								                ];
								                var myDoughnut = new Chart(document.getElementById("serverstatus03").getContext("2d")).Doughnut(doughnutData);
											</script>
                  								
                  							<p>R : 비로그인 / G : 로그인</p>
							                
							                <footer>
							                	<div class="pull-left">
							                    	<h5><i class="fa fa-hdd-o"></i>Update</h5>
							                   	</div>
							                    	
							                    <div class="pull-right">
							                      	<h5>2019.09.23</h5>
							                   	</div>
							                </footer>
                						</div>
                						<!--/darkblue panel-->
              						</div>
              						<!--/col-md-4-->
            					</div>
            					<!--/row mt-->
            
            					<div class="row">
              						<div class="col-md-4 col-sm-4 mb">
                						<div class="darkblue-panel pn">
                  							<div class="darkblue-header">
                    							<h5>맛집 게시글</h5>
                  							</div>
                 							
                 							<canvas id="serverstatus04" height="120" width="120"></canvas>
								            <script>
								                var doughnutData = [{
								                    value: 40,
								                    color: "#1c9ca7"
								                }, {
								                    value: 60,
								                    color: "#f68275"
								                   }
								                ];
								                var myDoughnut = new Chart(document.getElementById("serverstatus04").getContext("2d")).Doughnut(doughnutData);
											</script>
                  								
                  							<p>R : 비로그인 / G : 로그인</p>
							                  	
							                <footer>
							                	<div class="pull-left">
							                    	<h5><i class="fa fa-hdd-o"></i>Update</h5>
							                   	</div>
							                    	
							                    <div class="pull-right">
							                    	<h5>2019.09.23</h5>
							                   	</div>
							               	</footer>
                						</div>
                						<!--/darkblue panel-->
              						</div>
              						<!--/col-md-4-->
              
              						<div class="col-md-4 col-sm-4 mb">
                						<div class="darkblue-panel pn">
                  							<div class="darkblue-header">
                    							<h5>축제 게시글</h5>
                  							</div>
                 							
                 							<canvas id="serverstatus05" height="120" width="120"></canvas>
								            <script>
								            	var doughnutData = [{
								                	value: 35,
								                   	color: "#1c9ca7"
								                }, {
								                    value: 75,
								                    color: "#f68275"
								                   }
								                ];
								                var myDoughnut = new Chart(document.getElementById("serverstatus05").getContext("2d")).Doughnut(doughnutData);
											</script>
                  								
                  							<p>R : 비로그인 / G : 로그인</p>
							                
							                <footer>
							                	<div class="pull-left">
							                    	<h5><i class="fa fa-hdd-o"></i>Update</h5>
							                    </div>
							                    	
							                    <div class="pull-right">
							                    	<h5>2019.09.23</h5>
							                   	</div>
							                </footer>
										</div>
                						<!--/darkblue panel-->
                					</div>
              						<!--/col-md-4 -->
              							
              						<!-- WEATHER PANEL -->
              						<div class="col-md-4 mb">
                						<div class="weather pn">
							            	<i class="fa fa-cloud fa-4x"></i>
							                <h2>25º C</h2>
							                <h4>서울</h4>
							            </div>
              						</div>
              						<!-- /col-md-4-->
            					</div>
            					<!--/Row-->
          					</div>
          					<!-- /col-lg-9 END SECTION MIDDLE -->
             
             				<!--RIGHT SIDEBAR CONTENT-->
          					<div class="col-lg-3 ds">
            					<!--COMPLETED ACTIONS DONUTS CHART-->
            					<div class="donut-main">
							        <h4>총 게시물</h4>
							        	
							        	<canvas id="newchart" height="130" width="130"></canvas>
							            <script>
							            	var doughnutData = [{
							                	value: 50,
							                    color: "#4ECDC4"
							                }, {
							                    value: 50,
							                    color: "#fdfdfd"
							                   }
							                ];
							                var myDoughnut = new Chart(document.getElementById("newchart").getContext("2d")).Doughnut(doughnutData);
										</script>
            					</div>
            							
            					<!--NEW EARNING STATS -->
            					<div class="panel terques-chart">
              						<div class="panel-body">
                						<div class="chart">
                  							<div class="centered">
                    							<span>W : 비로그인 / G : 로그인</span>
                 							</div>
                  									
                  							<br>
                  							<br>
                  							<br>
                  									
                  							<div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[8500,5000,6000,4500,3200,6200,7500]"></div>
                						</div>
              						</div>
            					</div>
            					<!--new earning end-->
            
            					<!-- RECENT ACTIVITIES SECTION -->
            					<h4 class="centered mt"> Calendar </h4>
            								
            					<!-- CALENDAR-->
								<div id="calendar" class="mb">
									<div class="panel green-panel no-margin">
										<div class="panel-body">
									    	<div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
									        	<div class="arrow"></div>
									            	<h3 class="popover-title" style="disadding: none;"></h3>
									                	<div id="date-popover-content" class="popover-content"></div>
									       	</div>
									                  		
									        <div id="my-calendar"></div>
										</div>
									</div>
								</div>
								<!--/calendar-->
								<br>
								<br>
								<br>
								<br>
								<br>
          					</div>
          					<!--/col-lg-3-->
						</div>
        				<!--/row-->
      				</section>
    			</section>
    			<!--main content end-->
    
    			<!--footer start-->
    			<footer class="site-footer">
      				<div class="text-center">
        				<p>&copy; travel Site <strong>tripUs</strong>. All Rights Reserved</p>
	        				<div class="credits">
	        					Making memories together
	        				</div>
        						
	        				<a href="/admin/html/profile.html#" class="go-top">
	          					<i class="fa fa-angle-up"></i>
	          				</a>
      				</div>
				</footer>
				<!--footer end-->
  			</section>
  			<!--container-->
   		
   		
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
  
  			
			<script type="application/javascript">
    			$(document).ready(function() {
      				$("#date-popover").popover({
			        	html: true,
			        	trigger: "manual"
      				});
      				
      				$("#date-popover").hide();
      				$("#date-popover").click(function(e) {
        				$(this).hide();
      				});

      				$("#my-calendar").zabuto_calendar({
        				action: function() {
          				return myDateFunction(this.id, false);
        				},
        				action_nav: function() {
          				return myNavFunction(this.id);
        				},
        				ajax: {
          					url: "show_data.php?action=1",
          					modal: true
        				},
        				legend: [{
				            type: "text",
				            label: "Special event",
				            badge: "00"
         	 			}, {
				            type: "block",
				            label: "Regular event",
          					}
        				]
      				});
    			});

    			function myNavFunction(id) {
      				$("#date-popover").hide();
      				var nav = $("#" + id).data("navigation");
      				var to = $("#" + id).data("to");
      				console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    			}
			</script>
	</body>
</html>