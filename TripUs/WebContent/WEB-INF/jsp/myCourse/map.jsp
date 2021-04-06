<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");
	//String size = request.getParameter("size");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>다음 지도 API</title>
	 <style>
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
</head>
<body>
	<div id="map" style="width:400px; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d7559504429da06478e439733fa3b3a&libraries=services,clusterer,drawingS"></script>
	<script type="text/javascript">
	<%
		System.out.println("map.jsp 진입~~");
		String lat1="37.56682";
		String aa="이건 jstl이다ㅏㅏㅏ";
		request.setAttribute("aa",aa);
		int size = Integer.parseInt(request.getParameter("size"));
		
		String mapx = request.getParameter("mapx");
		String mapy = request.getParameter("mapy");
		String title1 = request.getParameter("homepage");
	if(mapx!=null){
		System.out.println("mapx : "+mapx);
		System.out.println("mapy : "+mapy);
		System.out.println("homepage : "+title1);
		
		System.out.println("size : "+size);
		String[] x = new String[size];
		String[] y = new String[size];
		String[] title = new String[size];
		
		title = title1.split("#");
		x = mapx.split("/");
		y = mapy.split("/");
		
		//System.out.println("title : "+title[0]);
		//System.out.println("x : "+x[0]);
		
		request.setAttribute("title",title);
		request.setAttribute("x",x);
		request.setAttribute("y",y);
		request.setAttribute("size",size);
		
	%>
		
		function kk(){
			console.log("ㅋㅋㅋ 추가 눌렀구만");
		}
		console.log("x[0] : "+"${x[0]}");
		console.log("x[1] : "+"${x[1]}");
		console.log("x[2] : "+"${x[2]}");
		console.log("x[3] : "+"${x[3]}");
		//console.log("x[4] : "+"${x[4]}");
		console.log("y[0] : "+"${y[0]}");
		console.log("y[1] : "+"${y[1]}");
		console.log("y[2] : "+"${y[2]}");
		console.log("y[3] : "+"${y[3]}");
		//console.log("y[4] : "+"${y[4]}");
		console.log("title[0] : "+"${title[0]}");
		console.log("title[1] : "+"${title[1]}");
		console.log("title[2] : "+"${title[2]}");
		console.log("title[3] : "+"${title[3]}");
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.56782, 126.97765), // 지도의 중심좌표
			level : 3, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};
		
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		//var myArray = new Array();
		var myArray = new Array();	
		var json = new Object();
		//myArray.title = "${homepage[0]}";
		//myArray.latlng = new kakao.maps.LatLng("${x[0]}","${y[0]}");
		//json.title = "${title[0]}";
		//json.latlng = new kakao.maps.LatLng("${x[0]}","${y[0]}");
		//myArray.push(json);
		myArray = [
		           {title : '<div class="customoverlay"><span class="title">' +"${title[0]}",
			latlng : new kakao.maps.LatLng("${x[0]}","${y[0]}")
		       } , {title : '<div class="customoverlay"><span class="title">' +"${title[1]}",
			latlng : new kakao.maps.LatLng("${x[1]}","${y[1]}")
		       } , {title : '<div class="customoverlay"><span class="title">' +"${title[2]}",
			latlng : new kakao.maps.LatLng("${x[2]}","${y[2]}")
		       } , {title : '<div class="customoverlay"><span class="title">' +"${title[3]}",
			latlng : new kakao.maps.LatLng("${x[3]}","${y[3]}")
		       } , {title : '<div class="customoverlay"><span class="title">' +"${title[4]}",
			latlng : new kakao.maps.LatLng("${x[4]}","${y[4]}")
		       } , {title : '<div class="customoverlay"><span class="title">' +"${title[5]}",
			latlng : new kakao.maps.LatLng("${x[5]}","${y[5]}")
		       }
		]
		if(myArray[5].latlng == '(0, 0)'){
			myArray.splice(5, 1);
		}
		if(myArray[4].latlng == '(0, 0)'){
			myArray.splice(4, 1);
		}
		if(myArray[3].latlng == '(0, 0)'){
			myArray.splice(3, 1);
		}
		if(myArray[2].latlng == '(0, 0)'){
			myArray.splice(2, 1);
		}
		if(myArray[1].latlng == '(0, 0)'){
			myArray.splice(1, 1);
		}
		//var kk = prompt("키키키 ? ","0");
		//document.write("kk : "+kk);
		
		console.log("myArray[0].title : "+myArray[0].title);
		console.log("myArray[0].latlng : "+myArray[0].latlng);
		
		
		//myArray[i] = {title : 'kk',
		//		latlng : new kakao.maps.LatLng("${x[0]}","${y[0]}")}
		
		//for(var i=0; i<5; i+=1){
		//	myArray[i].title = ${homepage[i]};
		//	myArray[i].latlng = new kakao.maps.LatLng("${x[i]}",'${y[i]}');
		//}
		
		
		var bounds = new kakao.maps.LatLngBounds(); //지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성한다.
		//var selectedMarker=null;//클릭한 마커를 담을 변수
		var selectedOverlay=null;//클릭한 오버레이를 담을 변수
		var length = myArray.length; 
		var overlay=null;
		console.log("myArray.length : " + length);
		//console.log("myArray[0] : " + myArray[0].latlng.toString());
		//console.log("myArray[1] : " + myArray[1].latlng.toString());
		//console.log("myArray[2] : " + myArray[2].latlng.toString());
		// 지도에 선을 표시한다 
		for (var i = 0; i < myArray.length - 1; i++) {
			var polyline = new kakao.maps.Polyline({
				map : map, // 선을 표시할 지도 객체 
				path : [ // 선을 구성하는 좌표 배열
				myArray[i].latlng, myArray[i + 1].latlng ],
				strokeWeight : 3, // 선의 두께
				strokeColor : '#FF0000', // 선 색
				strokeOpacity : 0.9, // 선 투명도
				strokeStyle : 'solid' // 선 스타일
			});
		}
		/*for (var j = myArray.length - 2; j < myArray.length - 1; j++) {
			var polyline = new kakao.maps.Polyline({
				map : map, // 선을 표시할 지도 객체 
				path : [ // 선을 구성하는 좌표 배열
				myArray[i].latlng, myArray[i + 1].latlng ],
				endArrow : true, // 선의 끝을 화살표로 표시되도록 설정한다
				strokeWeight : 3, // 선의 두께
				strokeColor : '#FF0000', // 선 색
				strokeOpacity : 0.9, // 선 투명도
				strokeStyle : 'solid' // 선 스타일
			});
		}*/
		// 도형에 mouseover 이벤트를 등록한다 
		kakao.maps.event.addListener(polyline, 'mouseover', function() {
			console.log('도형에 mouseover 이벤트가 발생했습니다!');
		});

		// 도형에 mouseout 이벤트를 등록한다 
		kakao.maps.event.addListener(polyline, 'mouseout', function() {
			console.log('도형에 mouseout 이벤트가 발생했습니다!');
		});

		// 도형에 mousedown 이벤트를 등록한다
		kakao.maps.event.addListener(polyline, 'mousedown', function() {
			console.log('도형에 mousedown 이벤트가 발생했습니다!');
		});
		/*
		
		var markerImageUrl  = 'http://t1.daumcdn.net/localimg/localimages/07/2012/img/marker_p.png'; // // 마커 이미지의 주소
		var markerImageSize = new kakao.maps.Size(40,42), // 마커 이미지의 크기
		markerImageOptions={offset : new kakao.maps.Point(20,42)}; // 마커 좌표에 일치시킬 이미지 안의 좌표
		
		var markerImage=new kakao.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);
   		*/
   		//var markerImageUrl="http://t1.daumcdn.net/localimg/localimages/07/2018/pc/flagImg/blue_b.png";
   		var markerImageUrl1="https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num1.png" ,
   		    markerImageUrl2="https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num2.png" ,
   		    markerImageUrl3="https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num3.png" ,
   		    markerImageUrl4="https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num4.png" ,
   		    markerImageUrl5="https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num5.png" ,
   		    markerImageUrl6="https://korean.visitkorea.or.kr/resources/images/sub/icon_map_num6.png" ,
   		    markerImageSize = new kakao.maps.Size(26.36),
   		    markerImageOptions={offset : new kakao.maps.Point(15,35)};
   		
   		//마커 이미지 생성
   		var markerImage = new Array();
   		
   		markerImage[0] = new kakao.maps.MarkerImage(markerImageUrl1, markerImageSize, markerImageOptions);
   		markerImage[1] = new kakao.maps.MarkerImage(markerImageUrl2, markerImageSize, markerImageOptions);
   		markerImage[2] = new kakao.maps.MarkerImage(markerImageUrl3, markerImageSize, markerImageOptions);
   		markerImage[3] = new kakao.maps.MarkerImage(markerImageUrl4, markerImageSize, markerImageOptions);
   		markerImage[4] = new kakao.maps.MarkerImage(markerImageUrl5, markerImageSize, markerImageOptions);
   		markerImage[5] = new kakao.maps.MarkerImage(markerImageUrl6, markerImageSize, markerImageOptions);
		for (var i = 0; i < myArray.length; i++) {
			addMarker(myArray[i].latlng,myArray[i].title,i);
			
			
		}
		//bounds들을 기준으로 지도 영역을 재설정(설정)한다.
		map.setBounds(bounds);
		
		
		function addMarker(position,content,i){
			var marker=new kakao.maps.Marker({
				position:position,
				map:map,
				image : markerImage[i],
				clickable: true 
			});
			 
			
			bounds.extend(position);
			
			
			kakao.maps.event.addListener(marker, 'click', function() {
				map.panTo(position);
				overlay = new kakao.maps.CustomOverlay({
		        	content: content,
		        	map: map,
		        	position: position,    
		        	yAnchor:0.08
				});
			});
			kakao.maps.event.addListener(marker, 'click', function() {
				 if (!selectedOverlay || selectedOverlay !== overlay) {
			         	!!selectedOverlay && selectedOverlay.setMap(null);
			         	overlay.setMap(map);
			         	//selectedOverlay.setMap(null);
			        	selectedOverlay=overlay;
			        }
			});
		}
		
		
		
		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
     			overlay.setMap(null);     
		}
	<%
	}else{
		System.out.println("여행지를 추가하세요.");
	}
	%>
	</script>
</body>
</html>



