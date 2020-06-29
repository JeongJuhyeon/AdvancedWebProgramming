<!-- 게임설명 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jiriguessr</title>
<style type="text/css">
	
	li.img {
   		list-style:none;
   		display:inline-block;
	}
	
	img{
		display: inline-block;
    	width: 400px;
    	height: 450px;
	}
	img.title{
		width: 500px;
    	height: 450px;
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
		<ul>
			<li class="img"><img alt="" src="./resources/images/explain1.PNG" style="display:block;"><div style="color:white;">먼저, 반경을 선택하세요.<br>숫자가 클 수록 난이도가 높아집니다.</div></li>
			<li class="img"><img alt="" src="./resources/images/explain2.PNG" style="display:block;"><div style="color:white;">지도의 원하는 장소를 클릭하면<br> 게임시작 버튼이 나타납니다.</div></li>
			<li class="img"><img class="title" alt="" src="./resources/images/explain3.PNG" style="display:block;"><div style="color:white;">게임을 시작하면, 선택한 장소에서 설정한 반경만큼 범위가 나타납니다.<br> 이 범위 내에있는 사진의 위치를 추측하여 찾아보세요.</div></li>
		</ul>
	</center>
</body>
</html>