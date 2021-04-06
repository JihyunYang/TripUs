<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--
	This file is a sample of how to create a local accordion menu (이 파일은 지역 아코디언 메뉴를 만드는 방법에 대한 샘플이다.)
	Also, This file has been downloaded from Bootsnipp.com (또한, 이 파일은 부트스트랩.com에서 다운로드 되었습니다.)
	-->
	<title>AreaAccordionMenu Sample</title>
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>	
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
		
	<style type="text/css">
		body {
			margin-top: 50px;
		}

		.glyphicon {
			margin-right: 10px;
		}

		.panel-body {
			padding: 0px;
		}

		.panel-body table tr td {
			padding-left: 15px
		}

		.panel-body .table {
			margin-bottom: 0px;
		}
	</style>

</head>

<body>
	<!--Regional category (지역 카테고리)-->
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3">
				<div class="panel-group" id="accordion">
					<!--Seoul Area Information (서울 지역 정보)-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">서울</a>
							</h4>
						</div>
						
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="">#강남구</a></td>
										<td><a href="">#도봉구</a></td>
										<td><a href="">#동대문구</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<!--Gyeonggi Area Information (경기 지역 정보)-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">경기</a>
							</h4>
						</div>
						
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="">#가평군</a></td>
										<td><a href="">#동두천시</a></td>
										<td><a href="">#부천시</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<!--Busan area information (부산 지역 정보)-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">부산</a>
							</h4>
						</div>
						
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="">#강서구</a></td>
										<td><a href="">#사하구</a></td>
										<td><a href="">#서구</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					
					<!--Daegu Area Information (대구 지역 정보)-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">대구</a>
							</h4>
						</div>
						
						<div id="collapseFour" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="">#남구</a></td>
										<td><a href="">#달서구</a></td>
										<td><a href="">#달성구</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<!--Daejeon Area Information (대전 지역 정보)-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">대전</a>
							</h4>
						</div>
						
						<div id="collapseFive" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="">#강서구</a></td>
										<td><a href="">#사하구</a></td>
										<td><a href="">#서구</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<!--Gwangju Area Information (광주 지역 정보)-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseSix">광주</a>
							</h4>
						</div>
						
						<div id="collapseSix" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="">수영구</a></td>
										<td><a href="">사하구</a></td>
										<td><a href="">서구</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<!--Gangwon area information (강원 지역 정보)-->
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">강원</a>
							</h4>
						</div>
						
						<div id="collapseSeven" class="panel-collapse collapse">
							<div class="panel-body">
								<table class="table">
									<tr>
										<td><a href="">수영구</a></td>
										<td><a href="">사하구</a></td>
										<td><a href="">서구</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end of Regional category container-->
</body>
</html>