<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>jiriguessr</title>
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
		  <form class="form-signin">
		  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
  			<input type="email" class="form-control" placeholder="아이디" required autofocus>
  			<input type="password" class="form-control" placeholder="비밀번호" required>
  			<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
		</form>
		</div>
	</div>
	
</body>
</html>