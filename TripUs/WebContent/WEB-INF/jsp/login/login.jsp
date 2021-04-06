<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%!String mid = "";%>
<%!String mname = "";%>
<%!String memail = "";%>
<%!String mgrade = "";%>
<%!HttpSession hs = null;%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link href="/img/tripFavicons.png" rel="icon">

<style>
.bs-example {
	margin: 20px;
}

.header1 {
	font-size: 2em;
}

.button {
	font-family: 나눔고딕;
	background-color: #80AAD4;
	border: none;
	color: white;
	width: 223px;
	height: 47px;
	text-align: center;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	border-radius: 12px;
}
</style>
<script type="text/javascript">
	function login() {
		//alert("로그인 버튼 누름~");
		var id = $("#mid").val();
		var pw = $("#mpw").val();

		$.ajax({
			url : "/login/memberLogin.do",
			type : "GET",
			data : {
				mid : id,
				mpw : pw
			},
			dataType : "text",
			success : function(data) {
				console.log("data : " + data);
				if (data == "true") {
					//alert("로그인 성공. 메인페이지로 이동");
					document.loginForm.action = "/login/goIndex.do";
					document.loginForm.submit();
				} else if (data == "false") {
					alert("일치하는 회원 정보가 없습니다. 다시 입력해주세요.");

				} else {
					console.log("? 컨트롤러 뭐함");
				}
			},
			error : function(data) {
				console.log("에러발생");
			}
		});
	}
</script>
</head>
<body>
	<%
		hs = request.getSession(true);
		mid = (String) hs.getAttribute("mid");
		if (mid != null) {
	%>
	<p>
	<h3>이미 로그인 중입니다!</h3>
	</p>
	<br>로그아웃 후 로그인해주세요
	<a href="/login/goIndex.do">메인페이지로</a>
	<%
		} else {
	%>

	<form name="loginForm" method="POST">
		<div class="form-group">
			<label>아이디</label> <input type="email" class="form-control mx-sm-2"
				id="mid" name="mid" />
		</div>
		<div class="form-group">
			<label>비밀번호</label> <input type="password"
				class="form-control mx-sm-0" id="mpw" name="mpw"> <small
				class="text-muted">* 소문자,특수문자,숫자를 포함한 8~15자를 입력해주세요. </small>
		</div>

		<div style="text-align: center;">
			<div style="margin-bottom: 7px; margin-top: 35px;">
				<input type="button" class="button" value="로그인" onclick="login()">
			</div>
			<div style="margin-bottom: 7px;">
				<a href="/signup/insertForm.do" role="button">
				<input type="button" class="button" value="회원가입">
				</a>
			</div>
			<a class="naver" href="/login/naverLogin.do" role="button"> <img
				width="223px"
				src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
			</a>
		</div>

		<br>
		<br>
		<center>
			<p>
				<a href="/login/goIdFind.do">아이디</a> <a href="/login/goSearchPW.do">/
					비밀번호 찾기</a>
			</p>
		</center>
	</form>
	<%
		}
	%>
</body>
</html>