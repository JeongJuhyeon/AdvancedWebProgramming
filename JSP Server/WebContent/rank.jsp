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
			color: white;
			padding-top: 100px;
		}
		
		#container {
			display: flex;
			position: relative;
			margin-left: 20%;
			padding-left: 0px;
		}
		input {
			    text-align: center;
    padding-right: 10px;
    padding-left: 10px;
    font-weight: 200;
		}
		
		#id {
			padding-top: 40px; 
		}
		
	
		
		#id, #score {
		text-align: center;
		}
		
		#btndiv {
			padding: 0%;
			padding-top: 10px;
			min-width: 250px;
			min-height: 1000px;
			position: relative;
			/*text-align: center*/
		}
		
		#btnspan {
			text-align: center;
			display: block;
		}
		
		.btns {
			display: inline-block;
			font-weight: 200;

		}
		
		#btnspan input {
		background-color: #1f8f39;
		border-color: #1f8f39;
		color: white;
		}
		
		#leftdiv {
			    padding-right: 70px;
    padding-left: 150px;
    padding-top: 60px;
		}
		
		.target h3 {
			font-weight: 150;
		}
		
		
	</style>
</head>

<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="side.jsp" />
	<div id="container">
		<div id="leftdiv">
			<br>
			<div id="id" style="color:white; font-size:xx-large;"></div>
			<div id="score" style="color:white; font-size:xx-large;"></div>	
			<div id="btndiv">
			<span id="btnspan">
				<input id="btnend" class="btns btn btn-sm" type="button" value="메인으로 가기" onclick="endGame()">
				<input id="btnrank" class="btns btn btn-sm" type="button" value="랭킹에 점수 등록 " onclick="rank()">
				</span>
			</div>
			<br>
		</div>
		<div class="target"></div>
	</div>
</body>
<script>
	let board = document.getElementById("score");
	let board1 = document.getElementById("id");
	let score;
	let userID;
	
	let getCookie = function (name) {
		let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		return value ? value[2] : null;
	};
	
	score = getCookie("score");
	userID = getCookie("userID");
	
	board1.innerHTML = "ID: " + userID;
	board.innerHTML =  "Score: " + score;
	let endGame = function () {
		location.href = "main.jsp";
	}
	let rank = function() {
		let url1 = "http://localhost:3002/api/scores/"+userID+"/"+ score;
		fetch(url1,{method:'POST',headers:{'Content-Type':'application/json'}})
		.then((res)=> {
			return res.json();
		});
		location.href = "rank.jsp";
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