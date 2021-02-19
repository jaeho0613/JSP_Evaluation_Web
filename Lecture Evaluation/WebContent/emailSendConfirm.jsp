<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>강의평가 웹 사이트</title>

	<!-- 부트스트랩 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css" />
	<!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css" />
</head>

<body>

	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if (userID == null) {
		PrintWriter wr = response.getWriter();
		wr.println("<script>");
		wr.println("alert('로그인을 해주세요.');");
		wr.println("location.href = 'userLogin.jsp'");
		wr.println("</script>");
		wr.close();
		return;
	}
	%>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">메인</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 회원 관리 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
						if (userID == null) {
						%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a> <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<%
						} else {
						%>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<%
						}
						%>
					</div>
				</li>
			</ul>
			<form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
				<input type="text" name="search" class="form-control mr-sm-2" type="search"
					placeholder="내용을 입력하세요." aria-label="Search" />
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
					검색</button>
			</form>
		</div>
	</nav>

	<!-- 중앙 컨텐트 -->
	<section class="container mt-3" style="max-width: 560px;">
		<div class="alert alert-warning mt-4" role="alert">
			이메일 주소 인증을 하셔야 이용 가능합니다. 인증 메일을 받지 못하셨나요?
		</div>
		<a href="emailSendAction.jsp" class="btn btn-primary">인증 메일 다시 받기</a>
	</section>

	<footer class="bg-dark mt-4 p-5 text-center" style="color: white;">
		Copyright &copy; 2021 정재호 All Rights Reserved. </footer>

	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>

</html>