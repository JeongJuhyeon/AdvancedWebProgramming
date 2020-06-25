<!-- ���ӽ����� ȭ�� -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
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
    h3.title{
    	position:absolute;
    	left:300px;
		top:100px;
    }
    img.title{
    	position:absolute;
    	left:220px;
		top:150px;
    }
    .content1{
    	position:absolute;
    	left:600px;
		top:120px;
    }
    .content2{
    	position:absolute;
    	left:600px;
		top:55px;
    }
    .content3{
    	position:absolute;
    	left:525px;
    	bottom:0px;
    }
    
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="side.jsp" />
	<br>
	<h3 class="title" style="color:white">���� ����</h3>
	<img class="title" alt="" src="./resources/images/korea.jpg" style="width:300px">
		
	<div id="pano" style="width:0px;height:0px;"></div>
		
	<div class="content1" style="color:white">
		<input id="btn" type="button" class="content3 btn btn-success btn-lg" id="start" value="start" onclick="startGame()">
        <input type="radio" name="difficulty" value="1" onchange="difficultyChange(value)" checked>1km
        <input type="radio" name="difficulty" value="10" onchange="difficultyChange(value)">10km
        <input type="radio" name="difficulty" value="100" onchange="difficultyChange(value)">100km
    </div>
	<div class="content2" id="map" style="width:600px;height:600px;"></div>
	<script type="text/javascript"
        	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fhco9ogb8u&submodules=panorama"></script>
	<script>
        let errorCount = 0;
        let distance;
        let selectPos;
        let guessPos;
        let answer;
        let score;
        let diff = 1;
        let searching = false;
        let highScore = new Array(10);
        let btn = document.getElementById("btn");
        let pano = new naver.maps.Panorama("pano", {
            position: new naver.maps.LatLng(35.887792, 128.6120759)
        });
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(36, 127),
            zoom: 6
        });
        let marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(0, 0),
            map: map
        });
        let rectangle = new naver.maps.Rectangle({
            map: map,
            bounds: new naver.maps.LatLngBounds(
                new naver.maps.LatLng(0, 0),  // sw
                new naver.maps.LatLng(0, 0)   // ne
            ),
            strokeColor: '#5347AA',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#E51D1A',
            fillOpacity: 0.1
        });
        naver.maps.Event.addListener(map, 'click', function (e) {
                btn.style.display = "none";
                rectangle.setMap(null);
                searching = true;
                selectPos = e.latlng;
                marker.setPosition(selectPos);
                pano.setPosition(new naver.maps.LatLng(selectPos.y + (Math.random() - 0.5) / 111 * diff, selectPos.x + (Math.random() - 0.5) / 88 * diff));
                pano.setPov({
                    pan: 0,
                    tilt: 15,
                    fov: 100
                });
        });
        naver.maps.Event.addListener(pano, "pano_status", function (panoramaStatus) {
            if (errorCount > 100) {
                errorCount = 0;
                searching = false;
                alert("�ش� ��ġ ��ó�� �ε�䰡 �����ϴ�.");
            }
            if (panoramaStatus === "ERROR" && searching === true) {
                errorCount++;
                pano.setPosition(new naver.maps.LatLng(selectPos.y + (Math.random() - 0.5) / 111 * diff, selectPos.x + (Math.random() - 0.5) / 88 * diff));
                pano.setPov({
                    pan: 0,
                    tilt: 15,
                    fov: 100
                })
            }
            else if (searching === true) {
                btn.style.display = "block";
                searching = false;
                rectangle.setMap(map);
                rectangle.setBounds(new naver.maps.LatLngBounds(
                    new naver.maps.LatLng(selectPos.y - 0.5 / 111 * diff, selectPos.x + 0.5 / 88 * diff),  // sw
                    new naver.maps.LatLng(selectPos.y + 0.5 / 111 * diff, selectPos.x - 0.5 / 88 * diff)   // ne
                ));
            }
        });

        function setDir(value) {
            pano.setPov({
                pan: value,
                tilt: 15,
                fov: 100
            });
        }
        function startGame() {
            btn.style.display = "none";
            errorCount = 0;
            //game.jsp�� �÷��̾ ������ ��ġ ����
            location.href="game.jsp";
            setCookie("id",pano.getPanoId(),1);
            setCookie("x",selectPos.x,1);
            setCookie("y",selectPos.y,1);
            setCookie("diff",diff,1);
        }
        var setCookie = function (name, value, exp) {
            var date = new Date();
            date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
            document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
        };
        function difficultyChange(value) {
            diff = value;
            rectangle.setMap(null);
            btn.style.display = "none";
            searching = true;
            marker.setPosition(selectPos);
            pano.setPosition(new naver.maps.LatLng(selectPos.y + (Math.random() - 0.5) / 111 * diff, selectPos.x + (Math.random() - 0.5) / 88 * diff));
            pano.setPov({
                pan: 0,
                tilt: 15,
                fov: 100
            });
            rectangle.setBounds(new naver.maps.LatLngBounds(
                new naver.maps.LatLng(selectPos.y - 0.5 / 111 * diff, selectPos.x + 0.5 / 88 * diff),  // sw
                new naver.maps.LatLng(selectPos.y + 0.5 / 111 * diff, selectPos.x - 0.5 / 88 * diff)   // ne
            ));
        }
        btn.style.display = "none";
    </script>
</body>
</html>