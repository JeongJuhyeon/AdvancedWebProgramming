<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
	<meta charset="UTF-8">
	<title>Jiriguessr</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style type="text/css">
		.btn-success:active,
		.btn-success:visited,
		.btn-success:active:focus,
		.btn-success:active:hover {
			border-color: #74DF00;
			background-color: #74DF00;
			color: #000;
		}

		div.target {
			position: absolute;
			left: 300px;
			top: 100px;
			color: white;
		}
	</style>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="side.jsp" />
	<center>
		<br>
		<div id="score" style="color:white"></div>
		<div id="highScore" style="color:white">easy id: xxx score : 0000</div>
		<div id="highScore" style="color:white">normal id: yyy score : 0000</div>
		<div id="highScore" style="color:white">hard id: zzz score : 0000</div>
		<input id="btn" type="button" id="main" value="���� �޴���" onclick="endGame()">
		<br>
		<div class="target"></div>
	</center>
</body>
<script>
	let board = document.getElementById("score");
	let score;
	let getCookie = function (name) {
		let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value ? value[2] : null;
	};
	score = getCookie("score");
	board.innerHTML = score;
	let endGame = function () {
		location.href = "main.jsp";
	}
	var result = [];
	let url = "http://localhost:3002/api/scores"
	fetch(url)
		.then(function (response) {
			return response.json();
		})
		.then(function (myJson) {
			$.each(myJson, function (i, item) {
				i++;
				result.push('<h3>' + i + "위 " + item.name + " " + item.score + '</h3>');
			})
			$('.target').html(result);
		});
</script>
</html>