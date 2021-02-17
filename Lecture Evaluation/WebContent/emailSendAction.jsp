<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.mail.*"%>
<%@ page import="java.util.Properties"%>
<%@ page import="util.Gmail"%>
<%@ page import="user.UserDTO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<%
UserDAO userDAO = new UserDAO();
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

boolean emailChecked = userDAO.getUserEmailChecked(userID);
if (emailChecked == true) {
	PrintWriter wr = response.getWriter();
	wr.println("<script>");
	wr.println("alert('이미 인증 된 회원입니다.');");
	wr.println("location.href = 'index.jsp'");
	wr.println("</script>");
	wr.close();
	return;
}

String host = "http://localhost:8080/Lecture_Evaluation/";
String from = "jeaho0613@gmail.com";
String to = userDAO.getUserEmail(userID);
String subject = "강의평가를 위한 이메일 인증 메일입니다.";
String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." + "<a href='" + host + "emailCheckAction.jsp?code="
		+ new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

//메일 환경 변수 설정입니다.
Properties props = new Properties();
//메일 프로토콜은 gmail를 이용할 것이기 때문에 smtp로 사용합니다.
props.setProperty("mail.transport.protocol", "smtp");
//메일 호스트 주소를 설정합니다.
props.setProperty("mail.host", "smtp.gmail.com");
//ID, Password 설정이 필요합니다.
props.put("mail.smtp.auth", "true");
//port는 465입니다.
props.put("mail.smtp.port", "465");
//ssl를 사용할 경우 설정합니다.
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");
props.setProperty("mail.smtp.quitwait", "false");

try {
	Authenticator auth = new Gmail();
	Session ses = Session.getInstance(props, auth);
	ses.setDebug(true);

	MimeMessage msg = new MimeMessage(ses);
	msg.setSubject(subject);

	Address formAddr = new InternetAddress(from);
	msg.setFrom(formAddr);

	Address toAddr = new InternetAddress(to);
	msg.addRecipient(Message.RecipientType.TO, toAddr);
	msg.setContent(content, "text/html; charset=utf-8");
	Transport.send(msg);

} catch (Exception e) {
	e.printStackTrace();
	PrintWriter wr = response.getWriter();
	wr.println("<script>");
	wr.println("alert('오류가 발생했습니다.')");
	wr.println("histroy.back();");
	wr.println("</script>");
	wr.close();
	return;
}
%>

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

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">메인</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 회원 관리 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item active" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
					</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search" />
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
					검색</button>
			</form>
		</div>
	</nav>

	<!-- 중앙 컨텐트 -->
	<section class="container mt-3" style="max-width: 560px;">
		<div class="alert alert-success mt-4" role="alert">
			이메일 주소 인증 메일이 전송되었습니다. 회원가입시 입력했던 이메일에 들어가셔서 인증해주세요.
		</div>
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