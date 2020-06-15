let errorCount = 0;
let distance;
let isGameStarted = false;
let selectPos;
let guessPos;
let answer;
let start;
let end;
let score;
let diff = 1;
let searching = false;
let highScore = new Array(10);
let btn = document.getElementById("btn");
let pano = new naver.maps.Panorama("pano", {
  position: new naver.maps.LatLng(35.887792, 128.6120759),
});
let map = new naver.maps.Map("map", {
  center: new naver.maps.LatLng(36, 127),
  zoom: 6,
});
let marker = new naver.maps.Marker({
  position: new naver.maps.LatLng(0, 0),
  map: map,
});
let rectangle = new naver.maps.Rectangle({
  map: map,
  bounds: new naver.maps.LatLngBounds(
    new naver.maps.LatLng(0, 0), // sw
    new naver.maps.LatLng(0, 0) // ne
  ),
  strokeColor: "#5347AA",
  strokeOpacity: 0.8,
  strokeWeight: 2,
  fillColor: "#E51D1A",
  fillOpacity: 0.1,
});
naver.maps.Event.addListener(pano, "init", function () {
  pano.setVisible(true);
  pano.setPov({
    pan: -70,
    tilt: 20,
    fov: 100,
  });
});
naver.maps.Event.addListener(map, "click", function (e) {
  if (isGameStarted === false) {
    btn.style.display = "none";
    rectangle.setMap(null);
    searching = true;
    selectPos = e.latlng;
    marker.setPosition(selectPos);
    pano.setPosition(
      new naver.maps.LatLng(
        selectPos.y + ((Math.random() - 0.5) / 111) * diff,
        selectPos.x + ((Math.random() - 0.5) / 88) * diff
      )
    );
    pano.setPov({
      pan: 0,
      tilt: 15,
      fov: 100,
    });
  }
  if (isGameStarted === true) {
    guessPos = e.latlng;
    distance = Math.sqrt(
      Math.abs(answer.x - guessPos.x) *
        88 *
        Math.abs(answer.x - guessPos.x) *
        88 +
        Math.abs(answer.y - guessPos.y) *
          111 *
          Math.abs(answer.y - guessPos.y) *
          111
    );
    console.log(distance);
    if (
      Math.abs(answer.x - guessPos.x) <= (0.1 / 88) * diff &&
      Math.abs(answer.y - guessPos.y) <= (0.1 / 111) * diff
    ) {
      console.log("correct");
      end = new Date().getTime();
      score = (end - start) / 1000;
      alert(score);
    }
  }
});
naver.maps.Event.addListener(pano, "pano_status", function (panoramaStatus) {
  if (errorCount > 100) {
    errorCount = 0;
    searching = false;
    alert("해당 위치 근처에 로드뷰가 없습니다.");
  }
  if (panoramaStatus === "ERROR" && searching === true) {
    errorCount++;
    pano.setPosition(
      new naver.maps.LatLng(
        selectPos.y + ((Math.random() - 0.5) / 111) * diff,
        selectPos.x + ((Math.random() - 0.5) / 88) * diff
      )
    );
    pano.setPov({
      pan: 0,
      tilt: 15,
      fov: 100,
    });
  } else if (searching === true) {
    answer = pano.getPosition();
    btn.style.display = "block";
    searching = false;
    rectangle.setMap(map);
    rectangle.setBounds(
      new naver.maps.LatLngBounds(
        new naver.maps.LatLng(
          selectPos.y - (0.5 / 111) * diff,
          selectPos.x + (0.5 / 88) * diff
        ), // sw
        new naver.maps.LatLng(
          selectPos.y + (0.5 / 111) * diff,
          selectPos.x - (0.5 / 88) * diff
        ) // ne
      )
    );
  }
});

function setDir(value) {
  pano.setPov({
    pan: value,
    tilt: 15,
    fov: 100,
  });
}
function startGame() {
  btn.style.display = "none";
  errorCount = 0;
  start = new Date().getTime();
  isGameStarted = true;
}
function difficultyChange(value) {
  diff = value;
  rectangle.setMap(null);
  btn.style.display = "none";
  searching = true;
  marker.setPosition(selectPos);
  pano.setPosition(
    new naver.maps.LatLng(
      selectPos.y + ((Math.random() - 0.5) / 111) * diff,
      selectPos.x + ((Math.random() - 0.5) / 88) * diff
    )
  );
  pano.setPov({
    pan: 0,
    tilt: 15,
    fov: 100,
  });
  rectangle.setBounds(
    new naver.maps.LatLngBounds(
      new naver.maps.LatLng(
        selectPos.y - (0.5 / 111) * diff,
        selectPos.x + (0.5 / 88) * diff
      ), // sw
      new naver.maps.LatLng(
        selectPos.y + (0.5 / 111) * diff,
        selectPos.x - (0.5 / 88) * diff
      ) // ne
    )
  );
}
btn.style.display = "none";
