<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jiriguessr</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
    div.target{
    	position:absolute;
    	left:300px;
		top:100px;
		color:white;
    }      
</style>
<script>
	var result = [];
	let url = "http://localhost:3002/api/scores"
	fetch(url)
		 .then(function(response) {
		   return response.json();
		 })
		 .then(function(myJson) {
		   $.each(myJson, function(i,item){
			   i++;
			   result.push('<h3>'+i+"위 "+item.name+" "+item.score+'</h3>');	   
		   })
		   $('.target').html(result);
		 });
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="side.jsp" />
	<br>
	<div class ="target"></div>
</body>
</html>