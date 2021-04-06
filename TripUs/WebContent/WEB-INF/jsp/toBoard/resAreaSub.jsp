<%--
FileName (파일명): resAreaSub.jsp
Explanation (설명): Tour Area Page
Date Written (작성일): 2019.9.20
Writer (작성자): YJH
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% request.setCharacterEncoding("UTF-8"); %>

<%!String mno=""; %>
<%!String mid="";%>
<%!String mname="";%>
<%!String memail="";%>
<%!String mgrade="";%>
<%!HttpSession hs=null;%>
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

	<title>Tour Area Page</title>
	
	<link href="/img/tripFavicons.png" rel="icon">

	<!--Tour header bootstrap and css START-->
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
	
	<!--Side navigation bootstrap and css START-->
	<!--jQuery (necessary for Bootstrap's JavaScript plugins)-->
	<script src="/js/jquery-1.12.3.min.js"></script>
	
	<!--Include all compiled plugins (below), or include individual files as needed-->
	<script src="/js/bootstrap.min.js"></script>
	
	<!--Tour Bootstrap-->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<!--Side navigation bootstrap and css END-->
	
	<!--Basic form bootstrap and css START-->
	<!--Include libraries(jQuery, bootstrap)-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<!--Basic form bootstrap and css END-->

	<!--resAreaSub style group-->
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
	        font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
	        color: #333;
	   	}

		#header .top_header {
	    	min-height: 66px;
	    	font-family: Arial, Helvetica, Sans-Serif; 
	   	}
		
		.social_icon {
   			padding-right: 19px;
   		}
   		
   		a.dropdown-toggle {
   			color: black;
   		}
   		
   		.signup>button:hover {
   			background-color: #9ECFFF;
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
		
		/*tabpanel settings css*/
		.col-sm-2 {
    		margin-top: 1.6%;
    		padding-left: 0%;
    		font-size: 12px;
    		letter-spacing: -1px;
		}
		
		.col-sm-2>ul>li>a {
		    position: relative;
		    display: inline;
		    padding: 10px 21px;
		    float: left;
		    font-size: 15px;
		}
		
    	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, 
		.nav-pills>li.active>a:hover {
	    	color: #0b3a61; 
	    	background-color: #9ECFFF;
	    	font-weight: bold;
	    	text-align: center;
	    	font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Sans-serif;
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
		
		/*Right area_tagList div*/
		.box_rightType1 {
		    float: right;
    		width: 29%;
    		margin-top: 7%;
    		background-color: #f7f9fc;
    		padding: 8px 0px 12px 17px;
		}
		
		/*Right area_tagList p style*/
		.area_tagList>p {
			color: #b4b3b3;
    		font-family: Arial, Helvetica, Sans-Serif;
		}
		
		/*Right area_tagList button style div*/
		.area_tagList>.belongToArea>.tag_list li button span {
	    	position: relative;
	    	background-color: #f7f9fc;
	    	color: #9b9898;
	    	font-weight: 400;
	    	font-size: 14px;
    		letter-spacing: -0.6px;
    		border-top-left-radius: 35px;
		    border-top-right-radius: 35px;
		    border-bottom-left-radius: 35px;
		    border-bottom-right-radius: 35px;
    	}
    	
    	.area_tagList>.belongToArea>.tag_list li .btn {
    		background-color: #f7f9fc;
    		padding: 6px 8px;
    	}
    	
    	/*box_rightType1 li div*/
    	.area_tagList>.belongToArea>.tag_list li {
    		position: relative;
			float: left;
			margin: 7px 12px 2px 2px;
		}
    	
    	/*output List div*/
    	.List {
    		width: 60%;
    		float: left;
			margin-top: 8px;
    		margin-left: 8.5%;
    	}
    	
    	/*Address~Image div style*/
    	#col0{
    		padding: 0;
    	}
    	
    	/*Address and Hits div of List*/
		.col1{
			width: 50%;
			float: left;
		}
		
		/*favorite div of List*/
		.col2{
			width: 10%;
			float: left;
		}
		
		/*image div of List*/
		.col3{
			width: 40%;
			float: left;
			margin-bottom: 8%;
		}
		
		.img-rounded {
			width: 223.8px;
			height: 149.05px;
		}
		
		/*hr Css of List*/
		.col4{
			clear: both;
		}
		
		#footer {
			position: absolute;
			width: 100%;
			height: 60px;
			background: #f0f0f0;
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
  			<%--Using EL to use values contained in ModelAndView(Controller에 ModelAndView값을 사용하기 위해서 EL(=${})을 사용)--%>
      		var areaCode=${areaCode};
     			console.log("toBoardList.areaCode confirm >>> : " + areaCode);
     		var sigunguCode = ${sigunguCode};	
     			console.log("toBoardList.sigunguCode confirm >>> : " + sigunguCode );
 		
     		var totalCount = 0;   //총게시물수
     		var totalPage = 0;    //총페이지수
     		var currentPage = 1;   //현재 페이지번호
     		var startPage = 1;     //시작페이지번호
     		var endPage = 0;       //끝페이지 번호
			var countList = 0;    //한페이지의 게시물수
     		var countPage = 10;    //한페이지의 페이지수 
     		
     		
     		<%--API information is output in an asynchronous manner (API정보를 비동기방식으로 출력한다.)--%>
            $.ajax({
            	url : '/PublicData4.do',
                type : 'get',
                data : {areaCode:areaCode,sigunguCode:sigunguCode},
                dataType : 'json',
                success : function(data) {
                			console.log("resAreaSub.jsp data confirm >>> : " , data);
                    		console.log("resAreaSub.jsp data.response.body.items.item confirm >>> : " + data.response.body.items.item);
                    		
                    		console.log("스타트 페이지 >>>>>>>>>>>>>>>>>>>>" + startPage);
                    		
                    		totalCount = data.response.body.totalCount;
                    		console.log("전체 게시물수 >>>>>>>>>>>>>>>>>>>>" + totalCount);
                    		                		
                    		countList = data.response.body.numOfRows;
                    		console.log("한 페이지의 게시물수 >>>>>>>>>>>>>>>>>>>>" + countList);
                    		
                    		totalPage = totalCount / countList;
                    		if((totalCount % countList) > 0) {
                    			totalPage = Math.ceil(totalPage);
                    		}
                    		console.log("전체 페이지수 >>>>>>>>>>>>>>>>>>>>" + totalPage );
                    		
                    		if(totalPage<currentPage){
                    			currentPage=totalPage;
                    		}
							
                    		startPage = ((currentPage-1)/countPage)*countPage+1;
                    		console.log("시작페이지수 >>>>>>>>>>>>>>>>>>>>" + startPage );
                    		
                    		endPage = startPage + countPage-1;
                    		if(endPage > totalPage) {
                    			endPage = totalPage;
                    		}
                    		console.log("끝 페이지수 >>>>>>>>>>>>>>>>>>>>" + endPage );

                    		myItem = data.response.body.items.item;
                    			console.log("resAreaSub.jsp myItem >>> : " , myItem);
                    		
							var areaCodeStr="";
								console.log("resAreaSub.jsp myItem[0].areacode confirm >>> : " + myItem[0].areacode);
                    		var sigunguCodeStr="";
                    			console.log("resAreaSub.jsp myItem[0].sigungucode confirm >>> : " + myItem[0].sigungucode);
                    		
                    		/*When you click on an area, (지역을 클릭하면,)
                    		  the corresponding class is applied and fixed using addClass (해당하는 클래스가 addClass를 이용해서 active가 적용되어 고정된다)
                    		  It is a variable declaration to hold an index to distinguish 
                    		  a tag to execute this event. (이 이벤트를 실행할 태그를 구별하기 위해 인덱스를 보유하는 변수 선언입니다.)*/
                    		var index;
                    		
                    		if(sigunguCode==99) {
	                    		switch(myItem[0].areacode) {
				                    case 1:
				                    	areaCodeStr="서 울";
				                    	index=0;
				                        break;
				                     case 2:
				                        areaCodeStr="인 천";
				                        index=1;
				                        break;
				                     case 3:
					                    areaCodeStr="대 전";
					                    index=2;
					                    break;
				                     case 8:
					                    areaCodeStr="세 종";
					                    index=3;
					                    break;
				                     case 5:
						                areaCodeStr="광 주";
						                index=4;
						                break;
				                     case 4:
				                   		areaCodeStr="대 구";
					                    index=5;
					                    break;
				                     case 6:
				                   		areaCodeStr="부 산";
					                    index=6;
					                    break;
				                     case 7:
				                   		areaCodeStr="울 산";
					                    index=7;
					                    break;
				                     case 31:
				                   		areaCodeStr="경 기";
					                    index=8;
					                    break;
					                 case 32:
				                        areaCodeStr="강 원";
				                        index=9;
				                        break;
					                 case 33:
				                   		areaCodeStr="충 북";
					                    index=10;
					                    break;
					                 case 34:
				                   		areaCodeStr="충 남";
					                    index=11;
					                    break;
				                 	 case 37:
				                   		areaCodeStr="전 북";
					                    index=12;
					                    break;
				                 	 case 38:
				                   		areaCodeStr="전 남";
					                    index=13;
					                    break;
				                 	 case 35:
				                   		areaCodeStr="경 북";
					                    index=14;
					                    break;
					                 case 36:
				                        areaCodeStr="경 남";
				                        index=15;
				                        break;
					                 case 39:
				                   		areaCodeStr="제 주";
					                    index=16;
					                    break;
				              		 default:
				                     	areaCodeStr="지역 분류 없음"; 
				                }//End of switch block
								/*Name Output space*/
	                    		var output = '';
		                   		output += '<span style="font-size:22px; font-family: 나눔고딕" >'  + areaCodeStr + '</span>';
                    		}
                    		
                    		if(sigunguCode!=99) {
                    			if(areaCode==1) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="강남구";
	                    					index=0;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="도봉구";
	                    					index=0;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="동대문구";
	                    					index=0;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="동작구";
	                    					index=0;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="마포구";
	                    					index=0;
	 			                        	break;
	                    				case 14:
	                    					sigunguCodeStr="서대문구";
	                    					index=0;
	 			                        	break;
	                    				case 15:
	                    					sigunguCodeStr="서초구";
	                    					index=0;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="성동구";
	                    					index=0;
	 			                        	break;
	                    				case 17:
	                    					sigunguCodeStr="성북구";
	                    					index=0;
	 			                        	break;
	                    				case 18:
	                    					sigunguCodeStr="송파구";
	                    					index=0;
	 			                        	break;
	                    				case 19:
	                    					sigunguCodeStr="양천구";
	                    					index=0;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="강동구";
	                    					index=0;
	 			                        	break;
	                    				case 20:
	                    					sigunguCodeStr="영등포구";
	                    					index=0;
	 			                        	break;
	                    				case 21:
	                    					sigunguCodeStr="용산구";
	                    					index=0;
	 			                        	break;
	                    				case 22:
	                    					sigunguCodeStr="은평구";
	                    					index=0;
	 			                        	break;
	                    				case 23:
	                    					sigunguCodeStr="종로구";
	                    					index=0;
	 			                        	break;
	                    				case 24:
	                    					sigunguCodeStr="중구";
	                    					index=0;
	 			                        	break;
	                    				case 25:
	                    					sigunguCodeStr="중랑구";
	                    					index=0;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="강북구";
	                    					index=0;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="강서구";
	                    					index=0;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="관악구";
	                    					index=0;
	 			                        	break;
	                    				case 6:
	                    					sigunguCodeStr="광진구";
	                    					index=0;
	 			                        	break;
	                    				case 7:
	                    					sigunguCodeStr="구로구";
	                    					index=0;
	 			                        	break;
	                    				case 8:
	                    					sigunguCodeStr="금천구";
	                    					index=0;
	 			                        	break;
	                    				case 9:
	                    					sigunguCodeStr="노원구";
	                    					index=0;
	 			                        	break;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
                    				}//End of switch block
                    			} else if(areaCode==2) {
                    			  	switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="강화군";
	                    					index=1;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="중구";
	                    					index=1;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="계양구";
	                    					index=1;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="미추홀구";
	                    					index=1;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="남동구";
	                    					index=1;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="동구";
	                    					index=1;
	 			                        	break;
	                    				case 6:
	                    					sigunguCodeStr="부평구";
	                    					index=1;
	 			                        	break;
	                    				case 7:
	                    					sigunguCodeStr="서구";
	                    					index=1;
	 			                        	break;
	                    				case 8:
	                    					sigunguCodeStr="연수구";
	                    					index=1;
	 			                        	break;
	                    				case 9:
	                    					sigunguCodeStr="옹진군";
	                    					index=1;
	 			                        	break;
                    			 		default:
                    						sigunguCodeStr="지역 분류 없음"; 
                					}//End of switch block
                    			} else if(areaCode==3) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="대덕구";
	                    					index=2;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="동구";
	                    					index=2;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="서구";
	                    					index=2;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="유성구";
	                    					index=2;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="중구";
	                    					index=2;
	 			                        	break;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	                				}//End of switch block
                    			} else if(areaCode==8) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="세종시";
	                    					index=3;
	 			                        	break;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
                					}//End of switch block
                    			} else if(areaCode==5) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="광산구";
	                    					index=4;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="남구";
	                    					index=4;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="동구";
	                    					index=4;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="북구";
	                    					index=4;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="서구";
	                    					index=4;
	 			                        	break;                 				
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
                					}//End of switch block
                    			} else if(areaCode==4) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="남구";
	                    					index=5;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="달서구";
	                    					index=5;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="달성군";
	                    					index=5;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="동구";
	                    					index=5;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="북구";
	                    					index=5;
	 			                        	break;
	                    				case 6:
	                    					sigunguCodeStr="서구";
	                    					index=5;
	 			                        	break;
	                    				case 7:
	                    					sigunguCodeStr="수성구";
	                    					index=5;
	 			                        	break;
	                    				case 8:
	                    					sigunguCodeStr="중구";
	                    					index=5;
	 			                        	break;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
                					}//End of switch block	
                    			} else if(areaCode==6) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="강서구";
	                    					index=6;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="사하구";
	                    					index=6;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="서구";
	                    					index=6;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="수영구";
	                    					index=6;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="연제구";
	                    					index=6;
	 			                        	break;
	                    				case 14:
	                    					sigunguCodeStr="영도구";
	                    					index=6;
	 			                        	break;
	                    				case 15:
	                    					sigunguCodeStr="중구";
	                    					index=6;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="해운대구";
	                    					index=6;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="금정구";
	                    					index=6;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="기장군";
	                    					index=6;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="남구";
	                    					index=6;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="동구";
	                    					index=6;
	 			                        	break;
	                    				case 6:
	                    					sigunguCodeStr="동래구";
	                    					index=6;
	 			                        	break;
	                    				case 7:
	                    					sigunguCodeStr="부산진구";
	                    					index=6;
	 			                        	break;
	                    				case 8:
	                    					sigunguCodeStr="북구";
	                    					index=6;
	 			                        	break;
	                    				case 9:
	                    					sigunguCodeStr="사상구";
	                    					index=6;
	 			                        	break;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	                				}//End of switch block	
                    			} else if(areaCode==7) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="중구";
	                    					index=7;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="남구";
	                    					index=7;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="동구";
	                    					index=7;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="북구";
	                    					index=7;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="울주군";
	                    					index=7;
	 			                        	break;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	                				}//End of switch block	
                    			} else if(areaCode==31) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="가평군";
	                    					index=8;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="동두천시";
	                    					index=8;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="부천시";
	                    					index=8;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="성남시";
	                    					index=8;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="수원시";
	                    					index=8;
	 			                        	break;
	                    				case 14:
	                    					sigunguCodeStr="시흥시";
	                    					index=8;
	 			                        	break;
	                    				case 15:
	                    					sigunguCodeStr="안산시";
	                    					index=8;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="안성시";
	                    					index=8;
	 			                        	break;
	                    				case 17:
	                    					sigunguCodeStr="안양시";
	                    					index=8;
	 			                        	break;
	                    				case 18:
	                    					sigunguCodeStr="양주시";
	                    					index=8;
	 			                        	break;
	                    				case 19:
	                    					sigunguCodeStr="양평군";
	                    					index=8;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="고양시";
	                    					index=8;
	 			                        	break;
	                    				case 20:
	                    					sigunguCodeStr="여주시";
	                    					index=8;
	 			                        	break;
	                    				case 21:
	                    					sigunguCodeStr="연천군";
	                    					index=8;
	 			                        	break;
	                    				case 22:
	                    					sigunguCodeStr="오산시";
	                    					index=8;
	 			                        	break;
	                    				case 23:
	                    					sigunguCodeStr="용인시";
	                    					index=8;
	 			                        	break;
	                    				case 24:
	                    					sigunguCodeStr="의왕시";
	                    					index=8;
	 			                        	break;
	                    				case 25:
	                    					sigunguCodeStr="의정부시";
	                    					index=8;
	 			                        	break;
	                    				case 26:
	                    					sigunguCodeStr="이천시";
	                    					index=8;
	 			                        	break;
	                    				case 27:
	                    					sigunguCodeStr="파주시";
	                    					index=8;
	 			                        	break;
	                    				case 28:
	                    					sigunguCodeStr="평택시";
	                    					index=8;
	 			                        	break;
	                    				case 29:
	                    					sigunguCodeStr="포천시";
	                    					index=8;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="과천시";
	                    					index=8;
	 			                        	break;
	                    				case 30:
	                    					sigunguCodeStr="하남시";
	                    					index=8;
	 			                        	break;
	                    				case 31:
	                    					sigunguCodeStr="화성시";
	                    					index=8;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="광명시";
	                    					index=8;
	                    				case 5:
	                    					sigunguCodeStr="광주시";
	                    					index=8;
	                    				case 6:
	                    					sigunguCodeStr="구리시";
	                    					index=8;
	                    				case 7:
	                    					sigunguCodeStr="군포시";
	                    					index=8;
	                    				case 8:
	                    					sigunguCodeStr="김포시";
	                    					index=8;
	                    				case 9:
	                    					sigunguCodeStr="남양주시";
	                    					index=8;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	                				}//End of switch block	
                    			} else if(areaCode==32) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="강릉시";
	                    					index=9;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="인제군";
	                    					index=9;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="정선군";
	                    					index=9;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="철원군";
	                    					index=9;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="춘천시";
	                    					index=9;
	 			                        	break;
	                    				case 14:
	                    					sigunguCodeStr="태백시";
	                    					index=9;
	 			                        	break;
	                    				case 15:
	                    					sigunguCodeStr="평창군";
	                    					index=9;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="홍천군";
	                    					index=9;
	 			                        	break;
	                    				case 17:
	                    					sigunguCodeStr="화천군";
	                    					index=9;
	 			                        	break;
	                    				case 18:
	                    					sigunguCodeStr="횡성군";
	                    					index=9;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="고성군";
	                    					index=9;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="동해시";
	                    					index=9;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="삼척시";
	                    					index=9;
	 			                        	break;
	                    				case 5:
	                    					sigunguCodeStr="속초시";
	                    					index=9;
	                    				case 6:
	                    					sigunguCodeStr="양구군";
	                    					index=9;
	                    				case 7:
	                    					sigunguCodeStr="양양군";
	                    					index=9;
	                    				case 8:
	                    					sigunguCodeStr="영월군";
	                    					index=9;
	                    				case 9:
	                    					sigunguCodeStr="원주시";
	                    					index=9;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	                				}//End of switch block		
                    			} else if(areaCode==33) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="괴산군";
	                    					index=10;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="청주시";
	                    					index=10;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="충주시";
	                    					index=10;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="증평군";
	                    					index=10;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="단양군";
	                    					index=10;
	 			                        	break;
	                    				case 3:
	                    					sigunguCodeStr="보은군";
	                    					index=10;
	 			                        	break;
	                    				case 4:
	                    					sigunguCodeStr="영동군";
	                    					index=10;
	                    				case 5:
	                    					sigunguCodeStr="옥천군";
	                    					index=10;
	                    				case 6:
	                    					sigunguCodeStr="음성군";
	                    					index=10;
	                    				case 7:
	                    					sigunguCodeStr="제천시";
	                    					index=10;
	                    				case 8:
	                    					sigunguCodeStr="진천군";
	                    					index=10;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	                				}//End of switch block		
                    			} else if(areaCode==34) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="공주시";
	                    					index=11;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="예산군";
	                    					index=11;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="천안시";
	                    					index=11;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="청양군";
	                    					index=11;
	 			                        	break;
	                    				case 14:
	                    					sigunguCodeStr="태안군";
	                    					index=11;
	 			                        	break;
	                    				case 15:
	                    					sigunguCodeStr="홍성군";
	                    					index=11;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="계룡시";
	                    					index=11;
	                    				case 2:
	                    					sigunguCodeStr="금산군";
	                    					index=11;
	                    				case 3:
	                    					sigunguCodeStr="논산시";
	                    					index=11;
	                    				case 4:
	                    					sigunguCodeStr="당진시";
	                    					index=11;
	                    				case 5:
	                    					sigunguCodeStr="보령시";
	                    					index=11;
	                    				case 6:
	                    					sigunguCodeStr="부여군";
	                    					index=11;
	                    				case 7:
	                    					sigunguCodeStr="서산시";
	                    					index=11;
	                    				case 8:
	                    					sigunguCodeStr="서천군";
	                    					index=11;
	                    				case 9:
	                    					sigunguCodeStr="아산시";
	                    					index=11;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
                					}//End of switch block		
                    			} else if(areaCode==37) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="고창군";
	                    					index=12;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="임실군";
	                    					index=12;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="장수군";
	                    					index=12;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="전주시";
	                    					index=12;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="정읍시";
	                    					index=12;
	 			                        	break;
	                    				case 14:
	                    					sigunguCodeStr="진안군";
	                    					index=12;
	 			                        	break;
	                    				case 2:
	                    					sigunguCodeStr="군산시";
	                    					index=12;
	                    				case 3:
	                    					sigunguCodeStr="김제시";
	                    					index=12;
	                    				case 4:
	                    					sigunguCodeStr="남원시";
	                    					index=12;
	                    				case 5:
	                    					sigunguCodeStr="무주군";
	                    					index=12;
	                    				case 6:
	                    					sigunguCodeStr="부안군";
	                    					index=12;
	                    				case 7:
	                    					sigunguCodeStr="순창군";
	                    					index=12;
	                    				case 8:
	                    					sigunguCodeStr="완주군";
	                    					index=12;
	                    				case 9:
	                    					sigunguCodeStr="익산시";
	                    					index=12;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	            					}//End of switch block			
                    			} else if(areaCode==38) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="강진군";
	                    					index=13;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="보성군";
	                    					index=13;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="순천시";
	                    					index=13;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="신안군";
	                    					index=13;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="여수시";
	                    					index=13;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="영광군";
	                    					index=13;
	 			                        	break;
	                    				case 17:
	                    					sigunguCodeStr="영암군";
	                    					index=13;
	                    				case 18:
	                    					sigunguCodeStr="완도군";
	                    					index=13;
	                    				case 19:
	                    					sigunguCodeStr="장성군";
	                    					index=13;
	                    				case 2:
	                    					sigunguCodeStr="고흥군";
	                    					index=13;
	                    				case 20:
	                    					sigunguCodeStr="장흥군";
	                    					index=13;
	                    				case 21:
	                    					sigunguCodeStr="진도군";
	                    					index=13;
	                    				case 22:
	                    					sigunguCodeStr="함평군";
	                    					index=13;
	                    				case 23:
	                    					sigunguCodeStr="해남군";
	                    					index=13;
	                    				case 24:
	                    					sigunguCodeStr="화순군";
	                    					index=13;
	                    				case 3:
	                    					sigunguCodeStr="곡성군";
	                    					index=13;
	                    				case 4:
	                    					sigunguCodeStr="광양시";
	                    					index=13;
	                    				case 5:
	                    					sigunguCodeStr="구례군";
	                    					index=13;
	                    				case 6:
	                    					sigunguCodeStr="나주시";
	                    					index=13;
	                    				case 7:
	                    					sigunguCodeStr="담양군";
	                    					index=13;
	                    				case 8:
	                    					sigunguCodeStr="목포시";
	                    					index=13;
	                    				case 9:
	                    					sigunguCodeStr="무안군";
	                    					index=13;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	            					}//End of switch block			
                    			} else if(areaCode==35) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="경산시";
	                    					index=14;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="성주군";
	                    					index=14;
	 			                        	break;
	                    				case 11:
	                    					sigunguCodeStr="안동시";
	                    					index=14;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="영덕군";
	                    					index=14;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="영양군";
	                    					index=14;
	 			                        	break;
	                    				case 14:
	                    					sigunguCodeStr="영주시";
	                    					index=14;
	 			                        	break;
	                    				case 15:
	                    					sigunguCodeStr="영천시";
	                    					index=14;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="예천군";
	                    					index=14;
	 			                        	break;
	                    				case 17:
	                    					sigunguCodeStr="울릉군";
	                    					index=14;
	                    				case 18:
	                    					sigunguCodeStr="울진군";
	                    					index=14;
	                    				case 19:
	                    					sigunguCodeStr="의성군";
	                    					index=14;
	                    				case 2:
	                    					sigunguCodeStr="경주시";
	                    					index=14;
	                    				case 20:
	                    					sigunguCodeStr="청도군";
	                    					index=14;
	                    				case 21:
	                    					sigunguCodeStr="청송군";
	                    					index=14;
	                    				case 22:
	                    					sigunguCodeStr="칠곡군";
	                    					index=14;
	                    				case 23:
	                    					sigunguCodeStr="포항시";
	                    					index=14;
	                    				case 3:
	                    					sigunguCodeStr="고령군";
	                    					index=14;
	                    				case 4:
	                    					sigunguCodeStr="구미시";
	                    					index=14;
	                    				case 5:
	                    					sigunguCodeStr="군위군";
	                    					index=14;
	                    				case 6:
	                    					sigunguCodeStr="김천시";
	                    					index=14;
	                    				case 7:
	                    					sigunguCodeStr="문경시";
	                    					index=14;
	                    				case 8:
	                    					sigunguCodeStr="봉화군";
	                    					index=14;
	                    				case 9:
	                    					sigunguCodeStr="상주시";
	                    					index=14;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	            					}//End of switch block				
                    			} else if(areaCode==36) {
                    				switch(myItem[0].sigungucode) {
	                    				case 1:
	                    					sigunguCodeStr="거제시";
	                    					index=15;
	 			                        	break;
	                    				case 10:
	                    					sigunguCodeStr="양산시";
	                    					index=15;
	 			                        	break;
	                    				case 12:
	                    					sigunguCodeStr="의령군";
	                    					index=15;
	 			                        	break;
	                    				case 13:
	                    					sigunguCodeStr="진주시";
	                    					index=15;
	 			                        	break;
	                    				case 15:
	                    					sigunguCodeStr="창녕군";
	                    					index=15;
	 			                        	break;
	                    				case 16:
	                    					sigunguCodeStr="창원시";
	                    					index=15;
	 			                        	break;
	                    				case 17:
	                    					sigunguCodeStr="통영시";
	                    					index=15;
	                    				case 18:
	                    					sigunguCodeStr="하동군";
	                    					index=15;
	                    				case 19:
	                    					sigunguCodeStr="함안군";
	                    					index=15;
	                    				case 2:
	                    					sigunguCodeStr="거창군";
	                    					index=15;
	                    				case 20:
	                    					sigunguCodeStr="함양군";
	                    					index=15;
	                    				case 21:
	                    					sigunguCodeStr="합천군";
	                    					index=15;
	                    				case 3:
	                    					sigunguCodeStr="고성군";
	                    					index=15;
	                    				case 4:
	                    					sigunguCodeStr="김해시";
	                    					index=15;
	                    				case 5:
	                    					sigunguCodeStr="남해군";
	                    					index=15;
	                    				case 7:
	                    					sigunguCodeStr="밀양시";
	                    					index=15;
	                    				case 8:
	                    					sigunguCodeStr="사천시";
	                    					index=15;
	                    				case 9:
	                    					sigunguCodeStr="산청군";
	                    					index=15;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	            					}//End of switch block		
                    			} 
                    			else {
                    				switch(myItem[0].sigungucode) {
	                    				case 3:
	                    					sigunguCodeStr="서귀포시";
	                    					index=16;
	                    				case 4:
	                    					sigunguCodeStr="제주시";
	                    					index=16;
	                    			 	default:
	                    					sigunguCodeStr="지역 분류 없음"; 
	            					}//End of switch block		
                    			}
  
                    			/*Name Output space*/
                    			var output = '';
    	                   		output += '<span style="font-size:22px; font-family: 나눔고딕">'  + sigunguCodeStr + '</span>';
                    		}
		                    
                    		/*Syntax for setting the active class specified in the previous page (이전 페이지에 지정된 활성 클래스를 설정하기위한 구문)*/	
                    		$("ul.nav-pills>li").eq(index).addClass("active");
		                    
                    		output += '<hr>';
	                   	 	output += '<span style="font-weight:bold; font-size:15px;">총<span style="color:#9ECFFF; font-weight:bold; font-size:15px;">'+myItem.length+'</span>건</span> ';
	                   	    output += '<hr>';
                    		
                    		/*This is a statement that displays the imported API information (가져온 API정보를 출력하는 구문이다.)*/
                   			for(var i = 0; i<myItem.length; i++) {
                    			var contentid=myItem[i].contentid;
                        			console.log("resAreaSub.jsp myItem.length confirm >>> : " + myItem.length);
                        			console.log("resAreaSub.jsp myItem[i].title confirm >>> : " + contentid); 
                        			
                                     output += '<span style="font-size:21px; font-family: 나눔고딕" onclick="detail('+myItem[i].contentid+')">' + myItem[i].title + '</span>';
                                     output += '<br>';
                                     output += '<br>';
                                     
                                     output += '<div class="col-md-12" id="col0">';
                                     output += '<div class="col1">';
                                     output += '<p> 조회수 : ' + myItem[i].readcount + '</p>';
                                     if(myItem[i].addr1 != null){
                                    	 output += '<p> 주 소 : ' + myItem[i].addr1 + '</p>';	 
                                     } else {
                                    	 output += '<p> 주 소 : 미등록 상태입니다.</p>';
                                     }
                                     if(myItem[i].tel != null){
	                                     output += '<p> 전화번호 : ' + myItem[i].tel + '</p>';
                                     } else {
                                    	 output += '<p> 전화번호 : 미등록 상태입니다.</p>';
                                     }
                                     output += '</div>';
                                     
                                     output += '<div class="col2">';
                                     output += '<img id="offstar" align="right" onclick="onstar('+myItem[i].contenttypeid+', '+myItem[i].contentid+', &#39;'+myItem[i].title+'&#39;, &#39;'+myItem[i].addr1+'&#39;)" width="30px" height="30px" src="/img/흰별.jpg" alt="이미지가 없습니다.">';
                                     output += '</div>';
                                     
                                     output += '<div class="col3">';
                                     output += '<img class="img-rounded" onclick="detail('+myItem[i].contentid+')" src="' + myItem[i].firstimage  + '"alt="이미지가 없습니다." onerror="this.src=\'/img/ResAreaOnerror.png\'">';
                                     output += '</div>';
                                     output += '</div>';
                                     
                                     output += '<div class="col4"><hr></div>';      
                     		}
                    		console.log("resAreaSub.jsp All output confirm >>> : " + output);
                     		$(".List").html(output);
                     		//document.body.innerHTML += output;
                     		
                     		console.log("resAreaSub.jsp myItem.length confirm >>> : " + myItem.length);
                     		
                     		var output1 = '';
                     			
                     		/*This is a list of regions
                     		  that belong to the region that changes depending on the region (지역에 따라 바뀌는 해당지역에 속하는 지역 리스트이다)*/                    			
                    			if(areaCode==1) {
                       			 	output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                       			 	output1 +='<li class="sigungulistbtn">'
                       			 	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=1"><button type="button" class="btn" ><span>#강남구</span></button></a>'
                       			 	output1 +='</li>'
                       			 	output1 +='<li class="sigungulistbtn">'
                       			 	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=10"><button type="button" class="btn" ><span>#도봉구</span></button></a>'
                       			 	output1 +='</li>'
                       			 	output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=12"><button type="button" class="btn" ><span>#동작구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=13"><button type="button" class="btn" ><span>#마포구</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=15"><button type="button" class="btn" ><span>#서초구</span></button></a>'
                               	    output1 +='</li>'
                               	    output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=16"><button type="button" class="btn" ><span>#성동구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=17"><button type="button" class="btn" ><span>#성북구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=18"><button type="button" class="btn" ><span>#송파구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=19"><button type="button" class="btn" ><span>#양천구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=2"><button type="button" class="btn" ><span>#강동구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=21"><button type="button" class="btn"><span>#용산구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=22"><button type="button" class="btn" ><span>#은평구</span></button></a>'                  			 			
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=23"><button type="button" class="btn" ><span>#종로구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=25"><button type="button" class="btn" ><span>#중랑구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=3"><button type="button" class="btn" ><span>#강북구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=4"><button type="button" class="btn" ><span>#강서구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=5"><button type="button" class="btn" ><span>#관악구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=6"><button type="button" class="btn" ><span>#광진구</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=7"><button type="button" class="btn" ><span>#구로구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=8"><button type="button" class="btn" ><span>#금천구</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=9"><button type="button" class="btn" ><span>#노원구</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=24"><button type="button" class="btn" ><span>#중구&nbsp&nbsp&nbsp&nbsp</span></button></a>'
                                    output1 +='</li>'
                       			 	output1 +='<li class="sigungulistbtn">'
                       			 	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=11"><button type="button" class="btn" ><span>#동대문구</span></button></a>'
                       			 	output1 +='</li>'	
                       			 	output1 +='<li class="sigungulistbtn">'
                       			 	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=14"><button type="button" class="btn" ><span>#서대문구</span></button></a>'
                       			 	output1 +='</li>'
                       			 	output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=20"><button type="button" class="btn" ><span>#영등포구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='</ul>'
                    			} else if(areaCode==2) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=1"><button type="button" class="btn" ><span>#강화군</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=10"><button type="button" class="btn" ><span>#중구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=2"><button type="button" class="btn" ><span>#계양구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=4"><button type="button" class="btn" ><span>#남동구</span></button></a>'		
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=5"><button type="button" class="btn" ><span>#동구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=3"><button type="button" class="btn" ><span>#미추홀구</span></button></a>'
                                   	output1 +='</li>'
                         			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=6"><button type="button" class="btn" ><span>#부평구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=7"><button type="button" class="btn" ><span>#서구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=8"><button type="button" class="btn" ><span>#연수구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=9"><button type="button" class="btn" ><span>#옹진군</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='</ul>'
                    			} else if(areaCode==3) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=3&sigunguCode=1"><button type="button" class="btn" ><span>#대덕구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=3&sigunguCode=2"><button type="button" class="btn" ><span>#동구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=3&sigunguCode=3"><button type="button" class="btn" ><span>#서구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=3&sigunguCode=4"><button type="button" class="btn" ><span>#유성구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=3&sigunguCode=5"><button type="button" class="btn" ><span>#중구</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='</ul>'	
                    			} else if(areaCode==8) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=8&sigunguCode=1"><button type="button" class="btn" ><span>#세종시</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='</ul>'	
                    			} else if(areaCode==5) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=5&sigunguCode=2"><button type="button" class="btn" ><span>#남구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=5&sigunguCode=3"><button type="button" class="btn" ><span>#동구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=5&sigunguCode=1"><button type="button" class="btn" ><span>#광산구</span></button></a>'
                                    output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=5&sigunguCode=4"><button type="button" class="btn" ><span>#북구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=5&sigunguCode=5"><button type="button" class="btn" ><span>#서구</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='</ul>'
                    			} else if(areaCode==4) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=7"><button type="button" class="btn" ><span>#수성구</span></button></a>'
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=1"><button type="button" class="btn" ><span>#남구</span></button></a>'
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=4"><button type="button" class="btn" ><span>#동구</span></button></a>'
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=2"><button type="button" class="btn" ><span>#달서구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=5"><button type="button" class="btn" ><span>#북구</span></button></a>'		
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=6"><button type="button" class="btn" ><span>#서구</span></button></a>'
                                    output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=3"><button type="button" class="btn" ><span>#달성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=8"><button type="button" class="btn" ><span>#중구</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='</ul>'	
                    			} else if(areaCode==6) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=1"><button type="button" class="btn" ><span>#강서구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=10"><button type="button" class="btn" ><span>#사하구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=16"><button type="button" class="btn" ><span>#해운대구</span></button></a>'
                                   	output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=12"><button type="button" class="btn" ><span>#수영구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=13"><button type="button" class="btn" ><span>#연제구</span></button></a>'		
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=7"><button type="button" class="btn" ><span>#부산진구</span></button></a>'
                                   	output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=14"><button type="button" class="btn" ><span>#영도구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=2"><button type="button" class="btn" ><span>#금정구</span></button></a>'
                                  	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=3"><button type="button" class="btn" ><span>#기장군</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=9"><button type="button" class="btn" ><span>#사상구</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=6"><button type="button" class="btn" ><span>#동래구</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=15"><button type="button" class="btn" ><span>#중구</span></button></a>'
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=11"><button type="button" class="btn" ><span>#서구</span></button></a>'
                                   	output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=4"><button type="button" class="btn" ><span>#남구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=5"><button type="button" class="btn" ><span> #동구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=8"><button type="button" class="btn" ><span>#북구</span></button></a>'                  			 			
                           			output1 +='</li>'
                           			output1 +='</ul>'
                    			} else if(areaCode==7) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=7&sigunguCode=1"><button type="button" class="btn" ><span>#중구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=7&sigunguCode=2"><button type="button" class="btn" ><span>#남구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=7&sigunguCode=3"><button type="button" class="btn" ><span>#동구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=7&sigunguCode=4"><button type="button" class="btn" ><span>#북구</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=7&sigunguCode=5"><button type="button" class="btn" ><span>#울주군</span></button></a>'		
                           			output1 +='</li>'
                           			output1 +='</ul>'
                    			} else if(areaCode==31) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=1"><button type="button" class="btn" ><span>#가평군</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=11"><button type="button" class="btn" ><span>#부천시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=10"><button type="button" class="btn" ><span>#동두천시</span></button></a>'
                                   	output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=12"><button type="button" class="btn" ><span>#성남시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=13"><button type="button" class="btn" ><span>#수원시</span></button></a>'		
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=14"><button type="button" class="btn" ><span>#시흥시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=15"><button type="button" class="btn" ><span>#안산시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=16"><button type="button" class="btn" ><span>#안성시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=17"><button type="button" class="btn" ><span>#안양시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=18"><button type="button" class="btn" ><span>#양주시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=19"><button type="button" class="btn" ><span>#양평군</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=2"><button type="button" class="btn" ><span>#고양시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=20"><button type="button" class="btn" ><span>#여주시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=21"><button type="button" class="btn" ><span>#연천군</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=22"><button type="button" class="btn" ><span>#오산시</span></button></a>'                  			 			
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=23"><button type="button" class="btn" ><span>#용인시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=24"><button type="button" class="btn" ><span>#의왕시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=25"><button type="button" class="btn" ><span>#의정부시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=26"><button type="button" class="btn" ><span>#이천시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=27"><button type="button" class="btn" ><span>#파주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=28"><button type="button" class="btn" ><span>#평택시</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=29"><button type="button" class="btn" ><span>#포천시</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=3"><button type="button" class="btn" ><span>#과천시</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=30"><button type="button" class="btn" ><span>#하남시</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=31"><button type="button" class="btn" ><span>#화성시</span></button></a>'
                                   	output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=4"><button type="button" class="btn" ><span>#광명시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=5"><button type="button" class="btn" ><span>#광주시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=6"><button type="button" class="btn" ><span>#구리시</span></button></a>'		
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=7"><button type="button" class="btn" ><span>#군포시</span></button></a>'
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=8"><button type="button" class="btn" ><span>#김포시</span></button></a>'		
                           			output1 +='</li>'
                           			output1 +='<li class="sigungulistbtn">'
                           			output1 +='<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=9"><button type="button" class="btn" ><span>#남양주시</span></button></a>'		
                           			output1 +='</li>'
                           			output1 +='</ul>'
                    			} else if(areaCode==32) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=1"><button type="button" class="btn" ><span>#강릉시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=10"><button type="button" class="btn" ><span>#인제군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=11"><button type="button" class="btn" ><span>#정선군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=12"><button type="button" class="btn" ><span>#철원군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=13"><button type="button" class="btn" ><span>#춘천시</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=14"><button type="button" class="btn" ><span>#태백시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=15"><button type="button" class="btn" ><span>#평창군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=16"><button type="button" class="btn" ><span>#홍천군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=17"><button type="button" class="btn" ><span>#화천군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=18"><button type="button" class="btn" ><span>#횡성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=2"><button type="button" class="btn" ><span>#고성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=3"><button type="button" class="btn" ><span>#동해시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=4"><button type="button" class="btn" ><span>#삼척시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=5"><button type="button" class="btn" ><span>#속초시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=6"><button type="button" class="btn" ><span>#양구군</span></button></a>'                  			 			
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=7"><button type="button" class="btn" ><span>#양양군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=8"><button type="button" class="btn" ><span>#영월군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=9"><button type="button" class="btn" ><span>#원주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='</ul>'
                    			} else if(areaCode==33) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=1"><button type="button" class="btn" ><span>#괴산군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=10"><button type="button" class="btn" ><span>#청주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=11"><button type="button" class="btn" ><span>#충주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=12"><button type="button" class="btn" ><span>#증평군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=2"><button type="button" class="btn" ><span>#단양군</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=3"><button type="button" class="btn" ><span>#보은군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=4"><button type="button" class="btn" ><span>#영동군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=5"><button type="button" class="btn" ><span>#옥천군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=6"><button type="button" class="btn" ><span>#음성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=7"><button type="button" class="btn" ><span>#제천시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=8"><button type="button" class="btn" ><span>#진천군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='</ul>'
                    			} else if(areaCode==34) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=1"><button type="button" class="btn" ><span>#공주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=11"><button type="button" class="btn" ><span>#예산군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=12"><button type="button" class="btn" ><span>#천안시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=13"><button type="button" class="btn" ><span>#청양군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=14"><button type="button" class="btn" ><span>#태안군</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=15"><button type="button" class="btn" ><span>#홍성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=16"><button type="button" class="btn" ><span>#계룡시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=2"><button type="button" class="btn" ><span>#금산군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=3"><button type="button" class="btn" ><span>#논산시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=4"><button type="button" class="btn" ><span>#당진시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=5"><button type="button" class="btn" ><span>#보령시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=6"><button type="button" class="btn" ><span>#부여군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=7"><button type="button" class="btn" ><span>#서산시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=8"><button type="button" class="btn" ><span>#서천군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=9"><button type="button" class="btn" ><span>#아산시</span></button></a>'                  			 			
                               		output1 +='</li>'
                               		output1 +='</ul>'	
                    			} else if(areaCode==37) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=1"><button type="button" class="btn" ><span>#고창군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=10"><button type="button" class="btn" ><span>#임실군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=11"><button type="button" class="btn" ><span>#장수군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=12"><button type="button" class="btn" ><span>#전주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=13"><button type="button" class="btn" ><span>#정읍시</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=14"><button type="button" class="btn" ><span>#진안군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=2"><button type="button" class="btn" ><span>#군산시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=3"><button type="button" class="btn" ><span>#김제시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=4"><button type="button" class="btn" ><span>#남원시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=5"><button type="button" class="btn" ><span>#무주군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=6"><button type="button" class="btn" ><span>#부안군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=7"><button type="button" class="btn" ><span>#순창군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=8"><button type="button" class="btn" ><span>#완주군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=9"><button type="button" class="btn" ><span>#익산시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='</ul>'
                    			} else if(areaCode==38) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=1"><button type="button" class="btn" ><span>#강진군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=10"><button type="button" class="btn" ><span>#보성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=11"><button type="button" class="btn" ><span>#순천시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=12"><button type="button" class="btn" ><span>#신안군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=13"><button type="button" class="btn" ><span>#여수시</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=16"><button type="button" class="btn" ><span>#영광군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=17"><button type="button" class="btn" ><span>#영암군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=18"><button type="button" class="btn" ><span>#완도군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=19"><button type="button" class="btn" ><span>#장성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=2"><button type="button" class="btn" ><span>#고흥군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=20"><button type="button" class="btn" ><span>#장흥군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=21"><button type="button" class="btn" ><span>#진도군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=22"><button type="button" class="btn" ><span>#함평군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=23"><button type="button" class="btn" ><span>#해남군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=24"><button type="button" class="btn" ><span>#화순군</span></button></a>'                  			 			
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=3"><button type="button" class="btn" ><span>#곡성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=4"><button type="button" class="btn" ><span>#광양시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=5"><button type="button" class="btn" ><span>#구례군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=6"><button type="button" class="btn" ><span>#나주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=7"><button type="button" class="btn" ><span>#담양군</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=8"><button type="button" class="btn" ><span>#목포시</span></button></a>'
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=9"><button type="button" class="btn" ><span>#무안군</span></button></a>'
                                    output1 +='</li>'
                               		output1 +='</ul>'
                    			} else if(areaCode==35) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=1"><button type="button" class="btn" ><span>#경산시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=10"><button type="button" class="btn" ><span>#성주군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=11"><button type="button" class="btn" ><span>#안동시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=12"><button type="button" class="btn" ><span>#영덕군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=13"><button type="button" class="btn" ><span>#영양군</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=14"><button type="button" class="btn" ><span>#영주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=15"><button type="button" class="btn" ><span>#영천시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=16"><button type="button" class="btn" ><span>#예천군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=17"><button type="button" class="btn" ><span>#울릉군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=18"><button type="button" class="btn" ><span>#울진군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=19"><button type="button" class="btn" ><span>#의성군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=2"><button type="button" class="btn" ><span>#경주시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=20"><button type="button" class="btn" ><span>#청도군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=21"><button type="button" class="btn" ><span>#청송군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=22"><button type="button" class="btn" ><span>#칠곡군</span></button></a>'                  			 			
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=23"><button type="button" class="btn" ><span>#포항시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=3"><button type="button" class="btn" ><span>#고령군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=4"><button type="button" class="btn" ><span>#구미시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=5"><button type="button" class="btn" ><span>#군위군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                                   	output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=6"><button type="button" class="btn" ><span>#김천시</span></button></a>'
                                   	output1 +='</li>'
                                   	output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=7"><button type="button" class="btn" ><span>#문경시</span></button></a>'
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=8"><button type="button" class="btn" ><span>#봉화군</span></button></a>'
                                    output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=9"><button type="button" class="btn" ><span>#상주시</span></button></a>'
                                    output1 +='</li>'
                               		output1 +='</ul>'
                    			} else if(areaCode==36) {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=1"><button type="button" class="btn" ><span>#거제시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=10"><button type="button" class="btn" ><span>#양산시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=12"><button type="button" class="btn" ><span>#의령군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=13"><button type="button" class="btn" ><span>#진주시</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=15"><button type="button" class="btn" ><span>#창녕군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=16"><button type="button" class="btn" ><span>#창원시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=17"><button type="button" class="btn" ><span>#통영시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=18"><button type="button" class="btn" ><span>#하동군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=19"><button type="button" class="btn" ><span>#함안군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=2"><button type="button" class="btn" ><span>#거창군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=20"><button type="button" class="btn" ><span>#함양군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=21"><button type="button" class="btn" ><span>#합천군</span></button></a>'
                               		output1 +='</li>'
                                    output1 +='<li class="sigungulistbtn">'
                                    output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=3"><button type="button" class="btn" ><span>#고성군</span></button></a>'
                                    output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=4"><button type="button" class="btn" ><span>#김해시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=5"><button type="button" class="btn" ><span>#남해군</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=7"><button type="button" class="btn" ><span>#밀양시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=8"><button type="button" class="btn" ><span>#사천시</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=9"><button type="button" class="btn" ><span>#산청군</span></button></a>'		
                               		output1 +='</li>'
                               		output1 +='</ul>'	
                    			} else {
                    				output1 +='<ul class="tag_list area_view_list js_multi" id="sigungulist" >'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=3"><button type="button" class="btn" ><span>#서귀포시</span></button></a>'
                               		output1 +='</li>'
                               		output1 +='<li class="sigungulistbtn">'
                               		output1 +='<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=4"><button type="button" class="btn" ><span>#제주시</span></button></a>'		
                               		output1 +='</li>' 
                               		output1 +='</ul>'
                    			}               
                   			$(".belongToArea").html(output1);
                   			page();
                		  },
               	error : function(XMLHttpRequest, textStatus, errorThrown) {
               				alert("error Status >>> : " + textStatus);
                			alert("Error confirm >>> : " + errorThrown);
                		}
            });//End of ajax block
		});//End of document.ready block

		//Go to detail page (디테일 페이지로 이동)
        function detail(contentid) {
        	//alert("resAreaSub.jsp contentid confirm >>> : " + contentid);
        	location.href = "/toBoard/toBoardDetail.to?contentid="+contentid;
        }
        
        function onstar(contentTypeId,contentid,title,addr1) {			
			$.ajax({
				url : '/mypage/insertMyFavorite.do',
				type : 'get',
				data : {contentTypeId:contentTypeId,contentId:contentid,title:title,addr1:addr1},
				dataType : 'text',
				success : function(data) {
							alert(title+ "이(가) 즐겨찾기에 추가되었습니다.");
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
							alert("로그인한 회원만 이용 가능합니다.");
				}
			});	
		}
        
        function offstar(contentid) {
        	location.href = "/mypage/deleteMyFavorite.do?contentId="+contentid;   
        }
        
         <%--paging function--%>
         <%--function goPaging(pageNum){
        	$("#pageno").val(pageNum);
        	$("#pageForm").attr("action", "/toBoard/resAreaSub.do");
        	$("#pageForm").submit();
        }//End of goPaging() function block --%>
      	
        
        
        /* var totalCount = 0;   //총게시물수
 		var totalPage = 0;    //총페이지수
 		var currentPage = 1;   //현재 페이지번호
 		var startPage = 1;     //시작페이지번호
 		var endPage = 0;       //끝페이지 번호
		var countList = 0;    //한페이지의 게시물수
 		var countPage = 10;    //한페이지의 페이지수  */
        
      /*   function page() {
        	if(currentPage ="") {
        		int currentPageNum = currentPage;
        			<ul class="pagination">
    	 				<li>
    						<a onclick="goPaging(startPage)"> << </a>
    					</li>
    					
    					<li>
    						<a onclick="goPaging(currentPageNum-1)"> < </a>
    					</li>

    					int cutPageNum = 0;
    					int newStartPage = 0;
    						for(newStartPage = startPage; newStartPage <= totalPage; newStartPage++) {

    							<li>
    								<a onclick="goPaging(newStartPage)" class="startPageNo">newStartPage</a>
    							</li>

    							if(cutPageNum >= 14) {
    								break;
    							}//End of if block
    							cutPageNum++;
    								System.out.println("resAreaSub.jsp cutPageNum confirm >>> : " + cutPageNum);
    						}//End of for block
    					
    						if(currentPageNum < totalPage)
    						<li>
    							<a onclick="goPaging(currentPageNum+1)"> > </a>
    						</li>
    						
    						<li>
    							<a onclick="goPaging(endPage)"> >> </a>
    						</li> 
    				</ul>
        		
        	}
			
				
        	
        } */
        
/*   
   		How to use addClass syntax
   		that can be used when page movement occurs immediately without using AJAX
   		(AJAX를 사용하지 않고 즉시 페이지 이동이  발생할 때 사용하는 addClass 구문을 사용하는 방법)
   		
   		function a(val){
        	var sBtn = $("ul.nav-pills>li");
            sBtn.find("a").click(function(){		
            sBtn.removeClass("active");
            $("#"+val).parent().addClass("active").siblings().find('.active').removeClass("active");
        }) 
*/	
	</script>
</head>

<body>
	<!--Start Header Section-->
	<section id="header">
		<div class="header-area">
			<div class="top_header">
				<div class="container">
					<div class="row">
               			<div class="col-md-12">
                  			<div class="social_icon text-right">
			                     <%
			                        hs=request.getSession(true);
			                     	mno=(String) hs.getAttribute("mno");
			                        mid=(String) hs.getAttribute("mid");
			                        mname=(String) hs.getAttribute("mname");
			                        memail=(String) hs.getAttribute("memail");
			                        mgrade=(String) hs.getAttribute("mgrade");
			                        
			                        if(mid == null) {
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
					<!--Brand and toggle get grouped for better mobile display (더 나은 모바일 디스플레이를 위해 브랜드 및 토글 그룹화)-->
					
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
	<!--End of Hedaer Section-->
   
   	<br>
		
	<div class="container">
		<!--Regional category (지역 카테고리)-->
		<div role="tabpanel">
			<div class="col-sm-2">	
				<ul class="nav nav-pills brand-pills nav-stacked" role="tablist">
					<li role="presentation" class="brand-nav" >
			        	<a href="/toBoard/resAreaSub.do?areaCode=1&sigunguCode=99">서&nbsp;&nbsp;울</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=2&sigunguCode=99">인&nbsp;&nbsp;천</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=3&sigunguCode=99">대&nbsp;&nbsp;전</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=8&sigunguCode=99">세&nbsp;&nbsp;종</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=5&sigunguCode=99">광&nbsp;&nbsp;주</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=4&sigunguCode=99">대&nbsp;&nbsp;구</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=6&sigunguCode=99">부&nbsp;&nbsp;산</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=7&sigunguCode=99">울&nbsp;&nbsp;산</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=31&sigunguCode=99">경&nbsp;&nbsp;기</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=32&sigunguCode=99">강&nbsp;&nbsp;원</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=33&sigunguCode=99">충&nbsp;&nbsp;북</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=34&sigunguCode=99">충&nbsp;&nbsp;남</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=37&sigunguCode=99">전&nbsp;&nbsp;북</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=38&sigunguCode=99">전&nbsp;&nbsp;남</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=35&sigunguCode=99">경&nbsp;&nbsp;북</a>
			        </li>
				
					<li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=36&sigunguCode=99">경&nbsp;&nbsp;남</a>
			        </li>
			        
			        <li role="presentation" class="brand-nav">
			        	<a href="/toBoard/resAreaSub.do?areaCode=39&sigunguCode=99">제&nbsp;&nbsp;주</a>
			        </li>
				</ul>
			</div>
		</div>
		<!--End of Regional category-->
		
		<!--Page Content-->	
		<div class="col-md-10">
			<h3 class="text-info"></h3>
				<div class="List">     
	    		</div>
	    		
			<!--End of Page Content-->
			<div class="box_rightType1">
				<div class="area_tagList">
					<p style="font-size:20px; text-align:center; padding-right:6%; color: #9b9898;">지    역</p>
					<hr style="margin-top: 0px; margin-bottom: 5px; border: 0; border-top: 1px solid #eee;">
					<div class="belongToArea">
					</div>
				</div>
				<!--End of area_tagList-->
			</div>
			<!--End of box_rightType1-->
		</div>
		<!--End of col-md-10-->
	</div>
	<!--End of container-->
	
	<center>
		<div id="paging">
			<form id="pageForm">
				<input type="hidden" id="pageno" name="pageno" value='' />
			</form>
			
			
			<%-- <c:if test="<%= %>">
				<c:set var="currentPageNum" value="$(currentPage)" />
					<ul class="pagination">
		 		<li>
							<a onclick="goPaging(${startPage})"> << </a>
						</li>
						
						<li>
							<a onclick="goPaging(${currentPageNum-1})"> < </a>
						</li>
						
						<% 
							String startPageStr = String.valueOf(request.getAttribute("startPage"));
								System.out.println("resAreaSub.jsp startPageStr confirm >>> : " + startPageStr);
							int startPage = Integer.valueOf(startPageStr);
							
							String endPageStr = String.valueOf(request.getAttribute("endPage"));
								System.out.println("resAreaSub.jsp endPageStr confirm >>> : " + endPageStr);
							int endPage = Integer.valueOf(endPageStr);
							
							String totalPageStr = String.valueOf(request.getAttribute("totalPage"));
								System.out.println("resAreaSub.jsp totalPage confirm >>> : " + totalPageStr);
							int totalPage = Integer.valueOf(totalPageStr);
							
							int cutPageNum = 0;
							int newStartPage = 0;
							for(newStartPage = startPage; newStartPage <= totalPage; newStartPage++) {
						%>
								<li>
									<a onclick="goPaging(<%=newStartPage%>)" class="startPageNo"><%=newStartPage%></a>
								</li>
						<%
								if(cutPageNum >= 14) {
									break;
								}//End of if block
								cutPageNum++;
									System.out.println("resAreaSub.jsp cutPageNum confirm >>> : " + cutPageNum);
							}//End of for block
						%>
						
						<c:if test test="${currentPageNum < totalPage}">
							<li>
								<a onclick="goPaging(${currentPageNum+1})"> > </a>
							</li>
							
							<li>
								<a onclick="goPaging(${endPage})"> >> </a>
							</li> 
						</c:if>
					</ul>
			</c:if>  --%>
		</div>
	</center>
	
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

	<!--Include all compiled plugins (below), or include individual files as needed-->
	<script src="/js/bootstrap.min.js"></script>
		
	<!-- Custom JavaScript-->
	<script src="/js/main.js"></script>
</body>
</html>