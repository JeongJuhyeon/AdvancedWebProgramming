<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>geoguess</title>

</head>

<body>
    <!-- 로드뷰를 표시할 div 입니다 -->
    <div id="pano" style="width:90%;height:600px;"></div>
    <div>
        <input type="range" id="slide" style="width:90%" value="0" min="-180" max="180" oninput="setDir(value)">
    </div>
    <div>
        <input id="btn" type="button" id="start" value="start" onclick="startGame()">
        <input type="radio" name="difficulty" value="1" onchange="difficultyChange(value)" checked>1km
        <input type="radio" name="difficulty" value="10" onchange="difficultyChange(value)">10km
        <input type="radio" name="difficulty" value="100" onchange="difficultyChange(value)">100km
    </div>
    <div id="map" style="width:100%;height:300px;"></div>
    <script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fhco9ogb8u&submodules=panorama"></script>
    <script src="./resources/js/game.js"></script>
</body>

</html>