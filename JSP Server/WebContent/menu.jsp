<!-- 메뉴-->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>6</title>
<style>
    a{
    	position:relative;
    	left:10px;
    }
    a.nav-link{
    	font-weight:bold;
    	font-size:18px;
    }
    body{
    	padding-top:74px;
    }
</style>
</head>
<body>
	<nav class = "navbar navbar-expand navbar-light fixed-top bg-success">
		<div class="container-fluid">
			<div class="navvar-header">
				<a class="navbar-brand" href="./main.jsp"><font size="6px">Jiriguessr</font></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a class="nav-link" href="./signup.jsp">회원가입</a></li>
      			<li><a class="nav-link" href="./login.jsp">로그인</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>