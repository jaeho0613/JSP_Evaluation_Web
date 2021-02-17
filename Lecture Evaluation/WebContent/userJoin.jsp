<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">메인</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            회원 관리
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="userLogin.jsp">로그인</a>
            <a class="dropdown-item" href="userJoin.jsp">회원가입</a>
            <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
          </div>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search" />
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
          검색
        </button>
      </form>
    </div>
  </nav>

  <!-- 중앙 컨텐트 -->
  <section class="container mt-3" style="max-width: 560px;">
    <form action="./userRegisterAction.jsp" method="post">
      <div class="form-group">
        <label>아이디</label>
        <input type="text" name="userID" class="form-control">
      </div>
      <div class="form-group">
        <label>비밀번호</label>
        <input type="password" name="userPassword" class="form-control">
      </div>
      <div class="form-group">
        <label>이메일</label>
        <input type="email" name="userEmail" class="form-control">
      </div>
      <button type="submit" class="btn btn-primary">회원가입</button>
    </form>
  </section>

  <footer class="bg-dark mt-4 p-5 text-center" style="color: white;">
    Copyright &copy; 2021 정재호 All Rights Reserved.
  </footer>

  <!-- 제이쿼리 자바스크립트 추가하기 -->
  <script src="./js/jquery.min.js"></script>
  <!-- 파퍼 자바스크립트 추가하기 -->
  <script src="./js/popper.min.js"></script>
  <!-- 부트스트랩 자바스크립트 추가하기 -->
  <script src="./js/bootstrap.min.js"></script>
</body>

</html>