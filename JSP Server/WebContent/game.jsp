<!-- 게임화면 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jiriguessr</title>
<style type="text/css">
    #pano{ pointer-events: none; }
	body{
  		background-color: #35363a;
  	}
  	
</style>
</head>
<body>
   <!-- 로드뷰를 표시할 div 입니다 -->
    <div id="pano" style="width:100%;height:600px;"></div>
    <div>
        <input type="range" id="slide" style="width:100%" value="0" min="-180" max="180" oninput="setDir(value)">
    </div>
    <div id="map" style="width:100%;height:300px;"></div>
    <script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fhco9ogb8u&submodules=panorama"></script>
    <script>
        let distance;
        let y;
        let x;
        let guessPos;
        let answer;
        let start;
        let end;
        let score;
        let id;
        let diff;
        let highScore = new Array(10);
        let pano;
        let getCookie = function (name) {
            let value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
            return value ? value[2] : null;
        };
        id = getCookie("id");
        x = getCookie("x") * 1;        
        y = getCookie("y")*1;
        pano = new naver.maps.Panorama("pano", {
        });
        pano.setPanoId(id);
        console.log(id);
        naver.maps.Event.addListener(pano, "init", function () {
            answer = pano.getPosition();
            console.log(answer);
            pano.setVisible(true);
            pano.setPov({
                pan: -70,
                tilt: 20,
                fov: 100
            });
        });
        diff = getCookie("diff")*1;
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(y, x),
            zoom: 8
        });
        let rectangle = new naver.maps.Rectangle({
            map: map,
            bounds: new naver.maps.LatLngBounds(
               new naver.maps.LatLng(y - 0.5 / 111 * diff, x + 0.5 / 88 * diff),  // sw
                new naver.maps.LatLng(y + 0.5 / 111 * diff, x - 0.5 / 88 * diff)   // ne
            ),
            strokeColor: '#5347AA',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: '#E51D1A',
            fillOpacity: 0.1
        });
        
        if(diff < 10){
           map.setZoom(14);
        }
        else if(diff < 100){
           map.setZoom(11);
        }
        
        errorCount = 0;
        start = new Date().getTime();
        naver.maps.Event.addListener(pano, "init", function () {
            pano.setVisible(true);
            answer = pano.getPosition();
            pano.setPov({
                pan: 0,
                tilt: 15,
                fov: 100
            });
        });
        
        naver.maps.Event.addListener(map, 'click', function (e) {
                guessPos = e.latlng;
                distance = Math.sqrt(Math.abs(answer.x - guessPos.x) * 88 * Math.abs(answer.x - guessPos.x) * 88 + Math.abs(answer.y - guessPos.y) * 111 * Math.abs(answer.y - guessPos.y) * 111);
                console.log(distance);
                    end = new Date().getTime();
                    score = 1/ ((distance * (end - start)) / 1000) * 10000;
                    score = Math.round(score);
                    setCookie("score",score,1);
                    location.href="rank.jsp";
          
        });
        
        function setDir(value) {
            pano.setPov({
                pan: value,
                tilt: 15,
                fov: 100
            });
        }
        var setCookie = function (name, value, exp) {
            var date = new Date();
            date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
            document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
        };
    </script>
</body>
</html>
