<!-- 메인화면 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>Jiriguessr</title>
<style type="text/css">

	.btn-success:active,
	.btn-success:visited,
	.btn-success:active:focus,
	.btn-success:active:hover {
    	border-color: #74DF00;
    	background-color: #74DF00;
    	color: #000; 
    	}
	
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="side.jsp" />
	<center>
		<br>
		<div style="color:white">메인화면</div>
	<form action="login.jsp" method="post">
User name :<input type="text" name="usr" /><br>
password :<input type="password" name="password" /><br>
<input type="submit" /> </form>
<p>New user. <a href="register.html">Click Here</a>. 
	</center>
</body>
</html>