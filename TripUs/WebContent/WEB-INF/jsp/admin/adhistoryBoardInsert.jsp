<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		<!--basic form bootstrap and css END-->
		
		<!-- qaBoardList style group -->
		<style type="text/css">
			.containerOne {
					padding-left: 15%;
					padding-top: 5%;
			   		width: 100%;
			    	margin-bottom: -20px;
			}
	
			.adhistoryButton {
				float : right;
				margin-right : 7px;
			}
	
			.adhistoryTbleOne {
				border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border-top : 1px solid #ddd;
		 	    border-right: 1px solid #ddd;
		 	    border-left : 1px solid #ddd;
			}
			
			.adhistoryTbleReply {
			    border-collapse : separate;
		 		border-spacing : 3px 2px;
		 	    border-bottom : 1px solid #ddd;
		 	    border-right: 1px solid #ddd;
		 	    border-left : 1px solid #ddd;
			}
			
			.adhistoryTbleOne .Ttd{
				width: 1%;
				text-align : left;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : white;
				background: #2f323a;
			}
			
			.Ttdfile{
				width: 2%;
				text-align : center;
				font-weight : bold;
		 		border : 1px solid #ddd; 
				font-size : 16px;
				color : #747070;
			}
			
			.adhistoryRequired {
				color : #088deb;
			}
			
			
			.qaImg {
				vertical-align: middle;
			    width: 60px;
			    height:60px;
			}
			
			#adhistoryNo, #adhistoryId{
				width : 30%;
			}
			
			.textBytesSpan, .textBytesSpan2  {
				float : right;
				margin-right: 5px;
			}
			
			.row {
				margin-top: 4%;
				margin-left : 25%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				margin-left: -6%;
			}
		</style>
		
		<script type="text/javascript">
			$(document).ready(function() {
				/* Button mode that changes in Situation Start*/
				var adhistoryMode = '${adhistoryMode}';
				console.log('dhistoryBoardinsert.jsp adhistoryMode value confirm >>> : ' +  adhistoryMode);
				adhistoryMode = adhistoryMode.trim();
				if(adhistoryMode == 'adhistoryInsert') {
					document.getElementById('adhistoryInsertButton').style.display='block';
					document.getElementById('adhistoryUpdateButton').style.display='none';
					document.getElementById('adhistoryResetButton').style.display='block';
					document.getElementById('adhistoryInsertspace').style.display='block';
					document.getElementById('adhistoryUpdatespace').style.display='none';
					$('#adhistoryTitle').focus();
				} else if(adhistoryMode == 'adhistoryUpdate') {
					document.getElementById('adhistoryInsertButton').style.display='none';
					document.getElementById('adhistoryUpdateButton').style.display='block';
					document.getElementById('adhistoryResetButton').style.display='block';
					document.getElementById('adhistoryInsertspace').style.display='none';
					document.getElementById('adhistoryUpdatespace').style.display='block';
					$('#adhistoryTitle').focus();
				}
				
				/* Button mode that changes in Situation End*/
		
				/* Searching <select> option value fix*/
				if($('#adhistoryTypeSelectHidden').val() != '') {
					$('#adhistoryType option[value = '+ $("#adhistoryTypeSelectHidden").val() + ']').attr('selected',true);
				}
		
				
				/* fixing textbytes value for update */
				if($('#adhistoryContent').val() != '' || $('#adhistoryContent').val() != null ) {
					adhistoryCutText($('#adhistoryContent'))
				}
				
				
				/* check the number of characters in the textarea Start */
				$('#adhistoryContent').keyup(function() {
					adhistoryCutText(this);
					console.log(this);
				});
				
				//check the number of characters in the korean
				function adhistoryGetTextLength(adhistoryText) {
					var adhistoryLen = 0;
					
					for (var i = 0; i < adhistoryText.length; i++) {
						if(escape(adhistoryText.charAt(i)).length == 6) {
							adhistoryLen++;
						}
						adhistoryLen++
					}
					return adhistoryLen;
				};
				
				//500 characters setting
				function adhistoryCutText(adhistoryTextValue) {
					var adhistoryTextVal = $(adhistoryTextValue).val();
					var adhistoryTextLen = adhistoryTextVal.length;
					
					while(adhistoryGetTextLength(adhistoryTextVal) > 1000) {
						adhistoryTextLen--;
						adhistoryTextVal = adhistoryTextVal.substring(0, adhistoryTextLen);
					}
					$(adhistoryTextValue).val(adhistoryTextVal);
					$('.textBytes').text(adhistoryGetTextLength(adhistoryTextVal));
				};
				/* check the number of characters in the textarea End */
				
				/* validation action on inputBox click Start */
				$('#adhistoryTitle').blur(function(){
					if($('#adhistoryTitle').val() == '') {
						$('#adhistoryWriteadhistoryTitleCheck').text('????????? ??????????????????.');
						$('#adhistoryWriteadhistoryTitleCheck').css('color', 'red');
						return false; 
					} else if($('#adhistoryTitle').val().length > 30) {
						$('#adhistoryWriteadhistoryTitleCheck').text('????????? 30??? ????????? ??????????????????.');
						$('#adhistoryWriteadhistoryTitleCheck').css('color', 'red');
						return false;
					} else if(!$('#adhistoryTitle').val() =='' || $('#adhistoryTitle').val().length < 30) {
						$('#adhistoryWriteadhistoryTitleCheck').text("");
						return true;	
					}
				});
				/* validation action on inputBox click End */
				
				/* validation action on textareaBox click Start */
				$('#adhistoryContent').blur(function(){
					if($('#adhistoryContent').val() == '') {
						$('#adhistoryWriteadhistoryContentCheck').text('????????? ??????????????????.');
						$('#adhistoryWriteadhistoryContentCheck').css('color', 'red');
						return false;
					} else {
						$('#adhistoryWriteadhistoryContentCheck').text('');
						return true;
					}
				});
				/* validation action on textareaBox click End */
			});
	
			/*Push Button group Start*/
			function adhistoryInsertButton() {
				if(!adhistoryValidation()) return;
					if(confirm(' ????????? ????????? ?????? ????????????????????????? ')) {
						$('#adhistoryInsertForm').attr('action', '/admin/adhistoryBoardInsert.ad');
						$('#adhistoryInsertForm').submit();
					} else {
						return false;
				}
			};
			
	
			function adhistoryUpdateButton(){
				if(!adhistoryValidation()) return;
					//Secretbox check
					if(confirm(' ????????? ????????? ?????? ????????????????????????? ')) {
					$('#adhistoryInsertForm').attr('action', '/admin/adhistoryBoardUpdate.ad');
					$('#adhistoryInsertForm').submit();
				} else {
					return false;
				}
			};
	
			function adhistoryResetButton() {
				if(confirm(' ?????? ????????? ????????? ????????????????????????? ')) {
					$('#adhistoryInsertForm').attr('action', '/admin/adhistoryBoardList.ad'); 
					$('#adhistoryInsertForm').submit();
				} else {
					return false;
				}
			}
			/*Push Button group End*/
			
			/* validation action on insertButton click Start*/
			function adhistoryValidation() {
				var adhistoryChk = true;
				
				if($('#adhistoryTitle').val() == '') {
					$('#adhistoryWriteadhistoryTitleCheck').text('????????? ??????????????????.');
					$('#adhistoryWriteadhistoryTitleCheck').css('color', 'red');
					adhistoryChk = false;
					document.getElementById('adhistoryTitle').focus();   
					return  adhistoryChk;
				} 
				
				if($('#adhistoryTitle').val().length > 30) {
					$('#adhistoryWriteadhistoryTitleCheck').text('????????? 30??? ????????? ??????????????????.');
					$('#adhistoryWriteadhistoryTitleCheck').css('color', 'red');
					adhistoryChk = false;
					document.getElementById('adhistoryTitle').focus();   
					return  adhistoryChk;
				}
				
				if(!$('#adhistoryTitle').val() =='' || $('#adhistoryTitle').val().length < 30) {
					$('#adhistoryWriteadhistoryTitleCheck').text("");
					adhistoryChk = true;
				}
				
				if($('#adhistoryContent').val() == '') {
					$('#adhistoryWriteadhistoryContentCheck').text('????????? ??????????????????.');
					$('#adhistoryWriteadhistoryContentCheck').css('color', 'red');
					adhistoryChk = false;
					document.getElementById('qaContent').focus();   
					return  adhistoryChk;
				}
				
				if(!$('#adhistoryContent').val() == ''){
					adhistoryChk = true;
				}
				return  adhistoryChk;
			}
			/* validation action on insertButton click End*/
			
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
				 			<h1 id="row">
				 					<span id="adhistoryInsertspace">????????? ?????? ????????? ???????????? ???????????????.</span>
				 					<span id="adhistoryUpdatespace">????????? ?????? ????????? ???????????? ???????????????.</span>
									
							</h1>
						</div>
			
						<br>
			
						<div role="tabpanel">
			            	<div class="col-sm-2">
			            	</div>
	
							<div class="col-sm-9">
								<%-- Start WriteForm --%>
								<form id='adhistoryInsertForm' method='post' enctype='multipart/form-data'>
									<input type='hidden' id='sessionIdHidden' value='${sessionScope.mid}'/>
									<table class='adhistoryTbleOne'>
										<tr> 
											<td class='Ttd'><span class='adhistoryRequired'>&nbsp; * &nbsp;</span>??????</td>
												
											<td colspan='2'>
												<input type='text' class='form-control' id='adhistoryNo' name='adhistoryno' value='${adhistoryBoardUpdate.adhistoryno}' readonly='readonly' />
											</td>
										</tr>
								
										<tr>
											<td class='Ttd'><span class='adhistoryRequired'>&nbsp; * &nbsp;</span>??? &nbsp;??? &nbsp;???</td>
											
											<td colspan='2'> 
												<input type='text' class='form-control' id='adhistoryId' name='adhistoryid' value='${sessionScope.mid}' readonly='readonly' /> 
											</td>
										</tr>
							
					
										<tr>
											<td class='Ttd'><span class='adhistoryRequired'>&nbsp; * &nbsp;</span>??????</td>
									
											<td>
												<input type='text' class='form-control' id='adhistoryTitle' name='adhistorytitle' value='${adhistoryBoardUpdate.adhistorytitle}' />
												<div class='adhistoryWriteCheckFont' id='adhistoryWriteadhistoryTitleCheck'></div>
												
											</td>
									
										</tr>
					
										<tr>
											<td class='Ttd'><span class='adhistoryRequired'>&nbsp; * &nbsp;</span>??????</td>
											
											<td colspan='2'> 
												<textarea class='form-control' id='adhistoryContent' name='adhistorycontent' cols='100' rows='5'>${adhistoryBoardUpdate.adhistorycontent}</textarea>
												<span class='textBytesSpan'>
														<span class='textBytes'>0</span> bytes
												</span>
												<div class='adhistoryWriteCheckFont' id='adhistoryWriteadhistoryContentCheck'></div>
											</td>
										</tr>
								
										<tr>
											<td class='Ttd'>&nbsp;&nbsp;&nbsp;&nbsp; ??????  ??????</td>
											
											<td colspan='2' class='Ttdfile'> 
												<!-- Usually name property have used to vo file , but MultipartFile property use different file name for collision avoid -->
												<c:if test='${adhistoryBoardUpdate.adhistoryfile != null }'>
													<img src='/fileupload/${adhistoryBoardUpdate.adhistoryfile}'  alt='????????????' onError="this.src='/img/boardfile.png';" class="qaImg"/>
													<p>${adhistoryBoardUpdate.adhistoryfile}</p>
												</c:if>
												<input type='file' id='file' name='file' />
												<input type='hidden' id='adhistoryFile' name='adhistoryfile' value='${adhistoryBoardUpdate.adhistoryfile}' />
											</td>
										</tr>
										
										<tr>
											<td class='Ttd'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</td>
									
											<td>
												<input type='text' class='form-control' id='adhistoryEtc' name='adhistoryetc' value='${adhistoryBoardUpdate.adhistorytitle}' />
											</td>
										</tr>
										<tr>
											<td></td>
										</tr>
									</table>
	   							</form>
	   							<%-- End WriteForm --%>
	   							<br>
					  			<!-- Push Button -->
					     		<span class='adhistoryButton'><button class='btn btn-default' id='adhistoryResetButton'  onclick='adhistoryResetButton()'>??????</button></span>
				     			<span class='adhistoryButton'><button class='btn btn-default' id='adhistoryInsertButton' onclick='adhistoryInsertButton()'>??????</button></span>
				     			<span class='adhistoryButton'><button class='btn btn-default' id='adhistoryUpdateButton' onclick='adhistoryUpdateButton()'>??????</button></span>
	    	    
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