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
		  <form class="form-signup">
		  <h1 class="h3 mb-3 font-weight-normal">회원가입</h1>
  			<input type="text" id="username" class="form-control" name="username" placeholder="아이디" required autofocus>
  			<input type="password" id="password1" class="form-control" name="password1" placeholder="비밀번호" required>
  			<input type="password" id="password2" class="form-control" name="password2" placeholder="비밀번호 확인" required></br>
  			<button id="submitbtn" class="btn btn-lg btn-success btn-block" type="submit">회원가입</button>
		</form>
		</div>
	</div>
</body>
</html>