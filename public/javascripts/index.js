function goToGame() {
  // TODO change  this to coordinates received from click on  map
  let lat = 123;
  let long = 456;
  fetch("/api/start/" + lat + "/" + long, { method: "POST" }).then(() => {
    window.location.pathname = "/game";
  });
}
