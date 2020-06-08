fetch("/api/start")
.then((res) => res.json())
.then((json) => {
  $("test").html(json["lat"] + ", " + json["long"]);
});
