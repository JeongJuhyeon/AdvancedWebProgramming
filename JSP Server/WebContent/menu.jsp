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
    #bar{
    	background-color:#404147;
    }
   	.navbar-brand#logo{	
   		color: white;
   		font-size: 2rem;
   		font-weight: 100;
   	} 
   	#btnlogout{
   	    background-color: transparent !important;
   	    border: 0px;
   	    color: white;
   	}
    
</style>
</head>
<body>
	<script>
	var setCookie = function (name, value, exp) {
		var date = new Date();
        date.setTime(0);
        document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
    };
		let logout = function () {
			setCookie("userID",0,1);
			location.href = "index.jsp";
	}
	</script>
	<nav id = "bar" class = "navbar navbar-expand navbar-light fixed-top">
		<div class="container-fluid">
			<div class="navvar-header">
				<a id="logo" class="navbar-brand" href="./main.jsp" >Jiriguessr</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><input id="btnlogout" type="button" id="logout" value="로그아웃 " onclick="logout()"></li>
			</ul>
		</div>
	</nav>
</body>
</html>