<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.api.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

@font-face {
   font-family: 'Handon3gyeopsal300g';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal300g.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

@font-face {
   font-family: 'Handon3gyeopsal600g';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/Handon3gyeopsal600g.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}


.title {
   font-family: 'Handon3gyeopsal600g';
}

#content{
	 font-family: 'Handon3gyeopsal300g';
}

.thumbnail {
   font-family: 'Handon3gyeopsal300g';
   width: 228px;
   height: 270px;
   margin-left: 20px;
   margin-bottom: 50px;
}


.img1 {
   width: 218px;
   height: 163.5px;
}

.img1 img {
   position: absolute;
   top: 0;
   left: 0;
   width: 218px;
   height: auto;
}
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		var img = new Array();
		var title = new Array();
		var content = new Array();
		function detail(viewno) {
			
  			location.href = "../coBoard/goBoard.do?viewno="+viewno;
		}
		function aa(id,i){
			$.ajax({
				url : '../../CoBoPublicData.do',
				type : 'get',
				data : {contentID:id},
				dataType : 'json',
				async : false,
				success : function(data) {
					console.log(data.response.body.items.item);
					myItem = data.response.body.items.item;
					img[i] = '<img src="'+myItem.firstimage+'"  class="img-rounded" alt="대표이미지" style="margin-left: 40px;margin-top: 3px;"/>';
					title[i] ='<h4><b>'+myItem.title+'</b></h4>';
					//title[i] +='<p>'+ myItem.overview+'</p>';
					console.log("title["+i+"] : "+title[i]);
					//$(".commentList").html(output);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					//alert("Status: " + textStatus);
					//alert("Error: " + errorThrown);
				}
			});
		}
		
		$(document).ready(function(){
			$('input').filter("#contentID").each(function(index,element){
				var contentid =$(element).val();
				console.log((index+1)+"번째 contentID  :" +contentid);	
				
				aa(contentid,index);
				
				//$(element).val(index+1);
			});
			
			$('div').filter(".img1").each(function(index,element){
				$(element).html(img[index]);	
			});
			$('div').filter("#content").each(function(index,element){
				$(element).html(title[index]);	
			});
			
			
		});
	</script>
</head>
<body>
<br><br>
<div style="float: left; width: 70%;">
	<div class="container2">
		<div id="head" style="margin-left: 40px; margin-bottom: 20px;">
		<h1 id="title">추천 코스</h1>
	</div>
		<br><hr>
	   	<form name="coListForm" method="POST">
	      	<div class="row">
		     	<c:forEach var="coList" items="${coBoardList}">
		     		<div class="col-md-4">
			     		<div class="thumbnail">
			     			<div class="img1" onclick="detail('${coList.viewno}')">
			     			</div>
			     			<div class="card-body">
			       				<input type="hidden" id="contentID" name="contentID" value="${coList.contentid}"/> 
			       				<input type="hidden"  id="viewno" name="viewno"  value="${coList.viewno}"/>
			       				<input type="hidden" id="viewname" name="viewname" value="${coList.viewname}"/>
			       				<div id="content" onclick="detail('${coList.viewno}')">
			       				</div>
			       			</div>
		       			</div>
		       		</div>		 
		        </c:forEach>
	        </div>
		</form>
	</div>
</div>
<div style="margin-bottom:200px;"></div>
</body>
</html>