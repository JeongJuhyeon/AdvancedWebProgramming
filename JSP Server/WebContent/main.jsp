<!-- 메인화면 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css">
<meta charset="EUC-KR">
<title>Jiriguessr</title>
<script>
let userid;
let getCookie = function (name) {
            let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
            return value ? value[2] : null;
        };
userid= getCookie("userID");
if(userid == null){
location.href="index.jsp";
}
</script>
<style type="text/css">

	.btn-success:active,
	.btn-success:visited,
	.btn-success:active:focus,
	.btn-success:active:hover {
    	border-color: #74DF00;
    	background-color: #74DF00;
    	color: #000; 
    	}
	
	li.img {
   		list-style:none;
   		display:inline-block;
	}
	
	img{
		display: inline-block;
    	width: 400px;
    	height: 300px;
	}
	
	center{
		position:absolute;
		left:200px;
	}

</style>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="side.jsp" />
	<center>
		<br>
		<h3 style="color:white">환영합니다!</h3>
		<h3 style="color:white">대한민국의 각 지역을 사진으로 직접 찾아보세요</h3>
		<ul>
			<li class="img"><img class="title" alt="" src="./resources/images/seoul.jpg"></li>
			<li class="img"><img class="title" alt="" src="./resources/images/busan.jpg"></li>
			<li class="img"><img class="title" alt="" src="./resources/images/andong.jpg"></li>
		</ul>
		<h5 style="color:white">Team Jiri</h5>
	</center>
</body>
</html>