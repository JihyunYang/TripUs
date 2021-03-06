<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8");%>

<!-- textarea br set -->
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
		
		<title> Admin FAQ page </title>
		
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
  		 
  		<!--basic form bootstrap and css START-->
		<!-- include libraries(jQuery, bootstrap) -->
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
		<!--basic form bootstrap and css END-->
		
		<!--faBoardList style group-->
		<style type="text/css">
			.containerOne {
					padding-left : 15%;
					padding-top : 5%;
			   		width : 100%;
			    	margin-bottom : -20px;
			}
		
	         body { 
	                font-family : Arial, Helvetica, Sans-Serif; 
	                font-size : 13px;
	         }
	        
	        #faBoardList { 
	                width : 100%;
	        }
	        
	        #faBoardList ul { 
	        		margin : 10px 0 10px 40px; 
	        		padding : 0px;
	        }
	        
	        #faBoardList th { 
	                background : #2f323a repeat-x scroll center left; 
	                color : white;
	                padding : 7px 15px; 
	                text-align : left;
	       }
	       
	        #faBoardList td { 
			        		background : #ecf3f8 none repeat-x scroll center left; 
			        		color: #454343; 
			        		padding:7px 15px;
			        		border-bottom : 1px solid #ddd;
	        }
	        
	        #faBoardList tr.odd td { 
	        						background:#fff repeat-x scroll center left; 
	        						cursor:pointer;
			}
			
	        #faBoardList div.up { 
	        					background-position:0px 0px;
	        }
	        
	        #faBoardButton {
							width: 10%;
							text-align: right;
							margin-bottom: 5%;
			} 
			
			#faSearchButtonOne {
			               		width : 10%;
			               		text-align: left;
			}
			
			.faSearchSelectDiv {
				float : left;
				margin-right : 1%;
			}
			
			.fqInputGroup {
				height : 30px;
				width : 190px;
				border : 1px solid #ddd;
				background : #ffffff;
				float : left;
			}
			
			.faInput {
				font-size : 11px;
				width : 120px;
				padding : 5px;
				border : 0px;
				outline : none;
				float : left;
			}
			
			.fqButton {
				width : 50px;
				height : 100%;
				border : 0px;
				float : right;
				background :  #2f323a;
			}
			
			#faSearchCondition{
				height: 30px;
			}
			
			.row {
				margin-top: 4%;
				margin-left : 10%;
				margin-bottom : 2%;
			}
			
			.col-sm-9 {
				margin-left: -6%;
			}
			
			.glyphicon-search:before {
			    content: "\e003";
			    color: white;
			}
			
			#paging {
    			margin-left: 11%;
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
        	});
    	
			$(function() {
				/* Searching <select> option value fix*/
				if($('#faSelectHidden').val() != null || $('#faSelectHidden').val() != ''){
					$('#faSearchCondition option[value = '+ $("#faSelectHidden").val() +' ]').attr('selected', 'selected');
				}
				
				/*Push Button group Start*/
	  			$('#faInsertButton').click(function() {
	  				if(confirm(' ????????? ????????? ????????????????????????? ')) {
			  			$('#faNo').val("");
			  			$('#faboardListForm').attr('action', '/admin/adfaBoardSelect.ad');
						$('#faboardListForm').submit();
	  				} else {
	  					return false;
	  				}
	  		 	});
				
	  			$('#faAllListButton').click(function() {
	  				if(confirm(' ??????????????? ????????? ????????????????????????? ')) {
			  			$('#faNo').val('');
			  			$('#faboardListForm').attr('action', '/admin/adfaBoardList.ad');
						$('#faboardListForm').submit();
	  				} else {
	  					return false;
	  				}
	  		 	});
			});	

			function faUpdateButton(fano, faUpdate) {
				if(confirm(' ????????? ????????? ????????????????????????? ')) { 
		  			$('#faNo').val(fano);
		  			$('#faMode').val(faUpdate);
		  			$('#faboardListForm').attr('action', '/admin/adfaBoardSelect.ad');
					$('#faboardListForm').submit();
				} else {
					return false;
				}
			};
			
			function faDeleteButton(fano, faDelete) {
				if(confirm(' ????????? ????????? ????????????????????????? ')) {
		  			$('#faNo').val(fano);
		  			$('#faMode').val(faDelete);
		  			$('#faboardListForm').attr('action', '/admin/adfaBoardSelect.ad');
					$('#faboardListForm').submit();
				} else {
					return false;
				}
			}; 
			
			function faSearchButtonOneForm() {
				if(confirm(' ????????? ????????????????????????? ')) {
		  			$('#faSearchCondition').val();
		  			$('#faSearchForm').attr('action', '/faq/faBoardList.fq');
					$('#faSearchForm').submit();
				} else {
					return false;
				}
			};
			
			$(function() {
				$('.pbutton').click(function() {
					$('[name=START_NUM]').val($(this).val());
					$('#faboardListForm').attr('action', '/faq/faBoardList.fq');
					$('#faboardListForm').submit();
				});
			});
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
			
						<br>
			
						<div role="tabpanel">
            				<div class="col-sm-2">
            			</div>
				
						<div class="col-sm-9">
							<%-- Start search --%>
							<div id='faButtonDiv'>
								<form id='faSearchForm' method='get'>
									<table>
										<tr>
											<td id='faSearchButtonOne'>
												<div class='faSearchSelectDiv'>
													<input type='hidden' id='faSelectHidden' value='${fasearchcondition}' />
														<select id='faSearchCondition' name='fasearchcondition'>
															<option value='all'>??????</option>
															<option value='faType'>????????????</option>
															<option value='faTitle'>??????</option>
															<option value='faContent'>??????</option>
														</select>
												</div>
									
												 <div class='fqInputGroup'>	
													<input type='text' class='faInput' id='faSearchKeyword' name='fasearchkeyword' placeholder='???????????? ???????????????.' value='${fasearchkeyword}' />
									               		<button type='button' class='fqButton' onclick='faSearchButtonOneForm()'>
							                				<i class='glyphicon glyphicon-search'></i>
							                 			</button>
								 				</div>
											</td>
									 
											 <%-- push button --%>
											 <td id='faBoardButton'>
											     <input type='button' class='btn btn-default' id='faAllListButton' value='????????????' />	
											     
											     <!--only admin use-->
											     <c:if test='${sessionScope.mgrade=="1"}'>
											     	<input type='button' class='btn btn-default' id='faInsertButton' value='?????????' />
											     </c:if>
											 </td>
										</tr>
									</table>
								</form>
							</div>
							<%-- End search --%>
				
							<br>
							
							<%-- Start List --%>
							<form id='faboardListForm' method='post'>
								<input type='hidden' id='faNo' name='fano' value='${FaqVo.fano}' />
								<input type='hidden' id='faMode' name='faMode' value='' />
								<input type='hidden' name='START_NUM' value='1'>
								
								<table id='faBoardList' summary='FAQ????????? ?????????'>
									<thead>
										<tr>
											<th>NO</th>
											<th>????????????</th>
											<th>??????</th>
										</tr> 
									</thead>
				
									<tbody>
									<!-- Data information in list -->
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
														<td colspan='4' align='left'>
															<p>${fn:replace(row.facontent, cn, br)}</p>
														<ul>
															<li> <a href='http://${row.faaddsite}' target='blank'>??????????????? : ${row.faaddsite}</a></li>
														</ul>
												
															<span style='float:right'>
																<!--only admin use-->
																<c:if test='${sessionScope.mgrade=="1"}'>
																	<input type='button' class='btn btn-default' class='faUpdateButton' value='??????' onclick='faUpdateButton("${row.fano}", "faUpdate")' />
																	<input type='button' class='btn btn-default' class='faDeleteButton' value='??????' onclick='faDeleteButton("${row.fano}", "faDelete")' />
																</c:if>
															</span>
										    			</td>			
													</tr>
												</c:forEach>
											</c:when>
				
										<c:otherwise>
											<tr>
												<td colspan='4' align='center'>????????? ???????????? ???????????? ????????????.</td>
											</tr>
										</c:otherwise>
				    					</c:choose>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
				<%-- End List --%>
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
						
						if(cnt1 >=9){
							
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
 	 		</section> 
	 
			 
			<!-- js placed at the end of the document so the pages load faster -->
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