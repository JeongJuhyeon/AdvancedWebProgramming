<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>jiriguessr</title>
	<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		.form-container {
			position: relative;
			top: 50px;
			margin: 0 auto;
			width: 600px;
		}
		h1 {
			color: white
		}
	</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="side.jsp" />
	<div class="content">
		<div class="form-container">
		  <form class="form-login">
		  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
  			<input type="text" id="username" class="form-control" name="username" placeholder="아이디" required autofocus>
  			<input type="password" id="password" class="form-control" name="password" placeholder="비밀번호" required><br/>
  			<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
		</form>
		</div>
	</div>
</body>
</html>