<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Jiriguessr</title>
</head>
<body>
<jsp:include page="menu1.jsp" />
<div class="content">
		<div class="form-container">
		  <form class="form-login" action="./loginAction.jsp" method="post">
		  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
  			<input type="text" id="username" class="form-control" name="userID" placeholder="아이디" required autofocus>
  			<input type="password" id="password" class="form-control" name="userPassword" placeholder="비밀번호" required><br/>
  			<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
  			
		</form>
		<br>
		<a href="signup.jsp">회원가입</a>
		</div>
	</div>
</body>
</html>