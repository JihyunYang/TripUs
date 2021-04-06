<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--
	This file is a sample of how to create an accordion menu 
	that displays simple information about the user at login 
	(이 파일은 로그인시 이용자에 대한 간단한 정보를 보여줄 아코디언 메뉴를 만드는 방법에 대한 샘플이다)
	Also, This file has been downloaded from Bootsnipp.com (또한, 이 파일은 부트스트랩.com에서 다운로드 되었습니다.)
	-->
	<title>LoginAccordionMenu Sample</title>

	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

	<style type="text/css">
		.navbar-login {
			width: 305px;
			padding: 10px;
			padding-bottom: 0px;
		}

		.navbar-login-session {
			padding: 10px;
			padding-bottom: 0px;
			padding-top: 0px;
		}

		.icon-size {
			font-size: 87px;
		}
	</style>
</head>

<body>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

			</div>
			
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
				</ul>
				
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
										<div class="col-lg-4">
											<p class="text-center">
												<span class="glyphicon glyphicon-user icon-size"></span>
											</p>
										</div>
										
										<div class="col-lg-8">
											<p class="text-left">
												<strong>이용자님</strong>
											</p>
											<p class="text-left small">tripUs@email.com</p>
											<p class="text-left">
												<a href="#" class="btn btn-primary btn-block btn-sm">My page</a>
											</p>
										</div>
									</div>
								</div>
							</li>
							
							<li class="divider"></li>
							<li>
								<div class="navbar-login navbar-login-session">
									<div class="row">
										<div class="col-lg-12">
											<p>
												<a href="#" class="btn btn-danger btn-block">logout</a>
											</p>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
