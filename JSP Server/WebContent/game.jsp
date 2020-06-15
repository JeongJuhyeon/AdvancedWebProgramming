<!-- 게임화면 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Jiriguessr</title>
</head>
<body>
	<!-- 로드뷰를 표시할 div 입니다 -->
    <div id="pano" style="width:90%;height:600px;"></div>
    <div>
        <input type="range" id="slide" style="width:90%" value="0" min="-180" max="180" oninput="setDir(value)">
    </div>
    <div id="map" style="width:100%;height:300px;"></div>
    <script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fhco9ogb8u&submodules=panorama"></script>
    <script>
    	temp=location.href.split("?") 
    	data=temp[1].split(":") 
        let errorCount = 0;
        let distance;
        let selectPos;
        let y = data[0]*1;
        let x = data[1]*1;
        let guessPos;
        let answer;
        let start;
        let end;
        let score;
        let diff = data[2];
        let highScore = new Array(10);
        let btn = document.getElementById("btn");
        let pano = new naver.maps.Panorama("pano", {
            position: new naver.maps.LatLng(y + (Math.random() - 0.5) / 111 * diff, x + (Math.random() - 0.5) / 88 * diff)
        });
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(y, x),
            zoom: 8
        });
        let marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(y, x),
            map: map
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
            pano.setPov({
                pan: -70,
                tilt: 20,
                fov: 100
            });
        });
        
        naver.maps.Event.addListener(map, 'click', function (e) {
                guessPos = e.latlng;
                distance = Math.sqrt(Math.abs(answer.x - guessPos.x) * 88 * Math.abs(answer.x - guessPos.x) * 88 + Math.abs(answer.y - guessPos.y) * 111 * Math.abs(answer.y - guessPos.y) * 111);
                console.log(distance);
                if (Math.abs(answer.x - guessPos.x) <= 0.1 / 88 * diff && Math.abs(answer.y - guessPos.y) <= 0.1 / 111 * diff) {
                    console.log("correct");
                    end = new Date().getTime();
                    score = (end - start) / 1000;
                    alert(score);
            }
        });
        naver.maps.Event.addListener(pano, "pano_status", function (panoramaStatus) {
        	 if (panoramaStatus === "ERROR") {
                 errorCount++;
                 pano.setPosition(new naver.maps.LatLng(y + (Math.random() - 0.5) / 111 * diff, x + (Math.random() - 0.5) / 88 * diff));
                 pano.setPov({
                     pan: 0,
                     tilt: 15,
                     fov: 100
                 })
             }
        	else{
                answer = pano.getPosition();
                btn.style.display = "block";
                searching = false;
                rectangle.setMap(map);
                rectangle.setBounds(new naver.maps.LatLngBounds(
                    new naver.maps.LatLng(y - 0.5 / 111 * diff, x + 0.5 / 88 * diff),  // sw
                    new naver.maps.LatLng(y + 0.5 / 111 * diff, x - 0.5 / 88 * diff)   // ne
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
    </script>
</body>
</html>