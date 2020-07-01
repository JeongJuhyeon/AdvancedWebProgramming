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
    .navbar-brand#logo{	
   		color: white;
   		font-size: 2rem;
   		font-weight: 100;
   	} 
   	
    #bar{
    	background-color:#404147;
    }
</style>
</head>
<body>
	<nav id="bar" class = "navbar navbar-expand navbar-light fixed-top">
		<div class="container-fluid">
			<div class="navvar-header">
				<a id="logo" class="navbar-brand" href="./main.jsp">Jiriguessr</a>
			</div>
		</div>
	</nav>
</body>
</html>