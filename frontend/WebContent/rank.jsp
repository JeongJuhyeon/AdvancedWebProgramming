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
		<div id="score" style="color:white"></div>
		<div id="highScore" style="color:white">easy  id: xxx score : 0000</div>
		<div id="highScore" style="color:white">normal id: yyy score : 0000</div>
		<div id="highScore" style="color:white">hard id: zzz score : 0000</div>
		<input id="btn" type="button" id="main" value="메인 메뉴로" onclick="endGame()">
	</center>
<script>
let board =document.getElementById("score");
let score;
let getCookie = function (name) {
    let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return value ? value[2] : null;
};
score = getCookie("score");
board.innerHTML=score;
let endGame = function()
{
    location.href="main.jsp";
	}
</script>
</body>
</html>